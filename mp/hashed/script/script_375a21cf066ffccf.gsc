#using script_14183df6f9af8737;
#using scripts\common\ae_utility;
#using scripts\engine\utility;

#namespace namespace_dfad913738a5e768;

// Namespace namespace_dfad913738a5e768 / namespace_55978108062c607f
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x197
// Size: 0x1e
function private autoexec main() {
    if (getdvarint(@"hash_292601f5bad99456", 0) > 0) {
        thread init();
    }
}

// Namespace namespace_dfad913738a5e768 / namespace_55978108062c607f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd
// Size: 0x20
function init() {
    level endon("game_ended");
    thread function_f3fde6cdcc37ae72();
    level waittill("prematch_done");
    function_93a8cc186ef89237();
}

// Namespace namespace_dfad913738a5e768 / namespace_55978108062c607f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5
// Size: 0x36
function function_f3fde6cdcc37ae72() {
    level endon("game_ended");
    waitframe();
    level.brgametype.dialogprefix = "dx_br_brrs_";
    game["dialog"]["match_start"] = "bssc_grav_aaa18";
}

// Namespace namespace_dfad913738a5e768 / namespace_55978108062c607f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x223
// Size: 0x28
function function_93a8cc186ef89237() {
    namespace_6176022cc9d5b3f::initloadouts("classtable:classtable_br_resurgence_supreme", 1);
    namespace_6176022cc9d5b3f::initloadouts("classtable:classtable_br_resurgence_circle2_supreme");
    namespace_6176022cc9d5b3f::initloadouts("classtable:classtable_br_resurgence_circle3_supreme");
}

