// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_58be75c518bf0d40;
#using script_4c770a9a4ad7659c;
#using script_2342b8aad723994e;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace squads;

// Namespace squads/namespace_9bb409deb69fb31d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x288
// Size: 0x6d
function init() {
    level.maxsquadsize = getdvarint(@"hash_15115ef896ca26f2", 1);
    if (level.maxsquadsize && function_a9cb1bbce9eb3d1b()) {
        level.maxsquadsize = level.maxteamsize;
    }
    level.usesquadleader = getdvarint(@"hash_56fe5e64db58eb48", 1);
    if (shouldmodesetsquads()) {
        initsquaddata();
    }
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc
// Size: 0x73
function initsquaddata() {
    level.squaddata = [];
    foreach (entry in level.teamnamelist) {
        level.squaddata[entry] = [];
    }
    /#
        level thread debugprintsquads();
    #/
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x376
// Size: 0x2f4
function setsquad(team, index) {
    if (!shouldmodesetsquads()) {
        return;
    }
    if (!isdefined(team) || team == "spectator" || team == "codcaster") {
        return;
    }
    if (getdvarint(@"hash_cca323e71a05db50", 0) != 0) {
        teamindex = 0;
        foreach (index, name in level.teamnamelist) {
            if (name == team) {
                teamindex = index;
                break;
            }
        }
        joinsquad(team, teamindex);
        return;
    }
    if (isbot(self) && isdefined(self.var_b5517a8d74ed63a3)) {
        var_69c5807191f92fbb = self.var_b5517a8d74ed63a3 != -1;
    } else {
        var_69c5807191f92fbb = self.var_ff97225579de16a != -1;
    }
    if (istrue(level.matchmakingmatch) && var_69c5807191f92fbb && getdvarint(@"hash_6595c001520e3eec", 0) != 1) {
        if (!isdefined(index)) {
            if (isbot(self) && isdefined(self.var_b5517a8d74ed63a3)) {
                index = self.var_b5517a8d74ed63a3;
            } else {
                index = self.var_ff97225579de16a;
            }
        }
        self.squadassignedfromlobby = 1;
        joinsquad(team, index);
        return;
    }
    if (istrue(level.matchmakingmatch) && getdvarint(@"hash_3f2e64cb0f312641", 0) != 1) {
        var_6980251e86d0a47 = self getfireteammembers();
        if (isdefined(var_6980251e86d0a47) && var_6980251e86d0a47.size > 0) {
            squadindex = undefined;
            foreach (member in var_6980251e86d0a47) {
                if (isdefined(member) && member.var_ff97225579de16a != -1) {
                    squadindex = member.var_ff97225579de16a;
                    break;
                }
            }
            if (isdefined(squadindex)) {
                joinsquad(team, squadindex);
                return;
            } else {
                requestnewsquad(team, 1);
                return;
            }
        }
    }
    foreach (squad in level.squaddata[team]) {
        isfull = squad.players.size == level.maxsquadsize;
        if (!squad.isfireteam && !isfull) {
            joinsquad(team, squad.index);
            return;
        }
    }
    requestnewsquad(team, 0);
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x671
// Size: 0xe5
function createsquad(team, index) {
    if (!isdefined(level.var_9674461d63be1fd9)) {
        level.var_9674461d63be1fd9 = 0;
    }
    if (!isdefined(index)) {
        index = level.var_9674461d63be1fd9;
    }
    data = spawnstruct();
    data.index = index;
    data.team = team;
    data.isfireteam = 0;
    data.players = [];
    data.squadleader = undefined;
    data.var_21c2f79e8bfa9162 = undefined;
    data.properties = [];
    if (!isdefined(level.squaddata[team])) {
        level.squaddata[team] = [];
    }
    level.squaddata[team][index] = data;
    level.var_9674461d63be1fd9++;
    callback::callback("squad_created", data);
    return index;
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75e
// Size: 0x21
function freesquadindex(team, index) {
    level.squaddata[team][index] = undefined;
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x786
// Size: 0x52
function requestnewsquad(team, isfireteam) {
    index = createsquad(team);
    data = level.squaddata[team][index];
    data.infil = undefined;
    joinsquad(team, index);
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7df
// Size: 0x14e
function joinsquad(team, index) {
    if (!isdefined(level.squaddata[team][index])) {
        createsquad(team, index);
    }
    self.var_ff97225579de16a = index;
    self.var_3f78c6a0862f9e25 = function_eec90fb96d0aff02(team, index);
    if (!isdefined(level.squaddata[team][index].players)) {
        level.squaddata[team][index].players = [];
    }
    level.squaddata[team][index].players[level.squaddata[team][index].players.size] = self;
    choosesquadleader(team, index);
    if (getdvarint(@"hash_e1cce0c7778e6dd3", 0)) {
        logstring("[SQUAD DEBUG] Player joined squad. Player: " + self.name + ", Session Squad ID: " + self.var_ff97225579de16a + ", Session UI Member Index: " + self.var_3f78c6a0862f9e25);
    }
    namespace_c31609f90efcf2ca::onplayerjoinsquad(self);
    callback::callback(#"hash_cc06eb1d45f33a0c", {memberindex:self.var_3f78c6a0862f9e25, index:self.var_ff97225579de16a, team:team});
    self notify("joined_squad");
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x934
// Size: 0x306
function leavesquad(team, index) {
    if (!shouldmodesetsquads()) {
        return;
    }
    if (!isdefined(team) || team == "spectator" || team == "codcaster" || !isdefined(index) || !isdefined(level.squaddata)) {
        return;
    }
    /#
        assertex(isdefined(level.squaddata[team][index]), "Squad data for player is undefined");
    #/
    if (!isdefined(level.squaddata[team][index])) {
        return;
    }
    if (level.squaddata[team][index].players.size == 1) {
        freesquadindex(team, index);
        callback::callback(#"hash_cef9136f9b434dc1", {memberindex:self.var_3f78c6a0862f9e25, index:index, team:team});
        return;
    }
    if (getdvarint(@"hash_e1cce0c7778e6dd3", 0)) {
        logstring("[SQUAD DEBUG] PLayer leaving squad. Player: " + self.name + ", Session Squad ID: " + index + ", Session UI Member Index: " + self.var_3f78c6a0862f9e25);
    }
    self.var_71afb85ec1cc06f8 = self.var_3f78c6a0862f9e25;
    self.var_3f78c6a0862f9e25 = -1;
    var_aa17b95935a5047f = 0;
    squadleader = getsquadleader(team, index);
    if (istrue(level.usesquadleader) && isdefined(squadleader) && squadleader == self) {
        level.squaddata[team][index].squadleader = undefined;
        var_aa17b95935a5047f = 1;
        foreach (player in level.squaddata[team][index].players) {
            player setclientomnvar("ui_squad_leader", undefined);
        }
    }
    namespace_c31609f90efcf2ca::function_2a1e4811621fdcde(self);
    callback::callback(#"hash_cef9136f9b434dc1", {memberindex:self.var_71afb85ec1cc06f8, index:index, team:team});
    level.squaddata[team][index].players = array_remove(level.squaddata[team][index].players, self);
    if (istrue(var_aa17b95935a5047f)) {
        squadmembers = array_randomize(level.squaddata[team][index].players);
        foreach (player in squadmembers) {
            if (isdefined(player)) {
                player choosesquadleader(team, index);
                break;
            }
        }
    }
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc41
// Size: 0x5f
function function_9be60342a8babba5() {
    if (issharedfuncdefined("teamAssim", "isEnabled") && [[ getsharedfunc("teamAssim", "isEnabled") ]]()) {
        if (issharedfuncdefined("teamAssim", "getMaxAssimilationTeamSize")) {
            return [[ getsharedfunc("teamAssim", "getMaxAssimilationTeamSize") ]]();
        }
    } else {
        return level.maxsquadsize;
    }
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca7
// Size: 0x122
function function_eec90fb96d0aff02(team, index) {
    var_29370c978f7d04b9 = [];
    for (i = 0; i < function_9be60342a8babba5(); i++) {
        var_29370c978f7d04b9[i] = 1;
    }
    foreach (player in level.squaddata[team][index].players) {
        if (isdefined(player.var_3f78c6a0862f9e25) && player.var_3f78c6a0862f9e25 >= 0) {
            var_29370c978f7d04b9[player.var_3f78c6a0862f9e25] = 0;
        }
    }
    foreach (index, var_2b11fcb306aa898c in var_29370c978f7d04b9) {
        if (var_2b11fcb306aa898c) {
            return index;
        }
    }
    /#
        assertmsg("getAvailableSquadMemberIndex() unable to find available index!");
    #/
    return undefined;
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd1
// Size: 0x53
function function_8a9305612b73a15(team, oldteam, index) {
    if (isdefined(self.var_ff97225579de16a) && self.var_ff97225579de16a == index) {
        return;
    }
    leavesquad(oldteam, self.var_ff97225579de16a);
    joinsquad(team, index);
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2b
// Size: 0x2e5
function updatesquadomnvars(team, squadindex) {
    if (!shouldmodesetsquads() || !isdefined(level.squaddata)) {
        return;
    }
    squadleader = getsquadleader(team, squadindex);
    foreach (player in level.squaddata[team][squadindex].players) {
        var_4f87bc92d01fa479 = squadindex;
        var_4f87bc92d01fa479 = var_4f87bc92d01fa479 + (level.squaddata[team][squadindex].players.size << 5);
        if (isdefined(squadleader) && squadleader == player) {
            var_4f87bc92d01fa479 = var_4f87bc92d01fa479 + 256;
        }
        if (istrue(level.var_4e353dc2c64b19b1)) {
            continue;
        }
        player setclientomnvar("ui_squad_data", var_4f87bc92d01fa479);
        if (isdefined(level.gametype) && (level.gametype == "arm" || level.gametype == "conflict" || level.gametype == "risk" || level.gametype == "arena" || level.gametype == "brtdm" || level.gametype == "brtdm_mgl")) {
            var_69fe4a18f948739c = player.game_extrainfo & 65528;
            player.game_extrainfo = var_69fe4a18f948739c | player.var_3f78c6a0862f9e25 + 1;
            if (isdefined(squadleader) && squadleader == player) {
                player.game_extrainfo = player.game_extrainfo | 256;
            } else {
                player.game_extrainfo = player.game_extrainfo & ~256;
            }
            var_f31235f8d2bec0f0 = player getentitynumber();
            if (isdefined(squadleader) && squadleader == player) {
                var_f31235f8d2bec0f0 = var_f31235f8d2bec0f0 + 2048;
            }
            if (isalive(player)) {
                var_f31235f8d2bec0f0 = var_f31235f8d2bec0f0 + 4096;
            }
            player setclientomnvar("ui_arm_squadmember_0", var_f31235f8d2bec0f0);
            var_aaa863033d6d0dcd = array_remove(level.squaddata[team][squadindex].players, player);
            for (i = 0; i < 3; i++) {
                var_c98aac0e8e6eaf8c = var_aaa863033d6d0dcd[i];
                if (isdefined(var_c98aac0e8e6eaf8c)) {
                    var_f31235f8d2bec0f0 = var_c98aac0e8e6eaf8c getentitynumber();
                    if (isdefined(squadleader) && squadleader == var_c98aac0e8e6eaf8c) {
                        var_f31235f8d2bec0f0 = var_f31235f8d2bec0f0 + 2048;
                    }
                    if (isalive(var_c98aac0e8e6eaf8c)) {
                        var_f31235f8d2bec0f0 = var_f31235f8d2bec0f0 + 4096;
                    }
                } else {
                    var_f31235f8d2bec0f0 = -1;
                }
                player setclientomnvar("ui_arm_squadmember_" + i + 1, var_f31235f8d2bec0f0);
            }
        }
    }
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1117
// Size: 0x13
function function_3d93807e453d0770() {
    return namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73() || namespace_36f464722d326bbe::function_6910a4c65560c44b();
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1132
// Size: 0x1bf
function choosesquadleader(team, index) {
    if (!istrue(level.usesquadleader)) {
        return;
    }
    var_ddb8d98c593d15de = 0;
    if (istrue(level.matchmakingmatch)) {
        var_6980251e86d0a47 = self getfireteammembers();
        if (isdefined(var_6980251e86d0a47) && var_6980251e86d0a47.size > 0) {
            var_ddb8d98c593d15de = self isfireteamleader();
        }
    }
    var_8f7c03ec5f22fe86 = self;
    if (!var_ddb8d98c593d15de) {
        var_cc0bb577353a4c93 = getsquadleader(team, index);
        if (function_3d93807e453d0770()) {
            if (isdefined(var_cc0bb577353a4c93) && !isai(var_cc0bb577353a4c93)) {
                return;
            }
            if (isai(var_8f7c03ec5f22fe86)) {
                var_beb6c9f3d61cf4e1 = 0;
                foreach (player in level.squaddata[team][index].players) {
                    if (!isai(player)) {
                        var_8f7c03ec5f22fe86 = player;
                        var_beb6c9f3d61cf4e1 = 1;
                        break;
                    }
                }
                if (!var_beb6c9f3d61cf4e1 && isdefined(var_cc0bb577353a4c93)) {
                    return;
                }
            }
        } else if (isdefined(var_cc0bb577353a4c93)) {
            return;
        }
    }
    level.squaddata[team][index].squadleader = var_8f7c03ec5f22fe86;
    foreach (player in level.squaddata[team][index].players) {
        player setclientomnvar("ui_squad_leader", var_8f7c03ec5f22fe86);
    }
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12f8
// Size: 0x24d
function debugprintsquads() {
    /#
        var_63f43f469b885ec6 = 25;
        while (1) {
            if (getdvarint(@"hash_eb9b72744c4518d8", 0) == 1 && isdefined(level.squaddata)) {
                startx = 800;
                starty = 25;
                linecount = 1;
                printtoscreen2d(startx, starty, "<unknown string>", (1, 1, 1), 1);
                foreach (team, var_70643c8580524236 in level.squaddata) {
                    linecount = 1;
                    printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "<unknown string>" + team, (1, 1, 1), 1);
                    linecount++;
                    foreach (squad in var_70643c8580524236) {
                        color = (1, 1, 1);
                        if (isdefined(squad.activemission)) {
                            color = (1, 1, 0);
                        }
                        printtoscreen2d(startx + 25, starty + var_63f43f469b885ec6 * linecount, "<unknown string>" + squad.index, color, 1);
                        linecount++;
                        foreach (player in squad.players) {
                            color = (1, 1, 1);
                            if (istrue(player.squadassignedfromlobby)) {
                                color = (0, 1, 0);
                            }
                            printtoscreen2d(startx + 50, starty + var_63f43f469b885ec6 * linecount, player.name, color, 1);
                            linecount++;
                        }
                    }
                    startx = startx + 200;
                }
            }
            waitframe();
        }
    #/
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154c
// Size: 0xe1
function function_2026e82470c5c89f(team, var_ff97225579de16a, property) {
    /#
        assertex(isdefined(level.squaddata[team][var_ff97225579de16a]), "UNDEFINED level.squadData[" + team + "][" + var_ff97225579de16a + "]");
    #/
    /#
        assertex(function_be6ce63a202791c5(team, var_ff97225579de16a, property), "UNDEFINED level.squadData[" + team + "][" + var_ff97225579de16a + "][" + property + "]");
    #/
    if (isdefined(level.squaddata[team][var_ff97225579de16a]) && isdefined(level.squaddata[team][var_ff97225579de16a].properties) && isdefined(level.squaddata[team][var_ff97225579de16a].properties[property])) {
        return level.squaddata[team][var_ff97225579de16a].properties[property];
    } else {
        return undefined;
    }
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1634
// Size: 0xaa
function function_a20a10ce593f692b(team, var_ff97225579de16a, property, value) {
    /#
        assertex(isdefined(level.squaddata[team][var_ff97225579de16a]), "UNDEFINED level.squadData[" + team + "][" + var_ff97225579de16a + "]");
    #/
    /#
        assertex(function_be6ce63a202791c5(team, var_ff97225579de16a, property), "UNDEFINED level.squadData[" + team + "][" + var_ff97225579de16a + "][" + property + "]");
    #/
    /#
        assertex(isdefined(value), "setSquadData() undefined value");
    #/
    level.squaddata[team][var_ff97225579de16a].properties[property] = value;
}

// Namespace squads/namespace_9bb409deb69fb31d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e5
// Size: 0x7f
function function_be6ce63a202791c5(team, var_ff97225579de16a, property) {
    /#
        assertex(isdefined(level.squaddata[team][var_ff97225579de16a]), "UNDEFINED level.squadData[" + team + "][" + var_ff97225579de16a + "]");
    #/
    if (!isdefined(level.squaddata[team][var_ff97225579de16a].properties)) {
        return 0;
    }
    return isdefined(level.squaddata[team][var_ff97225579de16a].properties[property]);
}

