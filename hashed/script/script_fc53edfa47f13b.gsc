// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;

#namespace namespace_f560337620c1330c;

// Namespace namespace_f560337620c1330c / namespace_4f82c6e70fbaba75
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x120
// Size: 0x1f
function init() {
    if (!getdvarint(@"hash_4dd644182bf6c698", 1)) {
        return;
    }
    thread metalinit();
}

// Namespace namespace_f560337620c1330c / namespace_4f82c6e70fbaba75
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x146
// Size: 0xad
function metalinit() {
    level endon("game_ended");
    scripts/mp/flags::function_1240434f4201ac9d("prematch_fade_done");
    wait(1);
    triggers = function_f159c10d5cf8f0b4("metalalarm", "script_noteworthy");
    foreach (trigger in triggers) {
        trigger.detector = function_ab3653d48df5ed28(trigger.target);
        if (isdefined(trigger.detector)) {
            trigger thread function_776e0185df41fb73();
        }
    }
}

// Namespace namespace_f560337620c1330c / namespace_4f82c6e70fbaba75
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa
// Size: 0x77
function function_776e0185df41fb73() {
    level endon("game_ended");
    while (true) {
        self waittill("trigger");
        dlog_recordevent("dlog_event_br_metal_detector", ["detector_x", self.origin[0], "detector_y", self.origin[1], "detector_z", self.origin[2]]);
        startalarm();
    }
}

// Namespace namespace_f560337620c1330c / namespace_4f82c6e70fbaba75
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x278
// Size: 0x31
function function_ab3653d48df5ed28(targetname) {
    entarray = getentitylessscriptablearray(targetname, "targetname");
    ent = entarray[0];
    return ent;
}

// Namespace namespace_f560337620c1330c / namespace_4f82c6e70fbaba75
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b1
// Size: 0x54
function startalarm() {
    level endon("game_ended");
    if (!isdefined(self.detector)) {
        return;
    }
    self.detector setscriptablepartstate("root", "on", 1);
    wait(5);
    self.detector setscriptablepartstate("root", "off", 1);
}

