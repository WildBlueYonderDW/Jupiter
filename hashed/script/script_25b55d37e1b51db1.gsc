// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;

#namespace namespace_300f1cce1122a2ea;

// Namespace namespace_300f1cce1122a2ea/namespace_3df563b7c04eb8eb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100
// Size: 0x133
function function_69b64f047b0af1db(var_325752cb29127eeb) {
    event = function_c74368899713e7e6();
    event.var_325752cb29127eeb = var_325752cb29127eeb;
    event.list = [];
    if (!isdefined(level.mind.events.var_cbd599cc41b2a3f1)) {
        var_2a96d0ea58c991be = [];
        var_2a96d0ea58c991be[0] = "footstep";
        var_2a96d0ea58c991be[1] = "footstep_walk";
        var_2a96d0ea58c991be[2] = "footstep_sprint";
        var_2a96d0ea58c991be[5] = "death";
        var_2a96d0ea58c991be[9] = "gunshot";
        var_2a96d0ea58c991be[12] = "silenced_shot";
        var_2a96d0ea58c991be[14] = "bullet_whizby";
        var_2a96d0ea58c991be[15] = "projectile_impact";
        var_2a96d0ea58c991be[31] = "can_see";
        var_2a96d0ea58c991be[32] = "radar";
        level.mind.events.var_cbd599cc41b2a3f1 = var_2a96d0ea58c991be;
    }
    var_3c91684198954c83 = self.mind.var_3c91684198954c83;
    var_3c91684198954c83.var_83f7c458a67d43 = event;
    var_3c91684198954c83.events[var_3c91684198954c83.events.size] = event;
    thread function_712abddb7195a3ee();
}

// Namespace namespace_300f1cce1122a2ea/namespace_3df563b7c04eb8eb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a
// Size: 0x12c
function function_712abddb7195a3ee() {
    level endon("game_ended");
    self endon("death");
    event = self.mind.var_3c91684198954c83.var_83f7c458a67d43;
    while (1) {
        pos = time = eventtype = potentialtarget = self waittill("known_event");
        if (isdefined(level.mind.events.var_cbd599cc41b2a3f1[eventtype]) && isdefined(potentialtarget) && isdefined(eventtype) && isdefined(time) && isdefined(pos)) {
            soundevent = spawnstruct();
            soundevent.owner = potentialtarget;
            soundevent.time = time;
            soundevent.pos = pos;
            soundevent.type = level.mind.events.var_cbd599cc41b2a3f1[eventtype];
            event.list[event.list.size] = soundevent;
        }
    }
}

// Namespace namespace_300f1cce1122a2ea/namespace_3df563b7c04eb8eb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36d
// Size: 0x10c
function function_7e7ddfa33eff2c11() {
    event = self.mind.var_3c91684198954c83.var_83f7c458a67d43;
    if (!event.var_d0942e9d2044d6c6) {
        var_379a32677fb69595 = gettime() - event.var_325752cb29127eeb;
        index = undefined;
        for (i = 0; i < event.list.size; i++) {
            if (event.list[i].time > var_379a32677fb69595) {
                break;
            }
            index = i;
        }
        if (isdefined(index)) {
            var_502ca8f7bc239543 = [];
            for (i = index + 1; i < event.list.size; i++) {
                var_502ca8f7bc239543[var_502ca8f7bc239543.size] = event.list[i];
            }
            event.list = var_502ca8f7bc239543;
        }
        event.var_d0942e9d2044d6c6 = 1;
    }
    return event.list;
}

