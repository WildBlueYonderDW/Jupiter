// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;

#namespace namespace_359eabeed0aa16a9;

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18a
// Size: 0x3
function function_1bdc76359002a87d() {
    
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x194
// Size: 0x30
function function_6c1e0eb333fee7fe() {
    thread function_d2c67316e3340d42();
    thread deathcleanup();
    self endon("death");
    self endon("disconnect");
    self endon("showing_final_killcam");
    childthread function_6a4d394e7f9fc34e();
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb
// Size: 0x68
function function_6a4d394e7f9fc34e() {
    while (1) {
        if (isdefined(self.currentweapon) && function_a48875a04bede9a6(self.currentweapon)) {
            if (isdefined(level.var_ca0f41fe9610167a) && level.var_ca0f41fe9610167a) {
                childthread function_844dc249ef1b3a5e();
            } else {
                childthread function_48c1bb804931bb07();
            }
            childthread function_808cd37a5a40862d();
        }
        self waittill("weapon_change");
    }
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23a
// Size: 0x3f
function function_a48875a04bede9a6(weaponobj) {
    if (isdefined(weaponobj) && isdefined(weaponobj.scope) && string_starts_with(weaponobj.scope, "snscope_drop")) {
        return 1;
    }
    return 0;
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x281
// Size: 0xaf
function function_48c1bb804931bb07() {
    self endon("weapon_change");
    contents = create_contents(1, 1, 1, 0, 0, 1, 0, 0, 0, 0);
    while (1) {
        waitframe();
        if (!self playerads()) {
            continue;
        }
        start = self geteye();
        end = ray_trace(start, start + anglestoforward(level.player getplayerangles()) * 99999, undefined, contents)["position"];
        distance = length(start - end);
        self setclientomnvar("ui_scope_range_finder_distance", int(distance * 0.0254));
    }
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x337
// Size: 0x6d
function function_844dc249ef1b3a5e() {
    self endon("weapon_change");
    thread function_46d948b40cc362dc();
    contents = create_contents(1, 1, 1, 0, 0, 1, 0, 0, 0, 0);
    while (1) {
        waitframe();
        while (isdefined(level.var_8d206297c3cb29d4)) {
            waitframe();
        }
        thread function_3e83a8605613947c(contents);
        while (!isdefined(level.var_8d206297c3cb29d4)) {
            waitframe();
        }
        level notify("target_sighted");
    }
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ab
// Size: 0x99
function function_3e83a8605613947c(contents) {
    level endon("target_sighted");
    while (1) {
        waitframe();
        if (!self playerads()) {
            continue;
        }
        start = self geteye();
        end = ray_trace(start, start + anglestoforward(level.player getplayerangles()) * 99999, undefined, contents)["position"];
        distance = length(start - end);
        self setclientomnvar("ui_scope_range_finder_distance", int(distance * 0.0254));
    }
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44b
// Size: 0x94
function function_46d948b40cc362dc() {
    lastenemy = undefined;
    thread function_86dae4285c17eba2();
    while (1) {
        waitframe();
        enemies = getaiarray("axis");
        if (enemies.size <= 0) {
            while (enemies.size <= 0) {
                waitframe();
                enemies = getaiarray("axis");
            }
        }
        currentenemy = [[ self.var_921001ec11dc92ab ]](enemies);
        if (!isdefined(currentenemy)) {
            continue;
        }
        if (!isdefined(lastenemy) || lastenemy != currentenemy) {
            level notify("target_changed");
        }
        lastenemy = currentenemy;
        waittillframeend();
        thread function_1e14956a236da6d8(currentenemy);
    }
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e6
// Size: 0x6b
function function_86dae4285c17eba2() {
    var_4899b13eea0b6db = undefined;
    while (!isdefined(var_4899b13eea0b6db)) {
        waitframe();
        var_4899b13eea0b6db = getaiarray("axis");
    }
    while (1) {
        waitframe();
        var_15415763f1df3112 = getaiarray("axis");
        if (!isdefined(var_15415763f1df3112)) {
            continue;
        }
        if (var_15415763f1df3112.size < var_4899b13eea0b6db.size) {
            var_4899b13eea0b6db = var_15415763f1df3112;
        } else if (var_15415763f1df3112.size > var_4899b13eea0b6db.size) {
            level notify("scope_timeout");
            var_4899b13eea0b6db = var_15415763f1df3112;
        }
    }
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x558
// Size: 0x75
function function_1e14956a236da6d8(enemy) {
    enemy endon("death");
    level endon("target_changed");
    while (1) {
        waitframe();
        if (!self playerads()) {
            continue;
        }
        start = self geteye();
        distance = length(start - enemy.origin);
        self setclientomnvar("ui_scope_range_finder_distance", int(distance * 0.0254));
    }
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d4
// Size: 0xa3
function function_808cd37a5a40862d() {
    self endon("weapon_change");
    while (1) {
        if (isdefined(level.var_ca0f41fe9610167a) && level.var_ca0f41fe9610167a) {
            function_e8ca271588171c26();
        } else if (self playerads() == 1 && self sprintbuttonpressed()) {
            var_de8c6ebea5cafecd = gettime();
            while (self playerads() == 1 && self sprintbuttonpressed()) {
                waitframe();
            }
            if (self playerads() == 1) {
                var_a0cba5c6f46200e = gettime() - var_de8c6ebea5cafecd;
                if (var_a0cba5c6f46200e < 200) {
                    function_e8ca271588171c26();
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67e
// Size: 0x75
function function_e8ca271588171c26() {
    range = self getclientomnvar("ui_scope_range_finder_distance");
    if (range < 30) {
        range = 0;
    }
    self setclientomnvar("ui_scope_range_finder_distance_locked", int(range));
    drop = function_621629aca9bfb262(range);
    self setclientomnvar("ui_scope_range_finder_bulletdrop", int(drop));
    self setclientomnvar("ui_scope_range_finder_bulletdrop_update", 1);
    waitframe();
    self setclientomnvar("ui_scope_range_finder_bulletdrop_update", 0);
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6fa
// Size: 0x5a
function function_621629aca9bfb262(range) {
    drop = math::normalize_value(0, 2000, range);
    var_ccbba16287668f0a = math::factor_value(0, 200, drop);
    if (isdefined(level.var_27b61226a83766df)) {
        var_ccbba16287668f0a = var_ccbba16287668f0a * 2.9;
    } else {
        var_ccbba16287668f0a = var_ccbba16287668f0a * 1.2;
    }
    return var_ccbba16287668f0a;
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x75c
// Size: 0x19
function function_d2c67316e3340d42() {
    waittill_any_3("death", "disconnect", "showing_final_killcam");
}

// Namespace namespace_359eabeed0aa16a9/namespace_6215040ccc256734
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77c
// Size: 0x1b
function deathcleanup() {
    self endon("disconnect");
    waittill_any_2("death", "showing_final_killcam");
}

