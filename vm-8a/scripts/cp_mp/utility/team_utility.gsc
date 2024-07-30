#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace team_utility;

// Namespace team_utility / scripts\cp_mp\utility\team_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad
// Size: 0x28
function function_a92ed2f4c44e5ffa() {
    if (issharedfuncdefined("team_utility", "init")) {
        [[ getsharedfunc("team_utility", "init") ]]();
    }
}

// Namespace team_utility / scripts\cp_mp\utility\team_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdd
// Size: 0x3c
function getfriendlyplayers(testteam, aliveonly) {
    if (issharedfuncdefined("team_utility", "getFriendlyPlayers")) {
        return [[ getsharedfunc("team_utility", "getFriendlyPlayers") ]](testteam, aliveonly);
    }
    return [];
}

// Namespace team_utility / scripts\cp_mp\utility\team_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122
// Size: 0x3c
function getenemyplayers(testteam, aliveonly) {
    if (issharedfuncdefined("team_utility", "getEnemyPlayers")) {
        return [[ getsharedfunc("team_utility", "getEnemyPlayers") ]](testteam, aliveonly);
    }
    return [];
}

