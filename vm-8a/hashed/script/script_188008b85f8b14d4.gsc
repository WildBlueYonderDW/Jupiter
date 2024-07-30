#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_973ecfc2f54e9ac3;

// Namespace namespace_973ecfc2f54e9ac3 / namespace_27cdbf2464b21c84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150
// Size: 0x7b
function function_ed4c2d913d203bf(players, notifytype, timeoutoverride) {
    if (!isarray(players)) {
        players = [players];
    }
    foreach (player in players) {
        function_2a728f0062b4e436(player, notifytype, timeoutoverride);
    }
}

// Namespace namespace_973ecfc2f54e9ac3 / namespace_27cdbf2464b21c84
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d3
// Size: 0xb1
function function_2a728f0062b4e436(player, notifytype, timeoutoverride) {
    switch (notifytype) {
    case #"hash_ec031320eb0c7285": 
        notifytype = 1;
        break;
    case #"hash_eb8c170bf600e214": 
        notifytype = 2;
        break;
    case #"hash_772448618dee9a9": 
        notifytype = 3;
        break;
    case #"hash_33270e8005317cc4": 
        notifytype = 4;
        break;
    case #"hash_10eb6d629315a914": 
        notifytype = 5;
        break;
    default: 
        notifytype = 0;
        break;
    }
    if (notifytype > 0) {
        player setclientomnvar("ui_upper_notification_type", notifytype);
        dangernotifyresetforplayer(player, timeoutoverride);
    }
}

// Namespace namespace_973ecfc2f54e9ac3 / namespace_27cdbf2464b21c84
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c
// Size: 0x54
function dangernotifyresetforplayer(player, timeoutoverride) {
    playerid = player getxuid();
    if (!isdefined(timeoutoverride)) {
        timeoutoverride = 4;
    }
    level notify("upper_notification_start_" + playerid);
    level thread watchdangerresetaction(player, playerid, "death_or_disconnect");
    level thread watchdangerresetaction(player, playerid, undefined, timeoutoverride);
}

// Namespace namespace_973ecfc2f54e9ac3 / namespace_27cdbf2464b21c84
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e8
// Size: 0x6b
function watchdangerresetaction(player, playerid, action, timeout) {
    level endon("upper_notification_start_" + playerid);
    level endon("upper_notification_finished_" + playerid);
    level endon("game_ended");
    if (isdefined(action)) {
        player waittill(action);
    } else if (isdefined(timeout)) {
        wait timeout;
    }
    if (isdefined(player)) {
        player setclientomnvar("ui_upper_notification_type", 0);
    }
    level notify("upper_notification_finished_" + playerid);
}

