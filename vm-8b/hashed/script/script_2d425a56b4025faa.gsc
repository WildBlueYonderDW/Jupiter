#using script_16ea1b94f0f381b3;
#using scripts\common\system.gsc;
#using scripts\engine\utility.gsc;

#namespace ww_setup;

// Namespace ww_setup / namespace_2c21450351e1a828
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xb4
// Size: 0x19
function private autoexec __init__system__() {
    system::register(#"ww_setup", undefined, undefined, &post_main);
}

// Namespace ww_setup / namespace_2c21450351e1a828
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd5
// Size: 0x13
function private post_main() {
    utility::function_f3bb4f4911a1beb2("ww_setup", "init");
}

