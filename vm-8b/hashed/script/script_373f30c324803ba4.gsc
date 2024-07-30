#using scripts\common\callbacks.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_5bc60484d17fa95c;
#using script_3aa8e63a56e3416;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_e05e905a3c01778f;

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x2df
// Size: 0x6e
function autoexec main() {
    if (getdvarint(@"hash_bee6f271b3232348", 0) == 1) {
        return;
    }
    level.var_2c4cb267d8d1cd85 = 1;
    function_7e4ada39cadeebf8();
    scripts\mp\gametypes\br_gulag::function_ed608478232fdeb2("setupArena", &function_6fb82c7fdd547028);
    scripts\mp\gametypes\br_gulag::function_c797c1f0977d41d1("toggleLadderEscape", &function_acdf468e29550c88);
    scripts\mp\gametypes\br_gulag::function_c797c1f0977d41d1("removeLadderEscape", &function_13f686fc9f3c8840);
    scripts\mp\gametypes\br_gulag::function_c797c1f0977d41d1("getWinnerDialogOverride", &function_c8608aeb89ed5e36);
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x355
// Size: 0xc9
function function_7e4ada39cadeebf8() {
    level.var_4ca747cc86970811 = spawnstruct();
    level.var_4ca747cc86970811.shoulddelete = getdvarint(@"hash_ef004c609f89f55", 0);
    level.var_4ca747cc86970811.var_1b5eef752374bfa8 = getdvarint(@"hash_a53cd15a02823fc9", 0);
    level.var_4ca747cc86970811.var_7b8d762cf8c85dec = getdvarfloat(@"hash_69b3f8dd2b6eaa4c", 1.5);
    level.var_4ca747cc86970811.rewardref = getdvar(@"hash_929b4f3e72a26e65", "brloot_plunder_cash_rare_2");
    level.var_4ca747cc86970811.var_176234c83134fdc2 = getdvarint(@"hash_c8c6890374c076a4", 350);
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x426
// Size: 0xbc
function function_6fb82c7fdd547028(arena) {
    if (arena.ladders.size < 1) {
        return 0;
    }
    arena.var_80c48c7b9faeb550 = 0;
    arena.var_82c16918e12ad681 = undefined;
    function_85177aa5ffd825a(arena);
    foreach (var_b6b07f517f8e7f40 in arena.ladders) {
        var_b6b07f517f8e7f40.arena = arena;
        if (!isdefined(var_b6b07f517f8e7f40.target)) {
            function_7e7f61cb536d3c0c(var_b6b07f517f8e7f40);
            continue;
        }
        function_a9218c1e84d16a40(var_b6b07f517f8e7f40);
    }
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ea
// Size: 0x221
function function_a9218c1e84d16a40(var_b6b07f517f8e7f40) {
    components = getentarray(var_b6b07f517f8e7f40.target, "targetname");
    foreach (component in components) {
        switch (component.script_noteworthy) {
        case #"hash_ba8af33d960fd422": 
            var_b6b07f517f8e7f40.brush = component;
            break;
        case #"hash_fe0a0e43f6c24fa2": 
            var_b6b07f517f8e7f40.trigger = component;
            scripts\mp\utility\trigger::makeenterexittrigger(var_b6b07f517f8e7f40.trigger);
            break;
        }
    }
    scriptables = getentitylessscriptablearray(var_b6b07f517f8e7f40.target, "targetname");
    foreach (scriptable in scriptables) {
        switch (scriptable.script_noteworthy) {
        case #"hash_d023a1ffba25729d": 
            var_b6b07f517f8e7f40.var_249010cf8ddd811d = scriptable;
            break;
        case #"hash_867a7b9fb57d6788": 
            var_b6b07f517f8e7f40.protector = scriptable;
            break;
        }
    }
    var_b6b07f517f8e7f40.down = 0;
    if (isdefined(var_b6b07f517f8e7f40.brush)) {
        var_b6b07f517f8e7f40.brush.origin -= (0, 0, 144);
        var_b6b07f517f8e7f40.brush notsolid();
    }
    if (!function_9ab1c5b876dc8c7c(var_b6b07f517f8e7f40) || level.var_4ca747cc86970811.shoulddelete) {
        function_7e7f61cb536d3c0c(var_b6b07f517f8e7f40);
        return;
    }
    function_a20583b52edba770(var_b6b07f517f8e7f40);
    function_a4b1de48eb1290a4(var_b6b07f517f8e7f40);
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x713
// Size: 0x27
function function_9ab1c5b876dc8c7c(var_b6b07f517f8e7f40) {
    return isdefined(var_b6b07f517f8e7f40.var_249010cf8ddd811d) && isdefined(var_b6b07f517f8e7f40.trigger);
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x743
// Size: 0x94
function function_a20583b52edba770(var_b6b07f517f8e7f40) {
    lootnode = spawnstruct();
    lootnode.origin = var_b6b07f517f8e7f40.trigger.origin - (0, 0, 10);
    lootnode.angles = var_b6b07f517f8e7f40.var_249010cf8ddd811d.angles + (0, 90, 0);
    lootnode.payload = 0;
    var_b6b07f517f8e7f40.var_db37a868a5f5fe34 = lootnode;
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7df
// Size: 0x7b
function function_a4b1de48eb1290a4(var_b6b07f517f8e7f40) {
    trigger = var_b6b07f517f8e7f40.trigger;
    model = var_b6b07f517f8e7f40.var_249010cf8ddd811d;
    position = (model.origin[0], model.origin[1], trigger.origin[2] + 50);
    trigger.origin = position;
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x862
// Size: 0x166
function function_acdf468e29550c88(arena, activate) {
    if (arena.ladders.size < 1 || !istrue(arena.ladderescape)) {
        return 0;
    }
    if (arena.var_80c48c7b9faeb550 == activate) {
        return 0;
    }
    if (!activate) {
        arena notify("ladder_escape_stop_watcher");
        scripts\mp\gametypes\br_analytics::function_a951471036bd80de(arena.var_72b377bfe92c3499, arena.var_c85b97b3fa1f4db9);
        function_85177aa5ffd825a(arena);
        function_f88a5e25e9290dcf(arena);
    } else {
        foreach (player in arena.arenaplayers) {
            thread function_ef17db4d092d9b5e(player, arena);
        }
        function_4b188b3d73cd1824(arena);
    }
    arena.var_80c48c7b9faeb550 = activate;
    arena.var_82c16918e12ad681 = undefined;
    foreach (var_b6b07f517f8e7f40 in arena.ladders) {
        thread function_3d9356bf0e591d4e(var_b6b07f517f8e7f40, activate);
        function_26e6507f5ae3fe8e(var_b6b07f517f8e7f40, activate);
    }
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9d0
// Size: 0x118
function function_3d9356bf0e591d4e(var_b6b07f517f8e7f40, down) {
    if (var_b6b07f517f8e7f40.down == down) {
        return;
    }
    state = scripts\engine\utility::ter_op(istrue(var_b6b07f517f8e7f40.down), "up", "down");
    if (down) {
        if (level.var_4ca747cc86970811.var_1b5eef752374bfa8) {
            var_b6b07f517f8e7f40.arena waittill("gulag_overtime_started");
        } else {
            wait level.var_4ca747cc86970811.var_7b8d762cf8c85dec;
        }
        if (isdefined(var_b6b07f517f8e7f40.brush)) {
            var_b6b07f517f8e7f40.brush solid();
        }
    } else if (isdefined(var_b6b07f517f8e7f40.brush)) {
        var_b6b07f517f8e7f40.brush notsolid();
    }
    var_b6b07f517f8e7f40.down = !var_b6b07f517f8e7f40.down;
    var_b6b07f517f8e7f40.var_249010cf8ddd811d setscriptablepartstate("ladder", state);
    var_b6b07f517f8e7f40.protector setscriptablepartstate("protector", state);
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaf0
// Size: 0x4d
function function_26e6507f5ae3fe8e(var_b6b07f517f8e7f40, activate) {
    trigger = var_b6b07f517f8e7f40.trigger;
    arena = var_b6b07f517f8e7f40.arena;
    if (activate) {
        thread function_6eb8ca12ec6fc71(var_b6b07f517f8e7f40, arena);
    }
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb45
// Size: 0xc8
function function_4b188b3d73cd1824(arena) {
    foreach (var_b6b07f517f8e7f40 in arena.ladders) {
        if (isdefined(var_b6b07f517f8e7f40.var_db37a868a5f5fe34)) {
            item = scripts\mp\gametypes\br_pickups::spawnpickup(level.var_4ca747cc86970811.rewardref, var_b6b07f517f8e7f40.var_db37a868a5f5fe34, level.var_4ca747cc86970811.var_176234c83134fdc2, undefined, undefined, 1);
            item.var_1b46a808091ea19c = 1;
            var_b6b07f517f8e7f40.plunder = item;
        }
    }
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc15
// Size: 0x4a
function function_ef17db4d092d9b5e(player, arena) {
    player callbacks::add("player_death", &function_c7b98110b2dbff43, arena);
    player waittill_any_2("gulag_end", "death");
    player callbacks::remove("player_death", &function_c7b98110b2dbff43);
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xc67
// Size: 0x91
function private function_c7b98110b2dbff43(params, arena) {
    player = self;
    attacker = params.attacker;
    objweapon = params.objweapon;
    if (player isonladder() && attacker isonladder() && objweapon.classname == "pistol") {
        arena.var_82c16918e12ad681 = "gulag_ladder_escape_kill";
        arena.var_c85b97b3fa1f4db9 = 1;
    }
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd00
// Size: 0x16
function function_c8608aeb89ed5e36(arena) {
    return arena.var_82c16918e12ad681;
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd1f
// Size: 0x67
function function_6eb8ca12ec6fc71(var_b6b07f517f8e7f40, arena) {
    arena endon("ladder_escape_stop_watcher");
    trigger = var_b6b07f517f8e7f40.trigger;
    while (true) {
        player = trigger waittill("trigger_enter");
        if (!player function_9cc921a57ff4deb5()) {
            function_f320d154ca60c728(var_b6b07f517f8e7f40, player);
            thread function_cc61daea9bf5854c(arena, player);
        }
    }
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd8e
// Size: 0x49
function function_f320d154ca60c728(var_b6b07f517f8e7f40, player) {
    plunder = var_b6b07f517f8e7f40.plunder;
    if (!isdefined(plunder)) {
        return;
    }
    scripts\mp\gametypes\br_pickups::lootused(plunder, plunder.type, "visible", player);
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xddf
// Size: 0x9b
function function_cc61daea9bf5854c(arena, player) {
    player scripts\cp_mp\utility\player_utility::function_a593971d75d82113();
    if (namespace_eb17b46cdcb98eea::function_1980065ce4dc067b()) {
        player namespace_6ea7652ec407cc80::function_dc0a56e258889cb(arena, "br_twotwo_gulag_win_ladder_escape");
        arena.var_72b377bfe92c3499 += 1;
    }
    if (!istrue(arena.overtime)) {
        arena.var_effc33b6990b19db = 1;
        function_69c78f5a75eafdfc(arena);
    }
    if (arena.arenaplayers.size < 1) {
        arena notify("matchEnded");
        scripts\mp\gametypes\br_gulag::handleendarena(arena);
        arena notify("fight_over_early");
    }
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe82
// Size: 0x25
function function_85177aa5ffd825a(arena) {
    arena.var_72b377bfe92c3499 = 0;
    arena.var_c85b97b3fa1f4db9 = 0;
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeaf
// Size: 0x133
function function_69c78f5a75eafdfc(arena) {
    foreach (var_b6b07f517f8e7f40 in arena.ladders) {
        var_b6b07f517f8e7f40.objidnum = scripts\mp\objidpoolmanager::requestobjectiveid();
        if (var_b6b07f517f8e7f40.objidnum == -1) {
            return;
        }
        scripts\mp\objidpoolmanager::objective_add_objective(var_b6b07f517f8e7f40.objidnum, "current", var_b6b07f517f8e7f40.var_249010cf8ddd811d.origin, "ui_map_icon_obj_gulag_escape");
        scripts\mp\objidpoolmanager::update_objective_setbackground(var_b6b07f517f8e7f40.objidnum, 1);
        scripts\mp\objidpoolmanager::function_9cad42ac02eff950(var_b6b07f517f8e7f40.objidnum);
        foreach (player in arena.arenaplayers) {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(var_b6b07f517f8e7f40.objidnum, player);
        }
    }
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfea
// Size: 0x79
function function_f88a5e25e9290dcf(arena) {
    foreach (var_b6b07f517f8e7f40 in arena.ladders) {
        scripts\mp\objidpoolmanager::returnobjectiveid(var_b6b07f517f8e7f40.objidnum);
        var_b6b07f517f8e7f40.objidnum = -1;
    }
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x106b
// Size: 0x75
function function_13f686fc9f3c8840(arena) {
    if (arena.ladders.size < 1) {
        return 0;
    }
    foreach (var_b6b07f517f8e7f40 in arena.ladders) {
        function_7e7f61cb536d3c0c(var_b6b07f517f8e7f40);
    }
}

// Namespace namespace_e05e905a3c01778f / namespace_738d50d2ccc2cd74
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10e8
// Size: 0xa2
function function_7e7f61cb536d3c0c(var_b6b07f517f8e7f40) {
    arena = var_b6b07f517f8e7f40.arena;
    if (isdefined(var_b6b07f517f8e7f40.var_249010cf8ddd811d)) {
        var_b6b07f517f8e7f40.var_249010cf8ddd811d freescriptable();
    }
    if (isdefined(var_b6b07f517f8e7f40.brush)) {
        var_b6b07f517f8e7f40.brush delete();
    }
    if (isdefined(var_b6b07f517f8e7f40.trigger)) {
        var_b6b07f517f8e7f40.trigger delete();
    }
    arena.ladders = arrayremove(arena.ladders, var_b6b07f517f8e7f40);
    var_b6b07f517f8e7f40 = undefined;
}

