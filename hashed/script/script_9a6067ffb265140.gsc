#using script_7edf952f8921aa6b;
#using scripts\common\callbacks.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\common\system.gsc;
#using scripts\common\utility.gsc;
#using script_5acb344add63cac4;
#using script_6d4be2d2674d1812;
#using scripts\engine\utility.gsc;

#namespace namespace_53f736f2313f7747;

// Namespace namespace_53f736f2313f7747 / namespace_18b578dc125c8b44
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd9
// Size: 0x21
function private autoexec __init__system__() {
    system::register(#"hash_43b335a7dd98c1fb", #"ww_dg2", &pre_main, undefined);
}

// Namespace namespace_53f736f2313f7747 / namespace_18b578dc125c8b44
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x102
// Size: 0x18
function private pre_main() {
    utility::registersharedfunc("ww_dg2", "init", &init);
}

// Namespace namespace_53f736f2313f7747 / namespace_18b578dc125c8b44
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x122
// Size: 0x1d
function private init() {
    level.var_b8d710fc87c905a1 = lightning_chain::create_lightning_chain_params(5, 200, 0, 0.5, 3);
}

