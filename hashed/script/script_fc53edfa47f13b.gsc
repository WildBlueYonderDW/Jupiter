// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;

#namespace namespace_f560337620c1330c;

// Namespace namespace_f560337620c1330c/namespace_4f82c6e70fbaba75
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x120
// Size: 0x1f
function init() {
    if (!getdvarint(@"hash_4dd644182bf6c698", 1)) {
        return;
    }
    thread function_f66374ca9f911f92();
}

// Namespace namespace_f560337620c1330c/namespace_4f82c6e70fbaba75
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x146
// Size: 0xad
function function_f66374ca9f911f92() {
    level endon("game_ended");
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_fade_done");
    wait(1);
    triggers = function_f159c10d5cf8f0b4("metalalarm", "script_noteworthy");
    foreach (trigger in triggers) {
        trigger.var_5c5b50fce337658b = function_ab3653d48df5ed28(trigger.target);
        if (isdefined(trigger.var_5c5b50fce337658b)) {
            trigger thread function_776e0185df41fb73();
        }
    }
}

// Namespace namespace_f560337620c1330c/namespace_4f82c6e70fbaba75
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa
// Size: 0x77
function function_776e0185df41fb73() {
    level endon("game_ended");
    while (1) {
        self waittill("trigger");
        dlog_recordevent("dlog_event_br_metal_detector", [0:"detector_x", 1:self.origin[0], 2:"detector_y", 3:self.origin[1], 4:"detector_z", 5:self.origin[2]]);
        function_856c46361ec2ae20();
    }
}

// Namespace namespace_f560337620c1330c/namespace_4f82c6e70fbaba75
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x278
// Size: 0x31
function function_ab3653d48df5ed28(targetname) {
    entarray = getentitylessscriptablearray(targetname, "targetname");
    ent = entarray[0];
    return ent;
}

// Namespace namespace_f560337620c1330c/namespace_4f82c6e70fbaba75
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b1
// Size: 0x54
function function_856c46361ec2ae20() {
    level endon("game_ended");
    if (!isdefined(self.var_5c5b50fce337658b)) {
        return;
    }
    self.var_5c5b50fce337658b setscriptablepartstate("root", "on", 1);
    wait(5);
    self.var_5c5b50fce337658b setscriptablepartstate("root", "off", 1);
}

