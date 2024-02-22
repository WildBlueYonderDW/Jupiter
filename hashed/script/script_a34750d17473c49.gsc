// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\teams.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_72af5a878a9d3397;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_40e63dd222434655;
#using script_a34750d17473c49;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_3ff084f114b7f6c9;

#namespace namespace_27fb975441f54a5e;

// Namespace namespace_27fb975441f54a5e/namespace_80cec6cfc70c4f95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b8
// Size: 0x105
function function_1b5da10393c9c50e(var_3c0c203df6f6b6c5) {
    player = self;
    level endon("game_ended");
    level endon("all_players_dead");
    player endon("squad_wiped");
    player endon("br_player_revived");
    player endon("disconnect");
    player notify("rankedQuitTimer_started");
    player endon("rankedQuitTimer_started");
    if (namespace_6d8da2b47f878104::getactiveteamcount() > 1) {
        remainingtime = ter_op(istrue(var_3c0c203df6f6b6c5), 3000, 180000);
        var_b87edaf5a7d50525 = istrue(var_3c0c203df6f6b6c5);
        timestart = gettime();
        var_b47523a062a4238d = timestart + remainingtime;
        while (remainingtime > 0) {
            player setclientomnvar("ui_league_play_br_leave_penalty_timer", remainingtime);
            remainingtime = var_b47523a062a4238d - gettime();
            if (!istrue(var_b87edaf5a7d50525) && namespace_d20f8ef223912e12::function_f8167aab51948bf0(player.team)) {
                var_b87edaf5a7d50525 = 1;
                var_b47523a062a4238d = min(var_b47523a062a4238d, timestart + 3000);
            }
            wait(1);
        }
    }
    player setclientomnvar("ui_league_play_br_leave_penalty_timer", 0);
    player setclientomnvar("ui_league_play_br_can_leave_with_party", istrue(var_3c0c203df6f6b6c5));
}

// Namespace namespace_27fb975441f54a5e/namespace_80cec6cfc70c4f95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c4
// Size: 0x6
function function_b5b049c4b47cf929() {
    return 3000;
}

// Namespace namespace_27fb975441f54a5e/namespace_80cec6cfc70c4f95
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d2
// Size: 0xdf
function markplayeraseliminated(player, context) {
    if (istrue(player.br_iseliminated)) {
        return;
    }
    player function_b6371a65209a055f(1, context);
    player.br_iseliminated = 1;
    player.var_14110ad8d5069e7 = gettime();
    level notify("br_player_eliminated");
    if (istrue(level.var_77907d733abe8b63)) {
        player setclientomnvar("ui_leagueplay_allow_quit", 0);
        player setclientomnvar("ui_league_play_br_leave_penalty_timer", 180000);
        player thread function_1b5da10393c9c50e(namespace_d20f8ef223912e12::function_f8167aab51948bf0(player.team));
    }
    namespace_92443376a63aa4bd::onmarkplayeraseliminated(player, 1);
    namespace_71073fa38f11492::runbrgametypefunc("onMarkPlayerAsEliminated", player);
    if (namespace_36f464722d326bbe::function_6910a4c65560c44b() && isai(player)) {
        player thread namespace_bc2665cbe6cf4e1f::function_f6e88d354cb8d3cd();
    }
    player namespace_80cec6cfc70c4f95::updateplayereliminatedomnvar(context);
    player namespace_d576b6dc7cef9c62::updateplayerleaderboardstats();
}

// Namespace namespace_27fb975441f54a5e/namespace_80cec6cfc70c4f95
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b8
// Size: 0x89
function unmarkplayeraseliminated(player, context) {
    player function_b6371a65209a055f(0, context);
    player.br_iseliminated = 0;
    player.var_14110ad8d5069e7 = -1;
    namespace_92443376a63aa4bd::onmarkplayeraseliminated(player, 0);
    namespace_71073fa38f11492::runbrgametypefunc("onUnmarkPlayerAsEliminated", player);
    player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    player notify("br_player_revived");
    player setclientomnvar("ui_leagueplay_allow_quit", 3);
    player setclientomnvar("ui_league_play_br_leave_penalty_timer", -1);
    player updateplayereliminatedomnvar(context);
}

