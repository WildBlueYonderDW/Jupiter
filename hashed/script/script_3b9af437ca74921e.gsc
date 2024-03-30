// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5bc86a57086a4774;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\common\vehicle.gsc;

#namespace namespace_2711c9ad461eb709;

// Namespace namespace_2711c9ad461eb709 / namespace_a7d5183f69e271b0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150
// Size: 0x51
function inittask() {
    function_ac97a4f2ab8c2d53("movement", "tryAssignTask", &function_851152959e7c1c87);
    function_ac97a4f2ab8c2d53("movement", "tryBindObjective", &tryBindObjective);
    scripts/mp/gametypes/br_gametypes::registerbrgametypefunc("onInfilJumpCompleted", &onInfilJumpCompleted);
    scripts/mp/gametypes/br_gametypes::registerbrgametypefunc("onPlayerEnterVehicle", &onPlayerEnterVehicle);
}

// Namespace namespace_2711c9ad461eb709 / namespace_a7d5183f69e271b0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8
// Size: 0x15
function function_851152959e7c1c87(taskinstance) {
    thread function_4da8fcef740e954f(taskinstance);
}

// Namespace namespace_2711c9ad461eb709 / namespace_a7d5183f69e271b0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c4
// Size: 0x101
function function_4da8fcef740e954f(taskinstance) {
    if (!isdefined(taskinstance.info.targetnum)) {
        return;
    }
    level endon("game_ended");
    taskinstance endon("task_end");
    while (taskinstance.currentvalue < taskinstance.info.targetnum) {
        foreach (player in level.teamdata[taskinstance.team]["players"]) {
            isvalid = player function_17aae3fd2c16468(taskinstance);
            if (isvalid) {
                taskvalue = updateprogress(taskinstance, player);
                function_89b8bce3baa45edc(taskinstance, taskvalue);
                continue;
            }
            player.var_7f4e080484f571f6 = undefined;
        }
        wait(0.1);
    }
}

// Namespace namespace_2711c9ad461eb709 / namespace_a7d5183f69e271b0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc
// Size: 0x84
function updateprogress(taskinstance, player) {
    if (isdefined(player.var_7f4e080484f571f6)) {
        movedistance = distance(player.origin, player.var_7f4e080484f571f6);
        player.var_7f4e080484f571f6 = player.origin;
        return (movedistance * 0.0254);
    }
    player.var_7f4e080484f571f6 = player.origin;
    return 0;
}

// Namespace namespace_2711c9ad461eb709 / namespace_a7d5183f69e271b0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x357
// Size: 0xb9
function function_17aae3fd2c16468(taskinstance) {
    if (!istrue(self.var_da8de99c15dd631e) && getdvarint(@"hash_25ad2925d6075c8f", 0) != 2) {
        return 0;
    }
    switch (taskinstance.info.ref) {
    case #"hash_dbbbdac18e6db00d":
        return self isonground();
    case #"hash_a38d380991002d3b":
        return self function_793f941d7dff15ed();
    case #"hash_7768ce0d537e9bbc":
        return self isparachuting();
    default:
        /#
            assertmsg("Champion task reference is not found: " + taskinstance.info.ref);
        #/
        break;
    }
    return 0;
}

// Namespace namespace_2711c9ad461eb709 / namespace_a7d5183f69e271b0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x418
// Size: 0xe
function onInfilJumpCompleted() {
    self.var_da8de99c15dd631e = 1;
}

// Namespace namespace_2711c9ad461eb709 / namespace_a7d5183f69e271b0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d
// Size: 0x11e
function onPlayerEnterVehicle(vehicle, target) {
    if (!isdefined(vehicle)) {
        return;
    }
    if (isdefined(target.objectiveinfo) && target.objectiveinfo.item scripts/common/vehicle::isvehicle()) {
        target removeobjectiveinfo();
    }
    foreach (player in level.players) {
        vehiclemarked = isdefined(player.objectiveinfo) && isdefined(player.objectiveinfo.item) && player.objectiveinfo.item == vehicle;
        var_618adc4f1f1c1872 = target.team != player.team;
        if (vehiclemarked && var_618adc4f1f1c1872) {
            player function_8fd21242a694aa72();
        }
    }
}

// Namespace namespace_2711c9ad461eb709 / namespace_a7d5183f69e271b0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x552
// Size: 0x98
function function_59c1dbdc2ad03ad6(taskinstance, vehicle) {
    if (isdefined(vehicle.team) && vehicle.team != taskinstance.team && vehicle.team != "neutral") {
        return false;
    }
    if (isdefined(vehicle.ownerteam) && vehicle.ownerteam != taskinstance.team && vehicle.ownerteam != "neutral") {
        return false;
    }
    return true;
}

// Namespace namespace_2711c9ad461eb709 / namespace_a7d5183f69e271b0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f2
// Size: 0x63
function tryBindObjective(taskinstance) {
    if (taskinstance.info.ref != "travelvehicle" || self function_793f941d7dff15ed()) {
        return;
    }
    items = vehicle_getarrayinradius(self.origin, 50000);
    function_2e55101ffd0d483c(taskinstance, items, &function_59c1dbdc2ad03ad6, 100, 1);
}

