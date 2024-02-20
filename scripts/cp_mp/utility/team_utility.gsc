// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace team_utility;

// Namespace team_utility/namespace_72db5b57938f0d6d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad
// Size: 0x29
function function_a92ed2f4c44e5ffa() {
    if (issharedfuncdefined("team_utility", "init")) {
        [[ getsharedfunc("team_utility", "init") ]]();
    }
}

// Namespace team_utility/namespace_72db5b57938f0d6d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdd
// Size: 0x3d
function getfriendlyplayers(var_68bb1f110ec06a58, var_7102f45d5f0b5834) {
    if (issharedfuncdefined("team_utility", "getFriendlyPlayers")) {
        return [[ getsharedfunc("team_utility", "getFriendlyPlayers") ]](var_68bb1f110ec06a58, var_7102f45d5f0b5834);
    }
    return [];
}

// Namespace team_utility/namespace_72db5b57938f0d6d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122
// Size: 0x3d
function getenemyplayers(var_68bb1f110ec06a58, var_7102f45d5f0b5834) {
    if (issharedfuncdefined("team_utility", "getEnemyPlayers")) {
        return [[ getsharedfunc("team_utility", "getEnemyPlayers") ]](var_68bb1f110ec06a58, var_7102f45d5f0b5834);
    }
    return [];
}

