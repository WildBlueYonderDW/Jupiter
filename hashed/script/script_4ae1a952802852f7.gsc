// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;
#using script_59ff79d681bb860c;

#namespace wander;

// Namespace wander / namespace_37deded6c75bc7e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9
// Size: 0x13
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&evaluatescore, &createaction);
}

// Namespace wander / namespace_37deded6c75bc7e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4
// Size: 0x1f
function evaluatescore(bot) {
    return self.constants.basescore;
}

// Namespace wander / namespace_37deded6c75bc7e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b
// Size: 0x28
function createaction(bot) {
    return createactionbase("wander", undefined, "main", "", &actionprocess, self);
}

// Namespace wander / namespace_37deded6c75bc7e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b
// Size: 0xa6
function actionprocess(bot) {
    if (isdefined(level.bot_funcs["mp_wander_select_destination"])) {
        pointonnavmesh = bot [[ level.bot_funcs["mp_wander_select_destination"] ]]();
    } else {
        pointonnavmesh = bot selectdestination();
    }
    if (!isdefined(pointonnavmesh)) {
        return "No destination";
    }
    bot function_9e400058ef021b03(pointonnavmesh, 400);
    result = bot waittill_any_in_array_or_timeout(["goal", "bad_path", "long_path"], 15);
    if (result != "goal" && result != "timeout") {
        return result;
    }
}

