#using scripts\common\system.gsc;
#using scripts\engine\utility.gsc;

#namespace ww_raygun;

// Namespace ww_raygun / namespace_1e80569715c77be9
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x87
// Size: 0x19
function private autoexec __init__system__() {
    system::register(#"ww_raygun", undefined, undefined, &post_main);
}

// Namespace ww_raygun / namespace_1e80569715c77be9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa8
// Size: 0x13
function private post_main() {
    utility::function_f3bb4f4911a1beb2("ww_raygun", "init");
}

