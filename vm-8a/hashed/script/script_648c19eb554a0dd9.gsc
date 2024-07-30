#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\perk.gsc;

#namespace namespace_707f4e559a586342;

// Namespace namespace_707f4e559a586342 / namespace_2c9cb80adc9e5a31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104
// Size: 0x1e
function init() {
    if (!getdvarint(@"hash_e98eca6eda18788a", 1)) {
        return;
    }
    thread movementinit();
}

// Namespace namespace_707f4e559a586342 / namespace_2c9cb80adc9e5a31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12a
// Size: 0xb0
function movementinit() {
    level endon("game_ended");
    scripts\mp\flags::function_1240434f4201ac9d("prematch_fade_done");
    wait 1;
    triggers = function_f159c10d5cf8f0b4("movementalarm", "script_noteworthy");
    foreach (trigger in triggers) {
        trigger.detectors = getentitylessscriptablearray(trigger.target, "targetname");
        if (isdefined(trigger.detectors)) {
            trigger thread function_776e0185df41fb73();
        }
    }
}

// Namespace namespace_707f4e559a586342 / namespace_2c9cb80adc9e5a31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2
// Size: 0x3a
function function_776e0185df41fb73() {
    level endon("game_ended");
    while (true) {
        player = self waittill("trigger");
        if (!player scripts\mp\utility\perk::_hasperk("specialty_coldblooded")) {
            startalarm();
        }
    }
}

// Namespace namespace_707f4e559a586342 / namespace_2c9cb80adc9e5a31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x224
// Size: 0xed
function startalarm() {
    level endon("game_ended");
    if (!isdefined(self.detectors)) {
        return;
    }
    foreach (element in self.detectors) {
        element setscriptablepartstate("onoff", "on", 1);
    }
    wait 20;
    while (waittill_notify_or_timeout_return("trigger", 1) == "trigger") {
        wait 20;
    }
    foreach (element in self.detectors) {
        element setscriptablepartstate("onoff", "off", 1);
    }
}

