// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;
#using script_59ff79d681bb860c;

#namespace wander;

// Namespace wander/namespace_37deded6c75bc7e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9
// Size: 0x13
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, &createaction);
}

// Namespace wander/namespace_37deded6c75bc7e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4
// Size: 0x1f
function function_e0844a2b7f904b14(bot) {
    return self.constants.basescore;
}

// Namespace wander/namespace_37deded6c75bc7e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b
// Size: 0x28
function createaction(bot) {
    return function_ff35a4d756374ede("wander", undefined, "main", "", &function_35671b7b1a04bf58, self);
}

// Namespace wander/namespace_37deded6c75bc7e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b
// Size: 0xa6
function function_35671b7b1a04bf58(bot) {
    if (isdefined(level.bot_funcs["mp_wander_select_destination"])) {
        pointonnavmesh = bot [[ level.bot_funcs["mp_wander_select_destination"] ]]();
    } else {
        pointonnavmesh = bot function_5e0e534f768708a3();
    }
    if (!isdefined(pointonnavmesh)) {
        return "No destination";
    }
    bot function_9e400058ef021b03(pointonnavmesh, 400);
    result = bot waittill_any_in_array_or_timeout([0:"goal", 1:"bad_path", 2:"long_path"], 15);
    if (result != "goal" && result != "timeout") {
        return result;
    }
}