// Namespace namespace_27fb975441f54a5e/namespace_80cec6cfc70c4f95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x648
// Size: 0x4cd
function updateplayereliminatedomnvar(context) {
    player = self;
    var_81dab8953b9df82 = 0;
    var_95bfd92292381a4c = 0;
    if (namespace_cd0b2d039510b38d::getsubgametype() == "rumble_mgl") {
        teammates = namespace_54d20dd0dd79277f::getsquadmates(player.team, player.var_ff97225579de16a, 0);
        var_bf873008edc8415f = level.maxsquadsize;
    } else {
        teammates = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
        if (namespace_76a219af07c28c13::function_6934349b7823d888()) {
            var_bf873008edc8415f = namespace_76a219af07c28c13::getmaxassimilationteamsize();
        } else {
            var_bf873008edc8415f = level.maxteamsize;
        }
    }
    foreach (member in teammates) {
        if (getdvarint(@"hash_f817c06d779ec53c", 0)) {
            if (!isdefined(context)) {
                context = "?";
            }
            logstring("updatePlayerEliminatedOmnvar - time = " + gettime() + ", player = " + member.name + ", team = " + member.team + ", marked player = " + (member == self) + ", br_isEliminated = " + istrue(member.br_iseliminated) + ", context = " + context + ", sessionuimemberindex = " + member.var_3f78c6a0862f9e25);
        }
        /#
            assert(member.var_3f78c6a0862f9e25 <= var_bf873008edc8415f);
        #/
        if (istrue(member.br_iseliminated)) {
            var_81dab8953b9df82 = var_81dab8953b9df82 | 1 << member.var_3f78c6a0862f9e25;
        }
        if (istrue(member.extracted)) {
            var_95bfd92292381a4c = var_95bfd92292381a4c | 1 << member.var_3f78c6a0862f9e25;
        }
    }
    foreach (member in teammates) {
        member setclientomnvar("ui_br_eliminated", var_81dab8953b9df82);
        member setclientomnvar("ui_br_extracted", var_95bfd92292381a4c);
    }
    var_ffaea84c6deb757 = !(isdefined(level.brgametype) && (istrue(level.brgametype.var_b43745b85f249e68) || level.brgametype.name == "resurgence")) && level.gametype != "ob" && level.gametype != "ob_rift_run";
    if (istrue(level.matchmakingmatch) && var_ffaea84c6deb757) {
        if (getdvarint(@"hash_4c7f9021e6dc110d", 1) == 1) {
            if (isdefined(teammates) && teammates.size > 0) {
                var_5c9ddcf56d36f133 = 2;
                foreach (member in teammates) {
                    if (isdefined(member) && !istrue(member.br_iseliminated)) {
                        var_5c9ddcf56d36f133 = 0;
                        break;
                    }
                }
                foreach (member in teammates) {
                    if (istrue(member.extracted)) {
                        continue;
                    }
                    member setclientomnvar("ui_br_squad_eliminated_active", var_5c9ddcf56d36f133);
                }
            }
        } else {
            var_6980251e86d0a47 = player getfireteammembers();
            if (isdefined(var_6980251e86d0a47) && var_6980251e86d0a47.size > 0) {
                var_5c9ddcf56d36f133 = 2;
                foreach (member in var_6980251e86d0a47) {
                    if (isdefined(member) && !istrue(member.br_iseliminated)) {
                        var_5c9ddcf56d36f133 = 0;
                        break;
                    }
                }
                if (getdvarint(@"hash_f817c06d779ec53c", 0) && var_5c9ddcf56d36f133 > 0) {
                    if (!isdefined(context)) {
                        context = "?";
                    }
                    logstring("updatePlayerEliminatedOmnvar - time = " + gettime() + ", context = " + context + ", set ui_br_squad_eliminated_active to " + var_5c9ddcf56d36f133);
                }
                player setclientomnvar("ui_br_squad_eliminated_active", var_5c9ddcf56d36f133);
                foreach (member in var_6980251e86d0a47) {
                    member setclientomnvar("ui_br_squad_eliminated_active", var_5c9ddcf56d36f133);
                }
            }
        }
    }
}

