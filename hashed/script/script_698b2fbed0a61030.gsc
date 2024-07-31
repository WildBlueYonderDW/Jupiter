#namespace namespace_bf830bafc40f562b;

// Namespace namespace_bf830bafc40f562b / namespace_2e668fe54ca19f3c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104
// Size: 0x16
function main() {
    thread sfx_security_clearance("sfx_security_clearance", "amb_emt_dubai_security_clearance", 3);
}

// Namespace namespace_bf830bafc40f562b / namespace_2e668fe54ca19f3c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x122
// Size: 0x69
function sfx_security_clearance(var_eaad182af1b91884, alias, timer) {
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

// Namespace namespace_bf830bafc40f562b / namespace_2e668fe54ca19f3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x193
// Size: 0x65
function function_77e25cc10461d531(trig) {
    foreach (player in level.players) {
        if (player istouching(trig)) {
            return true;
        }
    }
    return false;
}

