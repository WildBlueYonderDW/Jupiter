// mwiii decomp prototype
#using script_16ea1b94f0f381b3;
#using scripts\common\system.gsc;
#using scripts\engine\utility.gsc;

#namespace ww_setup;

// Namespace ww_setup/namespace_2c21450351e1a828
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x8e
// Size: 0x1a
function private autoexec __init__system__() {
    system::register(#"ww_setup", undefined, undefined, &post_main);
}

// Namespace ww_setup/namespace_2c21450351e1a828
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaf
// Size: 0x14
function private post_main() {
    utility::function_f3bb4f4911a1beb2("ww_setup", "init");
}

