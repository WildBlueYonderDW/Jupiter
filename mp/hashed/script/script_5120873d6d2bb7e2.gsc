#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_b9f8f8dc9fce21f5;

// Namespace namespace_b9f8f8dc9fce21f5 / namespace_27cc7cdc2e4475be
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10a
// Size: 0x92
function createevent(minradius, minspeed) {
    event = function_c74368899713e7e6();
    event.minradiussquare = minradius * minradius;
    event.minspeed = minspeed;
    event.result = [];
    eventstream = self.mind.eventstream;
    eventstream.var_d4bf8990034d5707 = event;
    eventstream.events[eventstream.events.size] = event;
}

// Namespace namespace_b9f8f8dc9fce21f5 / namespace_27cc7cdc2e4475be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4
// Size: 0x190
function getevent() {
    event = self.mind.eventstream.var_d4bf8990034d5707;
    if (!event.evaluated) {
        if (event.result.size > 0) {
            event.result = [];
        }
        if (isdefined(level.mind.events.var_d603eaab3906b19e)) {
            foreach (player in level.mind.events.var_d603eaab3906b19e) {
                if (isalliedsentient(player, self)) {
                    continue;
                }
                vehicle = player scripts\cp_mp\utility\player_utility::getvehicle();
                if (isdefined(vehicle) && vehicle function_f96caffd866a1b2() && !array_contains(event.result, vehicle) && vehicle.veh_speed > event.minspeed && distance2dsquared(self.origin, vehicle.origin) <= event.minradiussquare) {
                    event.result[event.result.size] = vehicle;
                }
            }
        }
        event.evaluated = 1;
    }
    return event.result;
}

// Namespace namespace_b9f8f8dc9fce21f5 / namespace_27cc7cdc2e4475be
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33d
// Size: 0x1cb
function function_608ad5a3783431d9() {
    assert(!isbot(self) && isplayer(self));
    level endon("game_ended");
    if (!isdefined(level.mind.events.var_d603eaab3906b19e)) {
        level.mind.events.var_d603eaab3906b19e = [];
    }
    while (true) {
        message = waittill_any_in_array_return(["death", "disconnect", "vehicle_enter", "vehicle_exit"]);
        switch (message) {
        case #"hash_8661f460881c12d6":
            if (!array_contains(level.mind.events.var_d603eaab3906b19e, self)) {
                level.mind.events.var_d603eaab3906b19e[level.mind.events.var_d603eaab3906b19e.size] = self;
            }
            break;
        case #"hash_20db0d9f61cba780":
            level.mind.events.var_d603eaab3906b19e = array_remove(level.mind.events.var_d603eaab3906b19e, self);
            break;
        case #"hash_8a3297e83141974b":
        case #"hash_e8bc3da4af287c2d":
            level.mind.events.var_d603eaab3906b19e = array_remove(level.mind.events.var_d603eaab3906b19e, self);
            return;
        }
    }
}

