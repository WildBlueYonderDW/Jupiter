// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_6853191397ec0259;

#namespace namespace_cc0f9da8a00806f6;

// Namespace namespace_cc0f9da8a00806f6/namespace_9e00394bef0f1e98
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6
// Size: 0x38
function _shellshock(name, category, duration, var_58b4cf4257914e62, var_85d98965b00f0093) {
    namespace_1ce798d596a27341::_shellshock(name, category, duration, var_58b4cf4257914e62, var_85d98965b00f0093);
}

// Namespace namespace_cc0f9da8a00806f6/namespace_9e00394bef0f1e98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5
// Size: 0x13
function _stopshellshock(var_fcef8d217a441961) {
    namespace_1ce798d596a27341::_stopshellshock();
}

// Namespace namespace_cc0f9da8a00806f6/namespace_9e00394bef0f1e98
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff
// Size: 0x6e
function shellshock_artilleryearthquake(position, scale, duration, radius, var_78ce85a35312119) {
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
    shellshock_screenshakeonposition(position, radius, var_78ce85a35312119);
}

// Namespace namespace_cc0f9da8a00806f6/namespace_9e00394bef0f1e98
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174
// Size: 0xc0
function shellshock_screenshakeonposition(position, radius, var_78ce85a35312119) {
    var_8e190d59eee1de81 = utility::playersinsphere(position, radius);
    foreach (player in var_8e190d59eee1de81) {
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(var_78ce85a35312119)) {
            if (isarray(var_78ce85a35312119)) {
                if (array_contains(var_78ce85a35312119, player)) {
                    continue;
                }
                goto LOC_00000091;
            }
            jumpiffalse(player == var_78ce85a35312119) LOC_00000091;
        } else {
        LOC_00000091:
            if (player isusingremote()) {
                continue;
            }
            player setclientomnvar("ui_hud_shake", 1);
        }
    }
}

