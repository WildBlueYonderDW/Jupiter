// mwiii decomp prototype
#using script_72a196b6c7df2f38;
#using scripts\engine\utility.gsc;

#namespace namespace_c512be518d3d717d;

// Namespace namespace_c512be518d3d717d/namespace_9957e512cf2d2a76
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe6
// Size: 0x6
function function_e514286a93d143da() {
    /#
    #/
}

// Namespace namespace_c512be518d3d717d/namespace_9957e512cf2d2a76
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf3
// Size: 0x39e
function function_7227ec8ef6d85118(var_2b23f2a75a7eb443, sequencename, var_589854ab7733eeb9) {
    var_3fb4893405249050 = self;
    /#
    #/
    var_6fb1514b3fe5c721 = [];
    var_49a8a024ff1caf4c = getscriptbundle("sequencescriptbundle:" + sequencename);
    var_3fb4893405249050.scenesequence = spawnstruct();
    var_3fb4893405249050.scenesequence.sequencename = sequencename;
    var_3fb4893405249050.scenesequence.var_49a8a024ff1caf4c = var_49a8a024ff1caf4c;
    var_3fb4893405249050.var_2b23f2a75a7eb443 = var_2b23f2a75a7eb443;
    var_3fb4893405249050.scenesequence.nodes = [];
    var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7 = [];
    var_3fb4893405249050.scenesequence.running = [];
    startnode = undefined;
    var_a2f0efa133d35b66 = undefined;
    foreach (scenenode in var_49a8a024ff1caf4c.var_fb1ddd6d96e073b1) {
        var_3fb4893405249050.scenesequence.nodes[scenenode.name] = scenenode;
        if (istrue(scenenode.var_3f62c90b71689589) && !isdefined(startnode)) {
            startnode = scenenode;
        }
        if (!isdefined(scenenode.scene)) {
            if (isdefined(var_589854ab7733eeb9)) {
                scenenode.scene = var_589854ab7733eeb9;
                if (!isdefined(var_a2f0efa133d35b66)) {
                    var_bf0ed7802686aa = getscriptbundle("scenescriptbundle:" + scenenode.scene);
                    var_a2f0efa133d35b66 = var_bf0ed7802686aa scene::function_8a37fe423de2b9db();
                }
                if (!isdefined(var_6fb1514b3fe5c721[scenenode.scene]) && array_contains(var_a2f0efa133d35b66, scenenode.shot)) {
                    var_6fb1514b3fe5c721[scenenode.scene] = scenenode.scene;
                }
            }
        } else if (isdefined(scenenode.scene) && !isdefined(var_6fb1514b3fe5c721[scenenode.scene])) {
            var_6fb1514b3fe5c721[scenenode.scene] = scenenode.scene;
        }
    }
    foreach (var_e25d1d189177a7c in var_6fb1514b3fe5c721) {
        var_bc084584b46923e7 = -1;
        if (isdefined(level.var_f99b1d319e65854c)) {
            for (i = 0; i < level.var_f99b1d319e65854c.size; i++) {
                if (level.var_f99b1d319e65854c[i] == var_e25d1d189177a7c) {
                    var_bc084584b46923e7 = i;
                    break;
                }
            }
        }
        if (var_bc084584b46923e7 >= 0) {
            var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7[var_e25d1d189177a7c] = level.var_a0b4eb1703be349a[var_bc084584b46923e7];
        } else {
            var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7[var_e25d1d189177a7c] = spawnstruct();
            var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7[var_e25d1d189177a7c].origin = var_3fb4893405249050.origin;
            var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7[var_e25d1d189177a7c].angles = var_3fb4893405249050.angles;
        }
    }
    thread function_e44f61b52352ea9(startnode);
}

// Namespace namespace_c512be518d3d717d/namespace_9957e512cf2d2a76
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x498
// Size: 0x2a
function private function_e44f61b52352ea9(startnode) {
    var_3fb4893405249050 = self;
    var_3fb4893405249050 thread function_fcafbb83f84886ce(startnode);
    var_3fb4893405249050 waittill("sequence_finished");
}

// Namespace namespace_c512be518d3d717d/namespace_9957e512cf2d2a76
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c9
// Size: 0x8b
function private function_a511762baca0da54(var_fe5e08b6494785e, shot, scene, var_2b23f2a75a7eb443, var_8ae676fd0285f8c2) {
    foreach (var_98c27a673e1335e9 in var_8ae676fd0285f8c2) {
        self endon(var_98c27a673e1335e9);
    }
    scene::play(var_2b23f2a75a7eb443, shot, scene);
    var_fe5e08b6494785e notify("Complete" + shot);
}

