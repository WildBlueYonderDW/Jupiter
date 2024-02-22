// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_46cf752d93dc17b;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;

#namespace namespace_d3cf3492214e1e4f;

// Namespace namespace_d3cf3492214e1e4f/namespace_8fb3ba83379e798c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa
// Size: 0x141
function init() {
    namespace_fd99f400a596934b::init();
    level.var_5d2af95280a3cf58 = getdvarint(@"hash_36a630e359ea8611", 16000);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("dmz_supply_drop", &namespace_fd99f400a596934b::function_94ff06d2db58e807);
    dropstruct = namespace_fd99f400a596934b::function_69b2e5235bfb7998("dmz_c17_drop", "military_carepackage_03_dmz");
    namespace_fd99f400a596934b::function_80e49e34fc8d70b8("dmz_c17_drop", "onDropSpawned", &function_baa146d001c08201);
    dropstruct.planemodel = "veh9_mil_air_cargo_plane_wm_dmz";
    dropstruct = namespace_fd99f400a596934b::function_69b2e5235bfb7998("dmz_samsite_drop", "military_carepackage_03_dmz_samsite");
    namespace_fd99f400a596934b::function_80e49e34fc8d70b8("dmz_samsite_drop", "onDropSpawned", &function_baa146d001c08201);
    dropstruct.planemodel = "veh9_mil_air_cargo_plane_wm_dmz";
    dropstruct = namespace_fd99f400a596934b::function_69b2e5235bfb7998("dmz_supply_drop", "military_carepackage_03_dmz_supply");
    namespace_fd99f400a596934b::function_80e49e34fc8d70b8("dmz_supply_drop", "onDropSpawned", &function_baa146d001c08201);
    dropstruct.planemodel = "veh9_mil_air_cargo_plane_wm_dmz";
    dropstruct = namespace_fd99f400a596934b::function_69b2e5235bfb7998("dmz_boss_drop", "military_carepackage_03_dmz_boss");
    namespace_fd99f400a596934b::function_80e49e34fc8d70b8("dmz_boss_drop", "onDropSpawned", &function_baa146d001c08201);
    dropstruct.planemodel = "veh9_mil_air_cargo_plane_wm_dmz";
    if (getdvarint(@"hash_531f1530cb50bb4a", 1) == 0) {
        return;
    }
    level thread function_9a7d934b60433cd9();
}

// Namespace namespace_d3cf3492214e1e4f/namespace_8fb3ba83379e798c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x342
// Size: 0x2a
function function_baa146d001c08201(var_8ee83e2cbd3d747d) {
    var_40920b1903f4682a = "cashdrop_common";
    self setscriptablepartstate("objective_map", var_40920b1903f4682a, 0);
}

// Namespace namespace_d3cf3492214e1e4f/namespace_8fb3ba83379e798c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x373
// Size: 0x11f
function function_9a7d934b60433cd9() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    waittime = getdvarint(@"hash_7affedbe66b614ea", 300);
    wait(waittime);
    level thread function_9bcdecc2b1fcc04c();
    teamcount = level.teamswithplayers.size;
    if (teamcount > 1) {
        var_4540e9373196eaaf = function_593929a3be0bb12d(level.teamswithplayers[0]);
        var_ab5b12377ca2b989 = function_593929a3be0bb12d(level.teamswithplayers[1]);
        if (isdefined(var_4540e9373196eaaf) && isdefined(var_ab5b12377ca2b989)) {
            pos = (var_4540e9373196eaaf + var_ab5b12377ca2b989) / 2;
            namespace_fd99f400a596934b::function_1a01863a6ec2ad05(drop_to_ground(pos), "dmz_c17_drop");
        }
    } else {
        foreach (player in level.players) {
            if (isreallyalive(player)) {
                function_3ee855cfe6f5f8d5(player);
                return;
            }
        }
    }
}

// Namespace namespace_d3cf3492214e1e4f/namespace_8fb3ba83379e798c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499
// Size: 0x1b
function function_9bcdecc2b1fcc04c() {
    wait(3);
    namespace_d696adde758cbe79::showdmzsplash("dmz_supply_drop", level.players);
}

// Namespace namespace_d3cf3492214e1e4f/namespace_8fb3ba83379e798c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bb
// Size: 0x88
function function_3ee855cfe6f5f8d5(player) {
    droppos = player.origin;
    var_491f9f618ad350f6 = getdvarint(@"hash_ab10323144550acf", 2000);
    var_5e1fcd736aa390a3 = getdvarint(@"hash_a002dde97cd0623e", 3000);
    droppos = drop_to_ground(droppos + vectornormalize(function_6174330574a2a273()) * (randomint(var_5e1fcd736aa390a3) + var_491f9f618ad350f6), 10500);
    namespace_fd99f400a596934b::function_1a01863a6ec2ad05(droppos, "dmz_c17_drop");
}

// Namespace namespace_d3cf3492214e1e4f/namespace_8fb3ba83379e798c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54a
// Size: 0x95
function function_593929a3be0bb12d(team) {
    players = getteamdata(team, "players");
    foreach (player in players) {
        if (isdefined(player) && isreallyalive(player) && isdefined(player.origin)) {
            return player.origin;
        }
    }
    return undefined;
}

