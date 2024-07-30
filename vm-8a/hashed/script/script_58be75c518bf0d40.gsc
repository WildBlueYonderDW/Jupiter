#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace squad_utility;

// Namespace squad_utility / namespace_ca7b90256548aa40
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14f
// Size: 0x28
function function_c9406922e0267f09() {
    if (issharedfuncdefined("squad_utility", "init")) {
        [[ getsharedfunc("squad_utility", "init") ]]();
    }
}

// Namespace squad_utility / namespace_ca7b90256548aa40
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f
// Size: 0x57
function getsquadmembers(testteam, aliveonly) {
    if (!isdefined(testteam) && !(isdefined(self) && isdefined(self.team))) {
        return [];
    }
    if (issharedfuncdefined("squad_utility", "getSquadMembers")) {
        return [[ getsharedfunc("squad_utility", "getSquadMembers") ]](testteam, aliveonly);
    }
    return [];
}

// Namespace squad_utility / namespace_ca7b90256548aa40
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df
// Size: 0x4c
function getsquadleader(team, index) {
    if (!istrue(level.usesquadleader)) {
        return undefined;
    }
    if (!isdefined(level.squaddata[team][index])) {
        return undefined;
    }
    return level.squaddata[team][index].squadleader;
}

// Namespace squad_utility / namespace_ca7b90256548aa40
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234
// Size: 0x16d
function shouldmodesetsquads() {
    if (isdefined(level.gametypebundle) && istrue(level.gametypebundle.issquadmode)) {
        return issquadmode();
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (istrue(scripts\engine\utility::function_f3bb4f4911a1beb2("teamAssim", "isEnabled"))) {
            var_14babd7bb6a93112 = scripts\engine\utility::function_f3bb4f4911a1beb2("teamAssim", "getMaxAssimilationTeamSize");
            return (isdefined(var_14babd7bb6a93112) && var_14babd7bb6a93112 > 1);
        } else {
            return issquadmode();
        }
    }
    switch (level.gametype) {
    case #"hash_1e4846dca3ccf38":
    case #"hash_ca6516c10db2c95":
    case #"hash_25397d96e5bc8403":
    case #"hash_5e78ea9021845d4a":
    case #"hash_5ff8e011d5b9d1c8":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8c758b84936e8d42":
    case #"hash_8f01ce022684fbc8":
    case #"hash_9a6f07d0214a87db":
    case #"hash_b7ddfbe1d0e2457a":
    case #"hash_b8aae84522ccf348":
    case #"hash_bc5ad0664c3cc103":
    case #"hash_c065cef60f38490a":
    case #"hash_c4f97a56da3b7cde":
    case #"hash_c7f4420f385eeb3d":
    case #"hash_dcb9324af7bb9f35":
    case #"hash_fa2ae2f6bd652314": 
        return issquadmode();
    default: 
        return 0;
    }
}

// Namespace squad_utility / namespace_ca7b90256548aa40
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9
// Size: 0x9e
function function_a9cb1bbce9eb3d1b() {
    if (isdefined(level.gametypebundle) && istrue(level.gametypebundle.var_597e7a2e7fd129b)) {
        return 1;
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() == "rumble_mgl") {
            return 0;
        } else if (getdvarint(@"hash_80ba0c604a8e46f3", 0) == 1) {
            return 0;
        } else {
            return 1;
        }
    }
    switch (level.gametype) {
    case #"hash_25397d96e5bc8403":
    case #"hash_5ff8e011d5b9d1c8": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace squad_utility / namespace_ca7b90256548aa40
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f
// Size: 0xe
function issquadmode() {
    return level.maxsquadsize > 1;
}

// Namespace squad_utility / namespace_ca7b90256548aa40
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x466
// Size: 0x48
function function_6b09c63febc4655c(team, index) {
    if (!isdefined(level.squaddata[team][index])) {
        return false;
    }
    return level.squaddata[team][index].players.size == level.maxsquadsize;
}

// Namespace squad_utility / namespace_ca7b90256548aa40
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b7
// Size: 0x38
function function_9b1d18c04d310cfc(player1, player2) {
    var_95cd83fc3f6a06a0 = player1 getsquadmembers(player1.team);
    return array_contains(var_95cd83fc3f6a06a0, player2);
}