// Namespace namespace_c512be518d3d717d/namespace_9957e512cf2d2a76
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x55b
// Size: 0x3a9
function private function_fcafbb83f84886ce(currentnode) {
    var_3fb4893405249050 = self;
    var_fe5e08b6494785e = var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7[currentnode.scene];
    var_3fb4893405249050.scenesequence.running[currentnode.scene + "-" + currentnode.shot] = var_fe5e08b6494785e;
    var_926d6911427d0585 = [];
    var_3f8a8c5b87e149b1 = [];
    var_e06c9ea172ad5900 = [];
    var_90773fd2e792f06c = undefined;
    foreach (condition in currentnode.var_50f41da7fed36214) {
        if (condition.var_a3a06df92bada64e.size > 0) {
            if (condition.var_af751a0b5f90d1fd == "ConditionAndActive") {
                var_e06c9ea172ad5900[var_e06c9ea172ad5900.size] = condition;
                var_926d6911427d0585[var_926d6911427d0585.size] = condition;
                var_3f8a8c5b87e149b1[var_3f8a8c5b87e149b1.size] = condition.name;
            } else if (condition.var_af751a0b5f90d1fd == "ConditionAndComplete") {
                var_e06c9ea172ad5900[var_e06c9ea172ad5900.size] = condition;
            } else {
                var_90773fd2e792f06c = condition;
            }
        }
    }
    var_3fb4893405249050 thread function_a511762baca0da54(var_fe5e08b6494785e, currentnode.shot, currentnode.scene, var_3fb4893405249050.var_2b23f2a75a7eb443, var_3f8a8c5b87e149b1);
    foreach (condition in var_926d6911427d0585) {
        if (var_3fb4893405249050 ent_flag_exist(condition.name)) {
            var_3fb4893405249050 thread function_badcbfafbe025e43(currentnode, condition);
            return;
        }
    }
    var_3f8a8c5b87e149b1[var_3f8a8c5b87e149b1.size] = "Complete" + currentnode.shot;
    var_498eb82cbce10930 = var_fe5e08b6494785e waittill_any_in_array_return(var_3f8a8c5b87e149b1);
    if (var_498eb82cbce10930 == "Complete" + currentnode.shot) {
        if (!isdefined(var_90773fd2e792f06c) && var_e06c9ea172ad5900.size > 0) {
            var_b6b8a3e9e4f5d9f2 = [];
            foreach (condition in var_e06c9ea172ad5900) {
                var_b6b8a3e9e4f5d9f2[var_b6b8a3e9e4f5d9f2.size] = condition.name;
            }
            var_498eb82cbce10930 = var_fe5e08b6494785e waittill_any_in_array_return(var_b6b8a3e9e4f5d9f2);
        }
        foreach (condition in var_e06c9ea172ad5900) {
            if (var_498eb82cbce10930 == condition.name || var_3fb4893405249050 ent_flag_exist(condition.name)) {
                var_3fb4893405249050 thread function_badcbfafbe025e43(currentnode, condition);
                return;
            }
        }
        var_3fb4893405249050 thread function_badcbfafbe025e43(currentnode, var_90773fd2e792f06c);
        return;
    } else {
        foreach (condition in var_926d6911427d0585) {
            if (var_498eb82cbce10930 == condition.name || var_3fb4893405249050 ent_flag_exist(condition.name)) {
                var_3fb4893405249050 thread function_badcbfafbe025e43(currentnode, condition);
                return;
            }
        }
    }
}

// Namespace namespace_c512be518d3d717d/namespace_9957e512cf2d2a76
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x90b
// Size: 0x141
function private function_badcbfafbe025e43(currentnode, var_24abfb7461019502) {
    var_3fb4893405249050 = self;
    var_3fb4893405249050.scenesequence.running[currentnode.scene + "-" + currentnode.shot] = undefined;
    var_fe5e08b6494785e = var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7[currentnode.scene];
    var_fe5e08b6494785e function_5e4d2ddddbc6b48b(currentnode.shot);
    if (isdefined(var_24abfb7461019502)) {
        foreach (var_f5b7e2239c749b7b in var_24abfb7461019502.var_a3a06df92bada64e) {
            nextnode = var_3fb4893405249050.scenesequence.nodes[var_f5b7e2239c749b7b.var_dfd206830b573422];
            var_3fb4893405249050 thread function_fcafbb83f84886ce(nextnode);
        }
    }
    waitframe();
    if (var_3fb4893405249050.scenesequence.running.size == 0) {
        var_3fb4893405249050 notify("sequence_finished");
    }
}

// Namespace namespace_c512be518d3d717d/namespace_9957e512cf2d2a76
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa53
// Size: 0xa2
function function_d2345fa03215e539(note) {
    var_3fb4893405249050 = self;
    var_3fb4893405249050 notify(note);
    if (isdefined(var_3fb4893405249050.scenesequence) && isdefined(var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7)) {
        foreach (var_fe5e08b6494785e in var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7) {
            var_fe5e08b6494785e notify(note);
        }
    }
}

