#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_3a9930dfe832ae05;
#using scripts\common\powerups.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\mp\gametypes\br_weapons.gsc;
#using script_7feaed3f883fe324;
#using script_38eac2888ef17fd;

#namespace namespace_73d87acd9f4a87e2;

// Namespace namespace_73d87acd9f4a87e2 / namespace_1e4242011a51ac3d
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x147
// Size: 0x2e
function autoexec main() {
    if (getdvarint(@"hash_5f4c8ff726eb8e87", 0) && !getdvarint(@"hash_6d05eef17bf3efaa", 0)) {
        init();
    }
}

// Namespace namespace_73d87acd9f4a87e2 / namespace_1e4242011a51ac3d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17d
// Size: 0x51
function init() {
    utility::registersharedfunc("powerup_nuke", "should_drop", &should_drop);
    utility::registersharedfunc("powerup_nuke", "drop_nuke_powerup", &function_75967f67a36943bb);
    utility::registersharedfunc("powerup_nuke", "trigger_nuke", &trigger_nuke);
    level utility::flag_set("powerup_disable_nuke");
}

// Namespace namespace_73d87acd9f4a87e2 / namespace_1e4242011a51ac3d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6
// Size: 0x3
function should_drop() {
    return false;
}

// Namespace namespace_73d87acd9f4a87e2 / namespace_1e4242011a51ac3d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2
// Size: 0x3e
function function_75967f67a36943bb(spawn_pos, var_34aaa11969c15df) {
    if (utility::issharedfuncdefined("powerups", "dropPowerup")) {
        return utility::function_f3bb4f4911a1beb2("powerups", "dropPowerup", "nuke", spawn_pos, var_34aaa11969c15df);
    }
}

// Namespace namespace_73d87acd9f4a87e2 / namespace_1e4242011a51ac3d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x228
// Size: 0x49
function trigger_nuke(origin, var_5d48d7bb369890ab, var_16ae9c6156ab4fab) {
    dummy_struct = {#origin:origin};
    namespace_46474fbe41dfa60d::grab_nuke("nuke", dummy_struct, 1, 1, 1, 1, var_5d48d7bb369890ab, var_16ae9c6156ab4fab);
}

