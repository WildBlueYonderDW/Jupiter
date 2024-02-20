// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_b9f8f8dc9fce21f5;

// Namespace namespace_b9f8f8dc9fce21f5/namespace_27cc7cdc2e4475be
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda
// Size: 0x93
function function_69b64f047b0af1db(minradius, minspeed) {
    event = function_c74368899713e7e6();
    event.var_fbefcc9ebbc882da = minradius * minradius;
    event.minspeed = minspeed;
    event.result = [];
    var_3c91684198954c83 = self.Mind.var_3c91684198954c83;
    var_3c91684198954c83.var_d4bf8990034d5707 = event;
    var_3c91684198954c83.events[var_3c91684198954c83.events.size] = event;
}

// Namespace namespace_b9f8f8dc9fce21f5/namespace_27cc7cdc2e4475be
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174
// Size: 0x194
function function_7e7ddfa33eff2c11() {
    event = self.Mind.var_3c91684198954c83.var_d4bf8990034d5707;
    if (!event.var_d0942e9d2044d6c6) {
        if (event.result.size > 0) {
            event.result = [];
        }
        if (isdefined(level.Mind.events.var_d603eaab3906b19e)) {
            foreach (player in level.Mind.events.var_d603eaab3906b19e) {
                if (isalliedsentient(player, self)) {
                    continue;
                }
                vehicle = player namespace_f8065cafc523dba5::getvehicle();
                if (isdefined(vehicle) && vehicle function_f96caffd866a1b2() && !array_contains(event.result, vehicle) && vehicle.veh_speed > event.minspeed && distance2dsquared(self.origin, vehicle.origin) <= event.var_fbefcc9ebbc882da) {
                    event.result[event.result.size] = vehicle;
                }
            }
        }
        event.var_d0942e9d2044d6c6 = 1;
    }
    return event.result;
}

// Namespace namespace_b9f8f8dc9fce21f5/namespace_27cc7cdc2e4475be
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x310
// Size: 0x1cb
function function_608ad5a3783431d9() {
    /#
        assert(!isbot(self) && isplayer(self));
    #/
    level endon("game_ended");
    if (!isdefined(level.Mind.events.var_d603eaab3906b19e)) {
        level.Mind.events.var_d603eaab3906b19e = [];
    }
    while (1) {
        message = waittill_any_in_array_return([0:"death", 1:"disconnect", 2:"vehicle_enter", 3:"vehicle_exit"]);
        switch (message) {
        case #"hash_8661f460881c12d6":
            if (!array_contains(level.Mind.events.var_d603eaab3906b19e, self)) {
                level.Mind.events.var_d603eaab3906b19e[level.Mind.events.var_d603eaab3906b19e.size] = self;
            }
            break;
        case #"hash_20db0d9f61cba780":
            level.Mind.events.var_d603eaab3906b19e = array_remove(level.Mind.events.var_d603eaab3906b19e, self);
            break;
        case #"hash_8a3297e83141974b":
        case #"hash_e8bc3da4af287c2d":
            level.Mind.events.var_d603eaab3906b19e = array_remove(level.Mind.events.var_d603eaab3906b19e, self);
            return;
        }
    }
}

