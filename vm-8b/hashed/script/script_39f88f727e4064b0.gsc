#namespace namespace_8a95940b39e51590;

// Namespace namespace_8a95940b39e51590 / namespace_f73a30139e383e28
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18c
// Size: 0x2a
function main() {
    thread sfx_makeup_store("sfx_makeup_store", "amb_emt_terminal_storebell", 5);
    thread sfx_metal_det("sfx_metal_det", "amb_emt_terminal_metal_det", 3);
}

// Namespace namespace_8a95940b39e51590 / namespace_f73a30139e383e28
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1be
// Size: 0x69
function sfx_makeup_store(var_eaad182af1b91884, alias, timer) {
    level endon("game_ended");
    level waittill("matchStartTimer_done");
    trig = getent(var_eaad182af1b91884, "targetname");
    while (true) {
        trig waittill("trigger");
        trig playsound(alias);
        wait timer;
        while (function_77e25cc10461d531(trig)) {
            waitframe();
        }
    }
}

// Namespace namespace_8a95940b39e51590 / namespace_f73a30139e383e28
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x22f
// Size: 0x8f
function sfx_metal_det(var_eaad182af1b91884, alias, timer) {
    level endon("game_ended");
    level waittill("matchStartTimer_done");
    var_4602cb6c9dce758 = getentarray(var_eaad182af1b91884, "targetname");
    foreach (trig in var_4602cb6c9dce758) {
        thread function_a0912e6a103cc3a(trig, alias, timer);
    }
}

// Namespace namespace_8a95940b39e51590 / namespace_f73a30139e383e28
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2c6
// Size: 0xf5
function function_a0912e6a103cc3a(trig, alias, timer) {
    while (true) {
        if (!isdefined(trig.scriptable)) {
            scriptables = getscriptablearray("scriptable_un_office_walkthrough_metal_detector_01_blink", "classname");
            trig.scriptable = sortbydistance(scriptables, trig.origin)[0];
            trig.scriptable setscriptablepartstate("Light_Part", "off");
        }
        trig waittill("trigger");
        playsoundatpos(trig.origin + (0, 0, 40), alias);
        trig.scriptable setscriptablepartstate("Light_Part", "on");
        wait timer;
        trig.scriptable setscriptablepartstate("Light_Part", "off");
        while (function_77e25cc10461d531(trig)) {
            waitframe();
        }
    }
}

// Namespace namespace_8a95940b39e51590 / namespace_f73a30139e383e28
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c3
// Size: 0x65
function function_77e25cc10461d531(trig) {
    foreach (player in level.players) {
        if (player istouching(trig)) {
            return true;
        }
    }
    return false;
}

