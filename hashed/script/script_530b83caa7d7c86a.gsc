// mwiii decomp prototype
#using script_63258e3c8c400b7a;

#namespace zmdialoguespeaker;

// Namespace zmdialoguespeaker/namespace_6261555d84cbe21c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82
// Size: 0x17
function register() {
    return function_f245f059d32d19d1("ZMDialogueSpeaker", #"zmdialoguespeaker");
}

// Namespace zmdialoguespeaker/namespace_6261555d84cbe21c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1
// Size: 0x1d
function open(player, flags) {
    function_12e2ab1f2879518a(player, flags);
}

// Namespace zmdialoguespeaker/namespace_6261555d84cbe21c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5
// Size: 0x14
function close(player) {
    function_e98e8bd148625cd0(player);
}

// Namespace zmdialoguespeaker/namespace_6261555d84cbe21c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0
// Size: 0x13
function is_open(player) {
    return function_23de77f715d51c8b(player);
}

// Namespace zmdialoguespeaker/namespace_6261555d84cbe21c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb
// Size: 0x1f
function function_8648e60d64e52121(player, value) {
    function_2c7278ea5ca893e5(player, 1, value);
}

// Namespace zmdialoguespeaker/namespace_6261555d84cbe21c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121
// Size: 0x1f
function function_3ca4dc52553bad2f(player, value) {
    function_2c7278ea5ca893e5(player, 2, value);
}

// Namespace zmdialoguespeaker/namespace_6261555d84cbe21c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x147
// Size: 0x1f
function function_5afa8b0a91952746(player, value) {
    function_2c7278ea5ca893e5(player, 3, value);
}

