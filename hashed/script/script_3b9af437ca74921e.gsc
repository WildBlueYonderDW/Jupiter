// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5bc86a57086a4774;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\common\vehicle.gsc;

#namespace namespace_2711c9ad461eb709;

// Namespace namespace_2711c9ad461eb709/namespace_a7d5183f69e271b0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150
// Size: 0x51
function function_fe852f92145c24a6() {
    function_ac97a4f2ab8c2d53("movement", "tryAssignTask", &function_851152959e7c1c87);
    function_ac97a4f2ab8c2d53("movement", "tryBindObjective", &tryBindObjective);
    namespace_71073fa38f11492::registerbrgametypefunc("onInfilJumpCompleted", &onInfilJumpCompleted);
    namespace_71073fa38f11492::registerbrgametypefunc("onPlayerEnterVehicle", &onPlayerEnterVehicle);
}

// Namespace namespace_2711c9ad461eb709/namespace_a7d5183f69e271b0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8
// Size: 0x15
function function_851152959e7c1c87(var_17953215dd7c5f9b) {
    thread function_4da8fcef740e954f(var_17953215dd7c5f9b);
}

// Namespace namespace_2711c9ad461eb709/namespace_a7d5183f69e271b0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c4
// Size: 0x101
function function_4da8fcef740e954f(var_17953215dd7c5f9b) {
    if (!isdefined(var_17953215dd7c5f9b.info.targetnum)) {
        return;
    }
    level endon("game_ended");
    var_17953215dd7c5f9b endon("task_end");
    while (var_17953215dd7c5f9b.currentvalue < var_17953215dd7c5f9b.info.targetnum) {
        foreach (player in level.teamdata[var_17953215dd7c5f9b.team]["players"]) {
            isvalid = player function_17aae3fd2c16468(var_17953215dd7c5f9b);
            if (isvalid) {
                var_ff65e066242c67b1 = function_fb5759bf8fc4e733(var_17953215dd7c5f9b, player);
                function_89b8bce3baa45edc(var_17953215dd7c5f9b, var_ff65e066242c67b1);
            } else {
                player.var_7f4e080484f571f6 = undefined;
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_2711c9ad461eb709/namespace_a7d5183f69e271b0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc
// Size: 0x84
function function_fb5759bf8fc4e733(var_17953215dd7c5f9b, player) {
    if (isdefined(player.var_7f4e080484f571f6)) {
        var_3572671d48fb48ab = distance(player.origin, player.var_7f4e080484f571f6);
        player.var_7f4e080484f571f6 = player.origin;
        return (var_3572671d48fb48ab * 0.0254);
    } else {
        player.var_7f4e080484f571f6 = player.origin;
        return 0;
    }
}

// Namespace namespace_2711c9ad461eb709/namespace_a7d5183f69e271b0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x357
// Size: 0xb9
function function_17aae3fd2c16468(var_17953215dd7c5f9b) {
    if (!istrue(self.var_da8de99c15dd631e) && getdvarint(@"hash_25ad2925d6075c8f", 0) != 2) {
        return 0;
    }
    switch (var_17953215dd7c5f9b.info.ref) {
    case #"hash_dbbbdac18e6db00d":
        return self isonground();
    case #"hash_a38d380991002d3b":
        return self function_793f941d7dff15ed();
    case #"hash_7768ce0d537e9bbc":
        return self isparachuting();
    default:
        /#
            assertmsg("Champion task reference is not found: " + var_17953215dd7c5f9b.info.ref);
        #/
        break;
    }
    return 0;
}

// Namespace namespace_2711c9ad461eb709/namespace_a7d5183f69e271b0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x418
// Size: 0xe
function onInfilJumpCompleted() {
    self.var_da8de99c15dd631e = 1;
}

// Namespace namespace_2711c9ad461eb709/namespace_a7d5183f69e271b0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d
// Size: 0x11e
function onPlayerEnterVehicle(vehicle, target) {
    if (!isdefined(vehicle)) {
        return;
    }
    if (isdefined(target.var_b8abadd2c4d56fd8) && target.var_b8abadd2c4d56fd8.item namespace_dbbb37eb352edf96::isvehicle()) {
        target function_afe6658cffe7d1a8();
    }
    foreach (player in level.players) {
        var_600955d039b2fd47 = isdefined(player.var_b8abadd2c4d56fd8) && isdefined(player.var_b8abadd2c4d56fd8.item) && player.var_b8abadd2c4d56fd8.item == vehicle;
        var_618adc4f1f1c1872 = target.team != player.team;
        if (var_600955d039b2fd47 && var_618adc4f1f1c1872) {
            player function_8fd21242a694aa72();
        }
    }
}

// Namespace namespace_2711c9ad461eb709/namespace_a7d5183f69e271b0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x552
// Size: 0x98
function function_59c1dbdc2ad03ad6(var_17953215dd7c5f9b, vehicle) {
    if (isdefined(vehicle.team) && vehicle.team != var_17953215dd7c5f9b.team && vehicle.team != "neutral") {
        return 0;
    }
    if (isdefined(vehicle.ownerteam) && vehicle.ownerteam != var_17953215dd7c5f9b.team && vehicle.ownerteam != "neutral") {
        return 0;
    }
    return 1;
}

// Namespace namespace_2711c9ad461eb709/namespace_a7d5183f69e271b0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f2
// Size: 0x63
function tryBindObjective(var_17953215dd7c5f9b) {
    if (var_17953215dd7c5f9b.info.ref != "travelvehicle" || self function_793f941d7dff15ed()) {
        return;
    }
    items = vehicle_getarrayinradius(self.origin, 50000);
    function_2e55101ffd0d483c(var_17953215dd7c5f9b, items, &function_59c1dbdc2ad03ad6, 100, 1);
}

