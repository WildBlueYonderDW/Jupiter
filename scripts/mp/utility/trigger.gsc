// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2583ee5680cf4736;

#namespace trigger;

// Namespace trigger/namespace_f1565a2788ab1e89
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d
// Size: 0x6a
function triggerutilityinit() {
    var_559b1c2dc581f10c = getentarray("trigger_multiple_mp_enterexit", "classname");
    foreach (trigger in var_559b1c2dc581f10c) {
        makeenterexittrigger(trigger);
    }
}

// Namespace trigger/namespace_f1565a2788ab1e89
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e
// Size: 0x42
function makeenterexittrigger(trigger, var_dd47832cd570074b, var_be3314f77fef5d6b, var_1fa4e076aba70ab9, var_768b0479668f27b, var_7de0efbf334063a9) {
    trigger thread triggerenterthink(var_dd47832cd570074b, var_be3314f77fef5d6b, var_1fa4e076aba70ab9, var_768b0479668f27b, var_7de0efbf334063a9);
}

// Namespace trigger/namespace_f1565a2788ab1e89
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7
// Size: 0x116
function triggerenterthink(var_dd47832cd570074b, var_be3314f77fef5d6b, var_1fa4e076aba70ab9, var_768b0479668f27b, var_7de0efbf334063a9) {
    level endon("game_ended");
    self endon("death");
    self.triggerenterents = [];
    self.triggerinsidetimes = [];
    thread triggerexitthink(var_be3314f77fef5d6b, var_768b0479668f27b);
    while (1) {
        var_2d9552508615d396 = self waittill("trigger");
        if (isdefined(var_7de0efbf334063a9) && [[ var_7de0efbf334063a9 ]](var_2d9552508615d396, self)) {
            continue;
        }
        var_6b6f0d5308b1ceab = var_2d9552508615d396 getentitynumber();
        if (!isdefined(self.triggerenterents[var_6b6f0d5308b1ceab])) {
            self notify("trigger_enter", var_2d9552508615d396);
            if (isdefined(var_dd47832cd570074b)) {
                var_2d9552508615d396 thread [[ var_dd47832cd570074b ]](var_2d9552508615d396, self);
            }
            if (isdefined(var_1fa4e076aba70ab9)) {
                var_2d9552508615d396 notify(var_1fa4e076aba70ab9, self);
            }
            self.triggerenterents[var_6b6f0d5308b1ceab] = var_2d9552508615d396;
            self.triggerinsidetimes[var_6b6f0d5308b1ceab] = gettime();
        } else {
            self.triggerinsidetimes[var_6b6f0d5308b1ceab] = gettime();
        }
        /#
            assert(self.triggerenterents.size == self.triggerinsidetimes.size);
        #/
    }
}

// Namespace trigger/namespace_f1565a2788ab1e89
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x120
function triggerexitthink(var_be3314f77fef5d6b, var_768b0479668f27b) {
    level endon("game_ended");
    self endon("death");
    while (1) {
        waittillframeend();
        /#
            assert(self.triggerenterents.size == self.triggerinsidetimes.size);
        #/
        var_291148d7c3e8d5e3 = gettime();
        foreach (entid, ent in self.triggerenterents) {
            if (!isdefined(ent)) {
                self.triggerenterents[entid] = undefined;
                self.triggerinsidetimes[entid] = undefined;
            } else {
                /#
                    assert(isdefined(self.triggerinsidetimes[entid]));
                #/
                if (self.triggerinsidetimes[entid] < var_291148d7c3e8d5e3) {
                    self notify("trigger_exit", ent);
                    if (isdefined(var_be3314f77fef5d6b)) {
                        ent thread [[ var_be3314f77fef5d6b ]](ent, self);
                    }
                    if (isdefined(var_768b0479668f27b)) {
                        ent notify(var_768b0479668f27b, self);
                    }
                    self.triggerenterents[entid] = undefined;
                    self.triggerinsidetimes[entid] = undefined;
                }
            }
        }
        waitframe();
    }
}

// Namespace trigger/namespace_f1565a2788ab1e89
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41b
// Size: 0x84
function function_d7f524cd920e0c79() {
    flag_wait("StartGameTypeCallbackFinished");
    waitframe();
    var_c85c96521b9fa174 = getentarray("gesture_trigger", "script_noteworthy");
    if (!isdefined(var_c85c96521b9fa174)) {
        return;
    }
    foreach (gesture_trigger in var_c85c96521b9fa174) {
        function_32645103f7520635(gesture_trigger, undefined, undefined, &function_81b4c641c1611463);
    }
}

// Namespace trigger/namespace_f1565a2788ab1e89
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a6
// Size: 0x1f
function function_643debdd070d5477(var_6001320cbfd4d138) {
    if (!isdefined(var_6001320cbfd4d138)) {
        return;
    }
    self giveandfireoffhand(makeweapon(var_6001320cbfd4d138));
}

// Namespace trigger/namespace_f1565a2788ab1e89
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cc
// Size: 0x3d
function function_81b4c641c1611463(player) {
    var_15e599da51a42fc2 = "";
    if (isdefined(self.targetname)) {
        var_15e599da51a42fc2 = self.targetname;
    }
    player function_643debdd070d5477(var_15e599da51a42fc2);
}

