// mwiii decomp prototype
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_3f51a039c4a1a113;

#namespace namespace_4a0bb1ea70d797f2;

// Namespace namespace_4a0bb1ea70d797f2/namespace_f1b48b5f36c13ad3
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x90
// Size: 0x1a
function private autoexec __init__system__() {
    system::register(#"hash_d05ffafd3e6631f6", undefined, undefined, &function_13dad5c9339829d7);
}

// Namespace namespace_4a0bb1ea70d797f2/namespace_f1b48b5f36c13ad3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb1
// Size: 0xf
function private function_13dad5c9339829d7() {
    /#
        level thread function_a2551378bc08f089();
    #/
}

// Namespace namespace_4a0bb1ea70d797f2/namespace_f1b48b5f36c13ad3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc7
// Size: 0x116
function function_bfe75e4a1ee58ef(instance, player) {
    if (isdefined(level.squaddata)) {
        playerteam = player.team;
        var_4bb7e5b5ca699c2a = player.var_ff97225579de16a;
        squadmembers = level.squaddata[playerteam][var_4bb7e5b5ca699c2a].players;
        foreach (squadmember in squadmembers) {
            function_2baca72ada73fba3(squadmember.origin, squadmember, instance.var_fe5d9ff44e12d255, getdvarint(@"hash_b0049102bfc4b5db", 12000), 0);
        }
    } else {
        function_2baca72ada73fba3(player.origin, player, instance.var_fe5d9ff44e12d255, getdvarint(@"hash_b0049102bfc4b5db", 12000), 0);
    }
}

// Namespace namespace_4a0bb1ea70d797f2/namespace_f1b48b5f36c13ad3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e4
// Size: 0x4c
function function_a2551378bc08f089() {
    /#
        thread function_e1ac401f0f3bf679();
        waitframe();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("<unknown string>", @"hash_1d2ba00bff4b4bf8");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("<unknown string>", @"hash_367a9748af80f8d2");
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_4a0bb1ea70d797f2/namespace_f1b48b5f36c13ad3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x237
// Size: 0xb9
function private function_e1ac401f0f3bf679() {
    /#
        level endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_1d2ba00bff4b4bf8", 0)) {
                setdvar(@"hash_1d2ba00bff4b4bf8", 0);
                foreach (player in level.players) {
                    function_2baca72ada73fba3(player.origin, player, getdvarint(@"hash_b0049102bfc4b5db", 12000), getdvarint(@"hash_7cdae490e2d8b495", 60000));
                }
            }
            waitframe();
        }
    #/
}

