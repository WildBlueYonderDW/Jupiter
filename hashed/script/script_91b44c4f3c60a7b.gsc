// mwiii decomp prototype
#using scripts\engine\scriptable.gsc;

#namespace namespace_8fe71ba980fd6749;

// Namespace namespace_8fe71ba980fd6749/namespace_ba0e313b6e029ac1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x114
// Size: 0x9b
function function_8fe71ba980fd6749() {
    level waittill("prematch_done");
    var_573aebf28743b42b = getentitylessscriptablearray("scriptable_scriptable_door_uk_garage_01", "classname");
    var_c8e8a7bd09836a86 = var_573aebf28743b42b[0];
    var_dada11d7451d2e6 = getentarray("rollup_door_trigger", "script_noteworthy");
    foreach (var_e749829cd971c69d in var_dada11d7451d2e6) {
        var_e749829cd971c69d thread function_4c1e29fbd2f64593();
    }
}

// Namespace namespace_8fe71ba980fd6749/namespace_ba0e313b6e029ac1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6
// Size: 0xaa
function function_4c1e29fbd2f64593() {
    level endon("game_ended");
    self endon("death");
    var_573aebf28743b42b = getentitylessscriptablearray(self.target, "targetname");
    var_c8e8a7bd09836a86 = var_573aebf28743b42b[0];
    while (1) {
        player = self waittill("trigger");
        var_dfbdd027ef33103 = var_c8e8a7bd09836a86 getscriptablepartstate("base", 1);
        if (var_dfbdd027ef33103 == "opening" || var_dfbdd027ef33103 == "open") {
            var_c8e8a7bd09836a86 setscriptablepartstate("base", "closing");
        } else {
            var_c8e8a7bd09836a86 setscriptablepartstate("base", "opening");
        }
    }
}

