// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\perk.gsc;

#namespace namespace_707f4e559a586342;

// Namespace namespace_707f4e559a586342/namespace_2c9cb80adc9e5a31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104
// Size: 0x1f
function init() {
    if (!getdvarint(@"hash_e98eca6eda18788a", 1)) {
        return;
    }
    thread function_387228c079399606();
}

// Namespace namespace_707f4e559a586342/namespace_2c9cb80adc9e5a31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12a
// Size: 0xb1
function function_387228c079399606() {
    level endon("game_ended");
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_fade_done");
    wait(1);
    triggers = function_f159c10d5cf8f0b4("movementalarm", "script_noteworthy");
    foreach (trigger in triggers) {
        trigger.var_54391427b2d54068 = getentitylessscriptablearray(trigger.target, "targetname");
        if (isdefined(trigger.var_54391427b2d54068)) {
            trigger thread function_776e0185df41fb73();
        }
    }
}

// Namespace namespace_707f4e559a586342/namespace_2c9cb80adc9e5a31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2
// Size: 0x3b
function function_776e0185df41fb73() {
    level endon("game_ended");
    while (1) {
        player = self waittill("trigger");
        if (!player namespace_82dcd1d5ae30ff7::_hasperk("specialty_coldblooded")) {
            function_856c46361ec2ae20();
        }
    }
}

// Namespace namespace_707f4e559a586342/namespace_2c9cb80adc9e5a31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x224
// Size: 0xee
function function_856c46361ec2ae20() {
    level endon("game_ended");
    if (!isdefined(self.var_54391427b2d54068)) {
        return;
    }
    foreach (element in self.var_54391427b2d54068) {
        element setscriptablepartstate("onoff", "on", 1);
    }
    wait(20);
    while (waittill_notify_or_timeout_return("trigger", 1) == "trigger") {
        wait(20);
    }
    foreach (element in self.var_54391427b2d54068) {
        element setscriptablepartstate("onoff", "off", 1);
    }
}

