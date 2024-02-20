// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_5bc60484d17fa95c;
#using script_3aa8e63a56e3416;

#namespace namespace_5224c1e851beffac;

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x217
// Size: 0xdf
function function_1125faa6bc85e080() {
    if (getdvarint(@"hash_77e2efb75e6cc8ca", 0)) {
        return;
    }
    level.gulag.var_5294cceb5b0fa1fb = getdvarint(@"hash_440629690d262c95", 1);
    namespace_d20f8ef223912e12::function_6315a065e5b1efa2(&function_ddc0c02aa77e9268);
    namespace_d20f8ef223912e12::function_80fc169a9ec33825(&function_71582b761a9132e7);
    namespace_47fd1e79a44628cd::function_ed608478232fdeb2("setupArena", &function_701bb5116db0b366);
    if (level.gulag.var_5294cceb5b0fa1fb) {
        namespace_47fd1e79a44628cd::function_ed608478232fdeb2("beginNewFight", &function_6d7f8ac81d81ee2d);
        namespace_47fd1e79a44628cd::function_ed608478232fdeb2("handleEndArena", &function_630d643e20b202a2);
        namespace_47fd1e79a44628cd::function_ed608478232fdeb2("respawnCleanup", &function_8ae33204ae68c976);
        namespace_47fd1e79a44628cd::function_ed608478232fdeb2("gulagWaittillOvertime", &function_57d827764e049f21);
        namespace_47fd1e79a44628cd::function_c797c1f0977d41d1("overtimeStart", &function_3fd1a99e2ac61cd1);
        namespace_47fd1e79a44628cd::function_c797c1f0977d41d1("overtimeWait", &function_f47d8fbd1e16f89a);
    }
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fd
// Size: 0x28
function function_bbc309466ce88c71(arena) {
    return isdefined(arena.ascenders) && arena.ascenders.size;
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32d
// Size: 0xde
function function_701bb5116db0b366(arena) {
    arena.ascenders = [];
    var_46178736de007ecb = getentitylessscriptablearray(arena.target, "targetname");
    foreach (var_b42fd3a9b400e97a in var_46178736de007ecb) {
        switch (var_b42fd3a9b400e97a.script_noteworthy) {
        case #"hash_32d233f7333dcec":
            var_b42fd3a9b400e97a.arena = arena;
            arena.ascenders[arena.ascenders.size] = var_b42fd3a9b400e97a;
            function_37302e9085f4d57f(var_b42fd3a9b400e97a);
            break;
        default:
            break;
        }
    }
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x412
// Size: 0x11d
function function_37302e9085f4d57f(instance) {
    instance.var_ea780f20ab06e68a = 1;
    targets = getentarray(instance.target, "targetname");
    foreach (target in targets) {
        switch (target.script_noteworthy) {
        case #"hash_4d993e901822ff8d":
            /#
                assert(!isdefined(instance.rope));
            #/
            rope = spawnscriptable("jup_overtime_rope", target.origin);
            target hide();
            instance.rope = rope;
            function_64ec5377628be7e4(target, rope);
            break;
        default:
            break;
        }
    }
    instance.var_487f3dd052af102c = "down";
    thread function_2d90839b9225f69e(instance);
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x536
// Size: 0x14c
function function_64ec5377628be7e4(var_8714acb1a815a91f, rope) {
    rope.var_5a8b4299f059989c = rope.origin;
    targets = var_8714acb1a815a91f getstructarray(var_8714acb1a815a91f.target, "targetname");
    foreach (target in targets) {
        switch (target.script_noteworthy) {
        case #"hash_f0c78255b6b37d51":
            rope.var_fea0b86a711ebd23 = target.origin;
            break;
        default:
            break;
        }
    }
    upvec = (0, 0, rope.var_fea0b86a711ebd23[2] - rope.var_5a8b4299f059989c[2]);
    rope.origin = rope.origin + upvec;
    rope.angles = vectortoangles(upvec) + (0, 0, 90);
    rope.upvec = upvec;
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x689
// Size: 0x7b
function function_2d90839b9225f69e(instance) {
    if (instance.var_487f3dd052af102c == "up" || instance.var_487f3dd052af102c == "raising") {
        return;
    }
    function_5d0f8563db57a967(instance);
    instance.var_487f3dd052af102c = "raising";
    instance.rope setscriptablepartstate("rope", "up");
    instance.var_487f3dd052af102c = "up";
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70b
// Size: 0x90
function function_b21d67600134d787(arena, instance) {
    arena endon("matchEnded");
    if (instance.var_487f3dd052af102c == "down" || instance.var_487f3dd052af102c == "lowering") {
        return;
    }
    instance.var_487f3dd052af102c = "lowering";
    instance.rope setscriptablepartstate("rope", "down");
    wait(1);
    function_5f46e3ff37d51924(instance);
    instance.var_487f3dd052af102c = "down";
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a2
// Size: 0x123
function function_5f46e3ff37d51924(instance) {
    instance.objidnum = namespace_5a22b6f3a56f7e9b::requestobjectiveid();
    if (instance.objidnum == -1) {
        return;
    }
    namespace_5a22b6f3a56f7e9b::objective_add_objective(instance.objidnum, "current", instance.rope.origin, "ui_map_icon_obj_ascender_rope");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(instance.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(instance.objidnum, instance.rope.upvec[2] * -1 + 100);
    namespace_5a22b6f3a56f7e9b::function_9cad42ac02eff950(instance.objidnum);
    foreach (player in instance.arena.arenaplayers) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(instance.objidnum, player);
    }
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cc
// Size: 0x2c
function function_5d0f8563db57a967(instance) {
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(instance.objidnum);
    instance.objidnum = -1;
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ff
// Size: 0x8d
function function_ddc0c02aa77e9268(instance, player, edgeindex, var_7a117370745e5467, isinverted, var_9cb491b9ab8ea354) {
    if (istrue(instance.var_ea780f20ab06e68a) && instance.var_487f3dd052af102c != "down") {
        s = spawnstruct();
        s.type = "HINT_NOBUTTON";
        s.string = "";
        return s;
    }
    return undefined;
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x994
// Size: 0x4b
function function_71582b761a9132e7(instance, player, edgeindex, isinverted) {
    if (istrue(instance.var_ea780f20ab06e68a) && instance.var_487f3dd052af102c != "down") {
        return 0;
    }
    return undefined;
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e7
// Size: 0x76
function function_6d7f8ac81d81ee2d(arena) {
    foreach (ascender in arena.ascenders) {
        level thread function_2d90839b9225f69e(ascender);
        ascender setscriptablepartstate("top", "use");
    }
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa64
// Size: 0x116
function function_630d643e20b202a2(arena) {
    foreach (ascender in arena.ascenders) {
        ascender setscriptablepartstate("top", "off");
        if (ascender.var_487f3dd052af102c != "up") {
            ascender.rope setscriptablepartstate("rope", "end");
        }
        function_5d0f8563db57a967(ascender);
    }
    foreach (player in arena.arenaplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (player namespace_82dcd1d5ae30ff7::_hasperk("specialty_ascender_scale")) {
            player namespace_82dcd1d5ae30ff7::removeperk("specialty_ascender_scale");
        }
    }
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb81
// Size: 0x28
function function_8ae33204ae68c976(player) {
    if (player namespace_82dcd1d5ae30ff7::_hasperk("specialty_ascender_scale")) {
        player namespace_82dcd1d5ae30ff7::removeperk("specialty_ascender_scale");
    }
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb0
// Size: 0x99
function function_57d827764e049f21(arena, var_55c0e7e44829e72e) {
    foreach (ascender in arena.ascenders) {
        if (ascender.var_487f3dd052af102c == "up" && arena.time <= var_55c0e7e44829e72e + 1) {
            level thread function_b21d67600134d787(arena, ascender);
        }
    }
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc50
// Size: 0x89
function function_3fd1a99e2ac61cd1(arena) {
    if (!function_bbc309466ce88c71(arena)) {
        return 0;
    }
    foreach (player in arena.arenaplayers) {
        player namespace_82dcd1d5ae30ff7::giveperk("specialty_ascender_scale");
        thread function_8e5385ed332adbd5(arena, player);
    }
    thread function_7ad3c045be29a1a2(arena);
    return 1;
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce1
// Size: 0x93
function function_7ad3c045be29a1a2(arena) {
    arena endon("matchEnded");
    while (1) {
        if (function_d58fea226bf50a8d(arena)) {
            break;
        }
        waitframe();
    }
    foreach (ascender in arena.ascenders) {
        ascender.rope setscriptablepartstate("rope", "idle");
    }
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7b
// Size: 0x46
function function_f47d8fbd1e16f89a(arena) {
    if (!function_bbc309466ce88c71(arena)) {
        return 0;
    }
    while (1) {
        if (function_d58fea226bf50a8d(arena)) {
            waitframe();
        } else if (istrue(arena.fightover)) {
            waitframe();
        } else {
            break;
        }
    }
    return 1;
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc9
// Size: 0x68
function function_d58fea226bf50a8d(arena) {
    foreach (player in arena.arenaplayers) {
        if (player function_9cc921a57ff4deb5()) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe39
// Size: 0x48
function function_8e5385ed332adbd5(arena, player) {
    arena endon("matchEnded");
    while (1) {
        var_dc634b53246dc6ee = player waittill("ascender_detached");
        if (!istrue(var_dc634b53246dc6ee)) {
            break;
        }
    }
    thread function_cb1b43cc32251f6f(arena, player);
}

// Namespace namespace_5224c1e851beffac/namespace_21b1a5889fd8d167
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe88
// Size: 0x131
function function_cb1b43cc32251f6f(arena, winner) {
    foreach (player in arena.arenaplayers) {
        if (isalive(player) && player != winner) {
            if (namespace_eb17b46cdcb98eea::function_1980065ce4dc067b()) {
                player thread namespace_47fd1e79a44628cd::gulagplayerlost(arena, "br_twotwo_gulag_lost_flag", 1);
            } else {
                player thread namespace_47fd1e79a44628cd::gulagplayerlost(arena);
            }
        }
    }
    foreach (ascender in arena.ascenders) {
        ascender setscriptablepartstate("top", "off");
    }
    arena notify("matchEnded");
    if (namespace_eb17b46cdcb98eea::function_1980065ce4dc067b()) {
        winner namespace_6ea7652ec407cc80::function_dc0a56e258889cb(arena, "br_twotwo_gulag_win_flag");
    }
    namespace_47fd1e79a44628cd::handleendarena(arena);
    arena notify("fight_over_early");
}

