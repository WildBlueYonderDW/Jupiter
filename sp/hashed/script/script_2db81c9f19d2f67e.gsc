#using scripts\common\heartbeat;

#namespace heartbeat_sp;

// Namespace heartbeat_sp / namespace_40188fde8bf4018a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70
// Size: 0xe
function main() {
    function_94461e6fd9196c6a(&playsoundfunc);
}

// Namespace heartbeat_sp / namespace_40188fde8bf4018a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x86
// Size: 0xa
function function_767efe0110bfa73a() {
    thread function_a9c6f7587066ce13();
}

// Namespace heartbeat_sp / namespace_40188fde8bf4018a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x98
// Size: 0x23
function playsoundfunc(var_78264a131b0e70ac, var_1ddc31dc2f8faa49, soundsource) {
    self playlocalsound(var_78264a131b0e70ac);
}

