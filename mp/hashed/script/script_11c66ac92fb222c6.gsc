#using script_2793747e1eb61426;
#using script_57d78f3552757ec4;
#using script_62d456d3f9853f1f;
#using script_dcfb962c53fd451;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\utility;

#namespace namespace_9d9cf08d2a584bbd;

// Namespace namespace_9d9cf08d2a584bbd / namespace_66d1114680040ff2
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x218
// Size: 0x14
function autoexec init() {
    level callback::add("ob_season_main", &main);
}

// Namespace namespace_9d9cf08d2a584bbd / namespace_66d1114680040ff2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x234
// Size: 0x7b
function main(params) {
    mapname = getmapname();
    switch (mapname) {
    case #"hash_2a217809d161f926":
    case #"hash_9ae3f9a4f2372775":
        if (getdvarint(@"hash_b7dea0f9b277d423", 0)) {
            namespace_cecde955dda2ae50::main();
            namespace_34b6dd083314d3eb::function_cee5bf8a986d86df();
        }
        thread function_866ec2626b84937a();
        break;
    }
    level callback::remove("ob_season_main", &main);
}

// Namespace namespace_9d9cf08d2a584bbd / namespace_66d1114680040ff2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2b7
// Size: 0x102
function private function_866ec2626b84937a() {
    level endon("game_ended");
    namespace_7c5f02a0fd98d52b::main();
    level flag_wait("ob_infil_completed");
    waitframe();
    level.var_46f34dd309687113["toxic"] = getentitylessscriptablearray("ob_glyph_puzzle_01", "script_noteworthy")[0];
    level.var_46f34dd309687113["ice"] = getentitylessscriptablearray("ob_glyph_puzzle_02", "script_noteworthy")[0];
    level.var_46f34dd309687113["fire"] = getentitylessscriptablearray("ob_glyph_puzzle_03", "script_noteworthy")[0];
    foreach (visual_scr in level.var_46f34dd309687113) {
        visual_scr setscriptablepartstate("glyph_part", "idle");
    }
    function_139b4b175d67e8ed("fire");
    function_139b4b175d67e8ed("toxic");
    function_139b4b175d67e8ed("ice");
}

// Namespace namespace_9d9cf08d2a584bbd / namespace_66d1114680040ff2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c1
// Size: 0xed
function function_7eb73407060d7cb6(state) {
    obelisk = self;
    var_56b2e73c107aae45 = level.var_46f34dd309687113[obelisk.element];
    switch (state) {
    case 0:
        var_56b2e73c107aae45 setscriptablepartstate("glyph_part", "idle");
        break;
    case 1:
        var_56b2e73c107aae45 setscriptablepartstate("glyph_part", "on_purple");
        break;
    case 2:
        if (!obelisk.var_e00ac5b70d752deb) {
            var_56b2e73c107aae45 setscriptablepartstate("glyph_part", "on_red");
        } else {
            var_56b2e73c107aae45 setscriptablepartstate("glyph_part", "on_yellow");
        }
        break;
    case 3:
        if (!obelisk.var_e00ac5b70d752deb) {
            var_56b2e73c107aae45 setscriptablepartstate("glyph_part", "on_red");
        }
        break;
    }
}

// Namespace namespace_9d9cf08d2a584bbd / namespace_66d1114680040ff2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4b6
// Size: 0x10e
function private function_139b4b175d67e8ed(element) {
    root = "spatial_" + element;
    var_96ae350eff4a278d = root + "_obelisk";
    rewardname = root + "_reward";
    var_ad4e22cbc6905735 = root + "_runes";
    var_49c63717e2a4434e = root + "_negotiator";
    var_1869de20987d284d = root + "_orb";
    obelisk = getstruct(var_96ae350eff4a278d, "targetname");
    reward = getstruct(rewardname, "targetname");
    runes = getstructarray(var_ad4e22cbc6905735, "script_noteworthy");
    orb = getstruct(var_1869de20987d284d, "targetname");
    reward = getstruct(rewardname, "targetname");
    var_db918367a232870d = getstruct(var_49c63717e2a4434e, "targetname");
    namespace_1ebb55028b525060::function_d99864f8b4032562(element, obelisk, runes, orb, var_db918367a232870d, reward, &function_7eb73407060d7cb6, orb);
}

