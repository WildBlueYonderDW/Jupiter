// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_killstreaks.gsc;
#using scripts\mp\killstreaks\autosentry.gsc;
#using scripts\mp\killstreaks\placeable.gsc;

#namespace namespace_a66db7c7eeb0e963;

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x221
// Size: 0xf8
function bot_killstreak_sentry(killstreak_info, killstreaks_array, can_use, var_39e02a8a79b6ba4c) {
    self endon("bot_sentry_exited");
    self endon("death_or_disconnect");
    level endon("game_ended");
    wait(randomintrange(3, 5));
    while (isdefined(self.sentry_place_delay) && gettime() < self.sentry_place_delay) {
        wait(1);
    }
    if (isdefined(self.enemy) && self.enemy.health > 0 && self botcanseeentity(self.enemy)) {
        return 1;
    }
    targetpoint = self.origin;
    if (var_39e02a8a79b6ba4c != "hide_nonlethal") {
        targetpoint = bot_sentry_choose_target(var_39e02a8a79b6ba4c);
        if (!isdefined(targetpoint)) {
            return 1;
        }
    }
    bot_sentry_add_goal(killstreak_info, targetpoint, var_39e02a8a79b6ba4c, killstreaks_array);
    while (bot_has_tactical_goal("sentry_placement")) {
        wait(0.5);
    }
    return 1;
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x321
// Size: 0x107
function bot_sentry_add_goal(killstreak_info, targetorigin, var_39e02a8a79b6ba4c, killstreaks_array) {
    placement = bot_sentry_choose_placement(killstreak_info, targetorigin, var_39e02a8a79b6ba4c, killstreaks_array);
    if (isdefined(placement)) {
        bot_abort_tactical_goal("sentry_placement");
        var_4f3b05e382bb8c7c = spawnstruct();
        var_4f3b05e382bb8c7c.object = placement;
        var_4f3b05e382bb8c7c.script_goal_yaw = placement.yaw;
        var_4f3b05e382bb8c7c.script_goal_radius = 10;
        var_4f3b05e382bb8c7c.start_thread = &bot_sentry_path_start;
        var_4f3b05e382bb8c7c.end_thread = &bot_sentry_cancel;
        var_4f3b05e382bb8c7c.should_abort = &bot_sentry_should_abort;
        var_4f3b05e382bb8c7c.action_thread = &bot_sentry_activate;
        self.placingitemstreakname = killstreak_info.streakname;
        bot_new_tactical_goal("sentry_placement", placement.node.origin, 0, var_4f3b05e382bb8c7c);
    }
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42f
// Size: 0x69
function bot_sentry_should_abort(var_f37a20ef92906796) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (isdefined(self.enemy) && self.enemy.health > 0 && self botcanseeentity(self.enemy)) {
        return 1;
    }
    self.sentry_place_delay = gettime() + 1000;
    return 0;
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a0
// Size: 0x6e
function bot_sentry_cancel_failsafe() {
    self endon("death_or_disconnect");
    self endon("bot_sentry_canceled");
    self endon("bot_sentry_ensure_exit");
    level endon("game_ended");
    while (1) {
        if (isdefined(self.enemy) && self.enemy.health > 0 && self botcanseeentity(self.enemy)) {
            thread bot_sentry_cancel();
        }
        wait(0.05);
    }
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x515
// Size: 0x15
function bot_sentry_path_start(var_f37a20ef92906796) {
    thread bot_sentry_path_thread(var_f37a20ef92906796);
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x531
// Size: 0xfd
function bot_sentry_path_thread(var_f37a20ef92906796) {
    self endon("stop_tactical_goal");
    self endon("stop_goal_aborted_watch");
    self endon("bot_sentry_canceled");
    self endon("bot_sentry_exited");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (isdefined(var_f37a20ef92906796.object) && isdefined(var_f37a20ef92906796.object.weapon)) {
        if (distance2d(self.origin, var_f37a20ef92906796.object.node.origin) < 400) {
            thread bot_force_stance_for_time("stand", 5);
            thread bot_sentry_cancel_failsafe();
            bot_switch_to_killstreak_weapon(var_f37a20ef92906796.object.killstreak_info, var_f37a20ef92906796.object.killstreaks_array, var_f37a20ef92906796.object.weapon);
            return;
        }
        wait(0.05);
    }
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x635
// Size: 0xf2
function bot_sentry_choose_target(var_39e02a8a79b6ba4c) {
    var_1d14ff4f8b8e125b = defend_valid_center();
    if (isdefined(var_1d14ff4f8b8e125b)) {
        return var_1d14ff4f8b8e125b;
    }
    if (isdefined(self.node_ambushing_from)) {
        return self.node_ambushing_from.origin;
    }
    nodes = getnodesinradius(self.origin, 1000, 0, 512);
    var_def8cd540eab8dc = 5;
    if (var_39e02a8a79b6ba4c != "turret") {
        if (self botgetdifficultysetting("strategyLevel") == 1) {
            var_def8cd540eab8dc = 10;
        } else if (self botgetdifficultysetting("strategyLevel") == 0) {
            var_def8cd540eab8dc = 15;
        }
    }
    if (var_39e02a8a79b6ba4c == "turret_air") {
        targetnode = self botnodepick(nodes, var_def8cd540eab8dc, "node_exposed", "ignore_no_sky");
    } else {
        targetnode = self botnodepick(nodes, var_def8cd540eab8dc, "node_exposed");
    }
    if (isdefined(targetnode)) {
        return targetnode.origin;
    }
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x72e
// Size: 0x196
function bot_sentry_choose_placement(killstreak_info, targetorigin, var_39e02a8a79b6ba4c, killstreaks_array) {
    placement = undefined;
    nodes = getnodesinradius(targetorigin, 1000, 0, 512);
    var_def8cd540eab8dc = 5;
    if (var_39e02a8a79b6ba4c != "turret") {
        if (self botgetdifficultysetting("strategyLevel") == 1) {
            var_def8cd540eab8dc = 10;
        } else if (self botgetdifficultysetting("strategyLevel") == 0) {
            var_def8cd540eab8dc = 15;
        }
    }
    if (var_39e02a8a79b6ba4c == "turret_air") {
        var_e9c28adb2aed652c = self botnodepick(nodes, var_def8cd540eab8dc, "node_sentry", targetorigin, "ignore_no_sky");
    } else if (var_39e02a8a79b6ba4c == "trap") {
        var_e9c28adb2aed652c = self botnodepick(nodes, var_def8cd540eab8dc, "node_exposed");
    } else if (var_39e02a8a79b6ba4c == "hide_nonlethal") {
        var_e9c28adb2aed652c = self botnodepick(nodes, var_def8cd540eab8dc, "node_hide");
    } else {
        var_e9c28adb2aed652c = self botnodepick(nodes, var_def8cd540eab8dc, "node_sentry", targetorigin);
    }
    if (isdefined(var_e9c28adb2aed652c)) {
        placement = spawnstruct();
        placement.node = var_e9c28adb2aed652c;
        if (targetorigin != var_e9c28adb2aed652c.origin && var_39e02a8a79b6ba4c != "hide_nonlethal") {
            placement.yaw = vectortoyaw(targetorigin - var_e9c28adb2aed652c.origin);
        } else {
            placement.yaw = undefined;
        }
        placement.weapon = killstreak_info.weapon;
        placement.killstreak_info = killstreak_info;
        placement.killstreaks_array = killstreaks_array;
    }
    return placement;
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8cc
// Size: 0x48
function bot_sentry_carried_obj() {
    if (isdefined(self.carriedsentry)) {
        return self.carriedsentry;
    }
    if (isdefined(self.carriedims)) {
        return self.carriedims;
    }
    if (isdefined(self.carrieditem)) {
        return self.carrieditem;
    }
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x91b
// Size: 0x29b
function bot_sentry_activate(var_f37a20ef92906796) {
    result = 0;
    var_e3bc187f22497ecb = bot_sentry_carried_obj();
    if (isdefined(var_e3bc187f22497ecb)) {
        abort = 0;
        if (!var_e3bc187f22497ecb.canbeplaced) {
            var_199798d5fd510aea = 0.75;
            start_time = gettime();
            var_2a3d6a9f19c6b30f = self.angles[1];
            if (isdefined(var_f37a20ef92906796.object.yaw)) {
                var_2a3d6a9f19c6b30f = var_f37a20ef92906796.object.yaw;
            }
            var_b039ace808558a68 = [];
            var_b039ace808558a68[0] = var_2a3d6a9f19c6b30f + 180;
            var_b039ace808558a68[1] = var_2a3d6a9f19c6b30f + 135;
            var_b039ace808558a68[2] = var_2a3d6a9f19c6b30f - 135;
            mindist = 1000;
            foreach (moveyaw in var_b039ace808558a68) {
                hitpos = playerphysicstrace(var_f37a20ef92906796.object.node.origin, var_f37a20ef92906796.object.node.origin + anglestoforward((0, moveyaw + 180, 0)) * 100);
                dist = distance2d(hitpos, var_f37a20ef92906796.object.node.origin);
                if (dist < mindist) {
                    mindist = dist;
                    self botsetscriptmove(moveyaw, var_199798d5fd510aea);
                    self botlookatpoint(var_f37a20ef92906796.object.node.origin, var_199798d5fd510aea, "script_forced");
                }
            }
            while (!abort && isdefined(var_e3bc187f22497ecb) && !var_e3bc187f22497ecb.canbeplaced) {
                var_3e7539402ee4d0f1 = float(gettime() - start_time) / 1000;
                if (!var_e3bc187f22497ecb.canbeplaced && var_3e7539402ee4d0f1 > var_199798d5fd510aea) {
                    abort = 1;
                    self.sentry_place_delay = gettime() + 30000;
                }
                wait(0.05);
            }
        }
        if (isdefined(var_e3bc187f22497ecb) && var_e3bc187f22497ecb.canbeplaced) {
            bot_send_place_notify();
            result = 1;
        }
    }
    wait(0.25);
    bot_sentry_ensure_exit();
    return result;
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbbe
// Size: 0x1b
function bot_send_place_notify() {
    self notify("place_sentry");
    self notify("place_ims");
    self notify("placePlaceable");
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe0
// Size: 0x35
function bot_send_cancel_notify() {
    self switchtoweapon("none");
    self enableweapons();
    self enableweaponswitch();
    self notify("cancel_sentry");
    self notify("cancel_ims");
    self notify("cancelPlaceable");
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc1c
// Size: 0x22
function bot_sentry_cancel(var_f37a20ef92906796) {
    self notify("bot_sentry_canceled");
    bot_send_cancel_notify();
    bot_sentry_ensure_exit();
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc45
// Size: 0x9a
function bot_sentry_ensure_exit() {
    self notify("bot_sentry_abort_goal_think");
    self notify("bot_sentry_ensure_exit");
    self endon("bot_sentry_ensure_exit");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self switchtoweapon("none");
    self botclearscriptgoal();
    self botsetstance("none");
    self enableweapons();
    self enableweaponswitch();
    wait(0.25);
    attempts = 0;
    while (isdefined(bot_sentry_carried_obj())) {
        attempts++;
        bot_send_cancel_notify();
        wait(0.25);
        if (attempts > 2) {
            bot_sentry_force_cancel();
        }
    }
    self notify("bot_sentry_exited");
}

// Namespace namespace_a66db7c7eeb0e963/namespace_801ecbe77f23300b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xce6
// Size: 0x7f
function bot_sentry_force_cancel() {
    if (isdefined(self.carriedsentry)) {
        self.carriedsentry namespace_d3164761cc58a612::sentry_setcancelled();
    }
    if (isdefined(self.carrieditem)) {
        self.carrieditem namespace_cac9ec0529ef7f4d::oncancel(self.placingitemstreakname, 0);
    }
    self.carriedsentry = undefined;
    self.carriedims = undefined;
    self.carrieditem = undefined;
    self switchtoweapon("none");
    self enableweapons();
    self enableweaponswitch();
}

