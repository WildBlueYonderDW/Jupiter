// mwiii decomp prototype
#using script_63258e3c8c400b7a;

#namespace zmbosshealthbar;

// Namespace zmbosshealthbar/namespace_16b628e68243c807
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80
// Size: 0x17
function register() {
    return function_f245f059d32d19d1("ZMBossHealthBar", #"zmbosshealthbar");
}

// Namespace zmbosshealthbar/namespace_16b628e68243c807
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f
// Size: 0x1d
function open(player, flags) {
    function_12e2ab1f2879518a(player, flags);
}

// Namespace zmbosshealthbar/namespace_16b628e68243c807
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3
// Size: 0x14
function close(player) {
    function_e98e8bd148625cd0(player);
}

// Namespace zmbosshealthbar/namespace_16b628e68243c807
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde
// Size: 0x13
function is_open(player) {
    return function_23de77f715d51c8b(player);
}

// Namespace zmbosshealthbar/namespace_16b628e68243c807
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9
// Size: 0x1f
function function_4032c55b1a2de180(player, value) {
    function_2c7278ea5ca893e5(player, 1, value);
}

// Namespace zmbosshealthbar/namespace_16b628e68243c807
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f
// Size: 0x1f
function function_fa61dfb76d14641f(player, value) {
    function_2c7278ea5ca893e5(player, 2, value);
}

// Namespace zmbosshealthbar/namespace_16b628e68243c807
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x145
// Size: 0x1f
function function_c4b608fac8636725(player, value) {
    function_2c7278ea5ca893e5(player, 3, value);
}

// Namespace zmbosshealthbar/namespace_16b628e68243c807
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b
// Size: 0x1f
function function_7996b90ec9893e23(player, value) {
    function_2c7278ea5ca893e5(player, 4, value);
}