// Namespace namespace_c512be518d3d717d/namespace_9957e512cf2d2a76
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xafc
// Size: 0xc0
function function_2af98a24e1bf3199(var_891c23d72f418e61, note, objectname, repeat) {
    var_3fb4893405249050 = self;
    if (isdefined(var_3fb4893405249050.scenesequence) && isdefined(var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7)) {
        foreach (var_fe5e08b6494785e in var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7) {
            var_fe5e08b6494785e scene::function_8207074e79f22926(var_891c23d72f418e61, note, objectname, repeat);
        }
    }
}

// Namespace namespace_c512be518d3d717d/namespace_9957e512cf2d2a76
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbc3
// Size: 0x1d
function function_12b58037eff0f736(var_98c27a673e1335e9) {
    if (isstring(var_98c27a673e1335e9)) {
        ent_flag_set(var_98c27a673e1335e9);
    }
}

// Namespace namespace_c512be518d3d717d/namespace_9957e512cf2d2a76
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe7
// Size: 0x1f
function function_919ec256b1627543(var_98c27a673e1335e9) {
    if (isstring(var_98c27a673e1335e9)) {
        ent_flag_clear(var_98c27a673e1335e9, 1);
    }
}

// Namespace namespace_c512be518d3d717d/namespace_9957e512cf2d2a76
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xc0d
// Size: 0x20c
function function_d57898e86f3bb52f(scene, shotname, func, param1, param2, param3, param4) {
    var_3fb4893405249050 = self;
    var_fe5e08b6494785e = undefined;
    if (isstruct(scene)) {
        foreach (st in var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7) {
            if (st == scene) {
                var_fe5e08b6494785e = scene;
                break;
            }
        }
    } else if (isstring(scene)) {
        if (isdefined(var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7[scene])) {
            var_fe5e08b6494785e = var_3fb4893405249050.scenesequence.var_8b04ff8e32844af7[scene];
        }
    }
    if (isdefined(var_fe5e08b6494785e)) {
        if (!isdefined(var_fe5e08b6494785e.callbacks)) {
            var_fe5e08b6494785e.callbacks = [];
        }
        if (!isdefined(var_fe5e08b6494785e.callbacks[shotname])) {
            var_fe5e08b6494785e.callbacks[shotname] = [];
        }
        index = var_fe5e08b6494785e.callbacks[shotname].size;
        var_fe5e08b6494785e.callbacks[shotname][index] = spawnstruct();
        var_fe5e08b6494785e.callbacks[shotname][index].func = func;
        var_fe5e08b6494785e.callbacks[shotname][index].param1 = param1;
        var_fe5e08b6494785e.callbacks[shotname][index].param2 = param2;
        var_fe5e08b6494785e.callbacks[shotname][index].param3 = param3;
        var_fe5e08b6494785e.callbacks[shotname][index].param4 = param4;
    }
}

// Namespace namespace_c512be518d3d717d/namespace_9957e512cf2d2a76
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe20
// Size: 0x1a5
function private function_5e4d2ddddbc6b48b(shotname) {
    var_fe5e08b6494785e = self;
    if (isdefined(var_fe5e08b6494785e.callbacks) && isdefined(var_fe5e08b6494785e.callbacks[shotname])) {
        foreach (var_3dfbdc6f9aeb8197 in var_fe5e08b6494785e.callbacks[shotname]) {
            if (isdefined(var_3dfbdc6f9aeb8197.func)) {
                if (isdefined(var_3dfbdc6f9aeb8197.parm4)) {
                    self [[ var_3dfbdc6f9aeb8197.func ]](var_3dfbdc6f9aeb8197.parm1, var_3dfbdc6f9aeb8197.parm2, var_3dfbdc6f9aeb8197.parm3, var_3dfbdc6f9aeb8197.parm4);
                } else if (isdefined(var_3dfbdc6f9aeb8197.parm3)) {
                    self [[ var_3dfbdc6f9aeb8197.func ]](var_3dfbdc6f9aeb8197.parm1, var_3dfbdc6f9aeb8197.parm2, var_3dfbdc6f9aeb8197.parm3, var_3dfbdc6f9aeb8197.parm4);
                } else if (isdefined(var_3dfbdc6f9aeb8197.parm2)) {
                    self [[ var_3dfbdc6f9aeb8197.func ]](var_3dfbdc6f9aeb8197.parm1, var_3dfbdc6f9aeb8197.parm2);
                } else if (isdefined(var_3dfbdc6f9aeb8197.parm1)) {
                    self [[ var_3dfbdc6f9aeb8197.func ]](var_3dfbdc6f9aeb8197.parm1);
                } else {
                    self [[ var_3dfbdc6f9aeb8197.func ]]();
                }
            }
        }
    }
}

