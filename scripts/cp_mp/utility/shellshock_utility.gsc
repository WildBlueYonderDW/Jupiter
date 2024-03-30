// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_6853191397ec0259;

#namespace shellshock_utility;

// Namespace shellshock_utility / scripts/cp_mp/utility/shellshock_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6
// Size: 0x38
function _shellshock(name, category, duration, animationresponse, interruptdelayms) {
    namespace_1ce798d596a27341::_shellshock(name, category, duration, animationresponse, interruptdelayms);
}

// Namespace shellshock_utility / scripts/cp_mp/utility/shellshock_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5
// Size: 0x13
function _stopshellshock(fromdeath) {
    namespace_1ce798d596a27341::_stopshellshock();
}

// Namespace shellshock_utility / scripts/cp_mp/utility/shellshock_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff
// Size: 0x6e
function shellshock_artilleryearthquake(position, scale, duration, radius, ignoreclients) {
    playrumbleonposition("artillery_rumble", position);
    if (!isdefined(scale)) {
        scale = 0.7;
    }
    if (!isdefined(duration)) {
        duration = 0.5;
    }
    if (!isdefined(radius)) {
        radius = 800;
    }
    earthquake(scale, duration, position, radius);
    shellshock_screenshakeonposition(position, radius, ignoreclients);
}

// Namespace shellshock_utility / scripts/cp_mp/utility/shellshock_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174
// Size: 0xc0
function shellshock_screenshakeonposition(position, radius, ignoreclients) {
    shockplayers = utility::playersinsphere(position, radius);
    foreach (player in shockplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(ignoreclients)) {
            if (isarray(ignoreclients)) {
                if (array_contains(ignoreclients, player)) {
                    continue;
                }
            } else if (player == ignoreclients) {
                continue;
            }
        }
        if (player isusingremote()) {
            continue;
        }
        player setclientomnvar("ui_hud_shake", 1);
    }
}

