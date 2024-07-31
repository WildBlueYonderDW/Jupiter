#using script_16ea1b94f0f381b3;
#using scripts\common\system.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2d425a56b4025faa;
#using scripts\engine\utility.gsc;
#using script_61c5258ded4d690d;

#namespace ww_setup;

// Namespace ww_setup / namespace_84ca0cfd6e8ef02c
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xcc
// Size: 0x21
function private autoexec __init__system__() {
    system::register(#"hash_eae80affe3affaf", #"ww_setup", &pre_main, undefined);
}

// Namespace ww_setup / namespace_84ca0cfd6e8ef02c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf5
// Size: 0x18
function private pre_main() {
    utility::registersharedfunc("ww_setup", "init", &init);
}

// Namespace ww_setup / namespace_84ca0cfd6e8ef02c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x115
// Size: 0x2
function private init() {
    
}

