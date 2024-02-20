// mwiii decomp prototype
#using scripts\stealth\manager.gsc;
#using scripts\stealth\utility.gsc;
#using scripts\stealth\threat_sight.gsc;
#using scripts\stealth\player.gsc;

#namespace init;

// Namespace init/namespace_12a61a913ca6f43a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88
// Size: 0xa
function main() {
    namespace_833595e973766257::main();
}

// Namespace init/namespace_12a61a913ca6f43a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99
// Size: 0xdf
function set_stealth_mode(enabled, var_bd2621a5f467fe6c, var_a1f4d479a8c138cd) {
    if (enabled) {
        if (isdefined(var_bd2621a5f467fe6c) && isdefined(var_a1f4d479a8c138cd)) {
            level thread namespace_e124d8b75dab4be0::stealth_music(var_bd2621a5f467fe6c, var_a1f4d479a8c138cd);
        }
        level thread namespace_76383ca64b36529e::threat_sight_set_enabled(1);
        foreach (player in level.players) {
            player thread namespace_975f381a5813b0fd::main();
        }
    } else {
        level thread namespace_e124d8b75dab4be0::stealth_music_stop();
        level thread namespace_76383ca64b36529e::threat_sight_set_enabled(0);
    }
    if (isdefined(level.stealth.fnsetstealthmode)) {
        level thread [[ level.stealth.fnsetstealthmode ]](enabled, var_bd2621a5f467fe6c, var_a1f4d479a8c138cd);
    }
}