// Namespace namespace_27fb975441f54a5e/namespace_80cec6cfc70c4f95
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1c
// Size: 0x19f
function function_8311407ea8b66f9a(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (getdvarint(@"hash_11fa4c3ab4c1653d", 1) && !namespace_71073fa38f11492::isfeaturedisabled("oneLife")) {
        var_f300f1fcf10a85c7 = "e?";
        meansofdeath = "m?";
        attackernum = "a?";
        var_80a3ea58558d7d27 = "i?";
        var_4ec83c6262d70534 = "l?";
        if (isdefined(self)) {
            var_f300f1fcf10a85c7 = self getentitynumber();
        }
        if (isdefined(smeansofdeath)) {
            meansofdeath = smeansofdeath;
        }
        if (isdefined(attacker) && !isstruct(attacker)) {
            attackernum = attacker getentitynumber();
            var_4ec83c6262d70534 = "( " + attacker.origin[0] + "," + attacker.origin[1] + "," + attacker.origin[2] + " )";
        }
        if (isdefined(einflictor)) {
            var_80a3ea58558d7d27 = einflictor getentitynumber();
        }
        stringref = "*-- Kill: " + gettime() + ", ";
        stringref = stringref + var_f300f1fcf10a85c7 + ", ";
        stringref = stringref + meansofdeath + ", ";
        stringref = stringref + attackernum + ", ";
        stringref = stringref + var_80a3ea58558d7d27 + ", ";
        stringref = stringref + var_4ec83c6262d70534;
        logstring(stringref);
    }
}

// Namespace namespace_27fb975441f54a5e/namespace_80cec6cfc70c4f95
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc2
// Size: 0x95
function function_b6371a65209a055f(var_d740dbb6749f0c7a, context) {
    if (getdvarint(@"hash_11fa4c3ab4c1653d", 1) && !namespace_71073fa38f11492::isfeaturedisabled("oneLife")) {
        stringref = ter_op(istrue(var_d740dbb6749f0c7a), "*-- Mark: ", "*-- Unmark: ") + gettime() + ", ";
        stringref = stringref + ter_op(isdefined(self), self getentitynumber(), "?") + ", ";
        stringref = stringref + ter_op(isdefined(context), context, "?");
        logstring(stringref);
    }
}

// Namespace namespace_27fb975441f54a5e/namespace_80cec6cfc70c4f95
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5e
// Size: 0xa5
function function_b5483af58ee9f2c3(var_ad8aec47e1a86534, team, context) {
    if (getdvarint(@"hash_11fa4c3ab4c1653d", 1) && !namespace_71073fa38f11492::isfeaturedisabled("oneLife")) {
        stringref = ter_op(istrue(var_ad8aec47e1a86534), "*-- Add: ", "*-- Remove: ") + gettime() + ", ";
        stringref = stringref + ter_op(isdefined(self), self getentitynumber(), "?") + ", " + team + ", ";
        stringref = stringref + ter_op(isdefined(context), context, "none");
        logstring(stringref);
    }
}

// Namespace namespace_27fb975441f54a5e/namespace_80cec6cfc70c4f95
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0a
// Size: 0x53
function function_def20f6aa082fcf5(team) {
    if (getdvarint(@"hash_11fa4c3ab4c1653d", 1) && !namespace_71073fa38f11492::isfeaturedisabled("oneLife")) {
        stringref = "*-- Team Elim: " + gettime() + ", " + team;
        logstring(stringref);
    }
}

// Namespace namespace_27fb975441f54a5e/namespace_80cec6cfc70c4f95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe64
// Size: 0xae
function function_22a0e95dd4174c81() {
    index = 0;
    var_54b25677aaa042bd = [];
    foreach (player in level.players) {
        if (!isdefined(player.team) || player.team == "spectator" || player.team == "codcaster") {
            continue;
        }
        var_54b25677aaa042bd[index] = player;
        index++;
    }
    return var_54b25677aaa042bd;
}

// Namespace namespace_27fb975441f54a5e/namespace_80cec6cfc70c4f95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1a
// Size: 0x23
function function_fd357ca89e5e29d9() {
    if (self function_9cc921a57ff4deb5()) {
        self function_61195b9ee307ad14();
        self notify("ascender_cancel");
        self notify("ascender_solo_cancel");
    }
}

