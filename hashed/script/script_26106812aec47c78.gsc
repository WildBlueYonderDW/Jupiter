// mwiii decomp prototype
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_7fb39a8d1417949b;

// Namespace namespace_7fb39a8d1417949b / namespace_4a013b466af8e310
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x8f
// Size: 0x15
function autoexec init() {
    level callback::add("ob_season_main", &main);
}

// Namespace namespace_7fb39a8d1417949b / namespace_4a013b466af8e310
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab
// Size: 0x1e
function main(params) {
    level callback::remove("ob_season_main", &main);
}

