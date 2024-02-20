// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_973ecfc2f54e9ac3;

// Namespace namespace_973ecfc2f54e9ac3/namespace_27cdbf2464b21c84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150
// Size: 0x7c
function function_ed4c2d913d203bf(players, var_1022173ea86a7090, var_334d3b08aef373d4) {
    if (!isarray(players)) {
        players = [0:players];
    }
    foreach (player in players) {
        function_2a728f0062b4e436(player, var_1022173ea86a7090, var_334d3b08aef373d4);
    }
}

// Namespace namespace_973ecfc2f54e9ac3/namespace_27cdbf2464b21c84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d3
// Size: 0xb2
function function_2a728f0062b4e436(player, var_1022173ea86a7090, var_334d3b08aef373d4) {
    switch (var_1022173ea86a7090) {
    case #"hash_ec031320eb0c7285":
        var_1022173ea86a7090 = 1;
        break;
    case #"hash_eb8c170bf600e214":
        var_1022173ea86a7090 = 2;
        break;
    case #"hash_772448618dee9a9":
        var_1022173ea86a7090 = 3;
        break;
    case #"hash_33270e8005317cc4":
        var_1022173ea86a7090 = 4;
        break;
    case #"hash_10eb6d629315a914":
        var_1022173ea86a7090 = 5;
        break;
    default:
        var_1022173ea86a7090 = 0;
        break;
    }
    if (var_1022173ea86a7090 > 0) {
        player setclientomnvar("ui_upper_notification_type", var_1022173ea86a7090);
        dangernotifyresetforplayer(player, var_334d3b08aef373d4);
    }
}

// Namespace namespace_973ecfc2f54e9ac3/namespace_27cdbf2464b21c84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c
// Size: 0x55
function dangernotifyresetforplayer(player, var_334d3b08aef373d4) {
    playerid = player getxuid();
    if (!isdefined(var_334d3b08aef373d4)) {
        var_334d3b08aef373d4 = 4;
    }
    level notify("upper_notification_start_" + playerid);
    level thread watchdangerresetaction(player, playerid, "death_or_disconnect");
    level thread watchdangerresetaction(player, playerid, undefined, var_334d3b08aef373d4);
}

// Namespace namespace_973ecfc2f54e9ac3/namespace_27cdbf2464b21c84
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e8
// Size: 0x6c
function watchdangerresetaction(player, playerid, action, timeout) {
    level endon("upper_notification_start_" + playerid);
    level endon("upper_notification_finished_" + playerid);
    level endon("game_ended");
    if (isdefined(action)) {
        player waittill(action);
    } else if (isdefined(timeout)) {
        wait(timeout);
    }
    if (isdefined(player)) {
        player setclientomnvar("ui_upper_notification_type", 0);
    }
    level notify("upper_notification_finished_" + playerid);
}

