// mwiii decomp prototype
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\system.gsc;

#namespace radio_tower;

// Namespace radio_tower / scripts/mp/radio_tower
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x90
// Size: 0x1a
function private autoexec __init__system__() {
    system::register(#"radio_tower", undefined, undefined, &function_13dad5c9339829d7);
}

// Namespace radio_tower / scripts/mp/radio_tower
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb1
// Size: 0xf
function private function_13dad5c9339829d7() {
    /#
        level thread function_a2551378bc08f089();
    #/
}

// Namespace radio_tower / scripts/mp/radio_tower
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc7
// Size: 0x116
function function_bfe75e4a1ee58ef(instance, player) {
    if (isdefined(level.squaddata)) {
        playerteam = player.team;
        playersquadindex = player.sessionsquadid;
        squadmembers = level.squaddata[playerteam][playersquadindex].players;
        foreach (squadmember in squadmembers) {
            function_2baca72ada73fba3(squadmember.origin, squadmember, instance.indexnum, getdvarint(@"hash_b0049102bfc4b5db", 12000), 0);
        }
        return;
    }
    function_2baca72ada73fba3(player.origin, player, instance.indexnum, getdvarint(@"hash_b0049102bfc4b5db", 12000), 0);
}

// Namespace radio_tower / scripts/mp/radio_tower
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e4
// Size: 0x4c
function function_a2551378bc08f089() {
    /#
        thread function_e1ac401f0f3bf679();
        waitframe();
        scripts/common/devgui::function_6e7290c8ee4f558b("<unknown string>");
        scripts/common/devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_1d2ba00bff4b4bf8");
        scripts/common/devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_367a9748af80f8d2");
        scripts/common/devgui::function_fe953f000498048f();
    #/
}

// Namespace radio_tower / scripts/mp/radio_tower
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x237
// Size: 0xb9
function private function_e1ac401f0f3bf679() {
    /#
        level endon("<unknown string>");
        while (true) {
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

