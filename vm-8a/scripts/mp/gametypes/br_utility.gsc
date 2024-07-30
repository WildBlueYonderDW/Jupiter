#using scripts\engine\utility.gsc;
#using scripts\mp\teams.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_72af5a878a9d3397;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_40e63dd222434655;
#using scripts\mp\gametypes\br_utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_3ff084f114b7f6c9;

#namespace br_utility;

// Namespace br_utility / scripts\mp\gametypes\br_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b8
// Size: 0x104
function function_1b5da10393c9c50e(var_3c0c203df6f6b6c5) {
    player = self;
    level endon("game_ended");
    level endon("all_players_dead");
    player endon("squad_wiped");
    player endon("br_player_revived");
    player endon("disconnect");
    player notify("rankedQuitTimer_started");
    player endon("rankedQuitTimer_started");
    if (scripts\mp\teams::getactiveteamcount() > 1) {
        remainingtime = ter_op(istrue(var_3c0c203df6f6b6c5), 3000, 180000);
        var_b87edaf5a7d50525 = istrue(var_3c0c203df6f6b6c5);
        timestart = gettime();
        timeend = timestart + remainingtime;
        while (remainingtime > 0) {
            player setclientomnvar("ui_league_play_br_leave_penalty_timer", remainingtime);
            remainingtime = timeend - gettime();
            if (!istrue(var_b87edaf5a7d50525) && scripts\mp\gametypes\br::function_f8167aab51948bf0(player.team)) {
                var_b87edaf5a7d50525 = 1;
                timeend = min(timeend, timestart + 3000);
            }
            wait 1;
        }
    }
    player setclientomnvar("ui_league_play_br_leave_penalty_timer", 0);
    player setclientomnvar("ui_league_play_br_can_leave_with_party", istrue(var_3c0c203df6f6b6c5));
}

// Namespace br_utility / scripts\mp\gametypes\br_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c4
// Size: 0x5
function function_b5b049c4b47cf929() {
    return 3000;
}

// Namespace br_utility / scripts\mp\gametypes\br_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d2
// Size: 0xde
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
        player thread function_1b5da10393c9c50e(scripts\mp\gametypes\br::function_f8167aab51948bf0(player.team));
    }
    namespace_92443376a63aa4bd::onMarkPlayerAsEliminated(player, 1);
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onMarkPlayerAsEliminated", player);
    if (scripts\cp_mp\utility\game_utility::function_6910a4c65560c44b() && isai(player)) {
        player thread namespace_bc2665cbe6cf4e1f::function_f6e88d354cb8d3cd();
    }
    player scripts\mp\gametypes\br_utility::updateplayereliminatedomnvar(context);
    player scripts\mp\gamelogic::updateplayerleaderboardstats();
}

// Namespace br_utility / scripts\mp\gametypes\br_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b8
// Size: 0x88
function unmarkplayeraseliminated(player, context) {
    player function_b6371a65209a055f(0, context);
    player.br_iseliminated = 0;
    player.var_14110ad8d5069e7 = -1;
    namespace_92443376a63aa4bd::onMarkPlayerAsEliminated(player, 0);
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onUnmarkPlayerAsEliminated", player);
    player scripts\mp\utility\lower_message::setlowermessageomnvar("clear_lower_msg");
    player notify("br_player_revived");
    player setclientomnvar("ui_leagueplay_allow_quit", 3);
    player setclientomnvar("ui_league_play_br_leave_penalty_timer", -1);
    player updateplayereliminatedomnvar(context);
}

// Namespace br_utility / scripts\mp\gametypes\br_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x648
// Size: 0x4cc
function updateplayereliminatedomnvar(context) {
    player = self;
    packedvalue = 0;
    var_95bfd92292381a4c = 0;
    if (scripts\mp\utility\game::getsubgametype() == "rumble_mgl") {
        teammates = scripts\mp\utility\teams::getsquadmates(player.team, player.sessionsquadid, 0);
        var_bf873008edc8415f = level.maxsquadsize;
    } else {
        teammates = scripts\mp\utility\teams::getteamdata(player.team, "players");
        if (namespace_76a219af07c28c13::function_6934349b7823d888()) {
            var_bf873008edc8415f = namespace_76a219af07c28c13::getMaxAssimilationTeamSize();
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
        assert(member.var_3f78c6a0862f9e25 <= var_bf873008edc8415f);
        if (istrue(member.br_iseliminated)) {
            packedvalue |= 1 << member.var_3f78c6a0862f9e25;
        }
        if (istrue(member.extracted)) {
            var_95bfd92292381a4c |= 1 << member.var_3f78c6a0862f9e25;
        }
    }
    foreach (member in teammates) {
        member setclientomnvar("ui_br_eliminated", packedvalue);
        member setclientomnvar("ui_br_extracted", var_95bfd92292381a4c);
    }
    validgametype = !(isdefined(level.brgametype) && (istrue(level.brgametype.var_b43745b85f249e68) || level.brgametype.name == "resurgence")) && level.gametype != "ob" && level.gametype != "ob_rift_run";
    if (istrue(level.matchmakingmatch) && validgametype) {
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
            return;
        }
        fireteammembers = player getfireteammembers();
        if (isdefined(fireteammembers) && fireteammembers.size > 0) {
            var_5c9ddcf56d36f133 = 2;
            foreach (member in fireteammembers) {
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
            foreach (member in fireteammembers) {
                member setclientomnvar("ui_br_squad_eliminated_active", var_5c9ddcf56d36f133);
            }
        }
    }
}

// Namespace br_utility / scripts\mp\gametypes\br_utility
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1c
// Size: 0x19e
function function_8311407ea8b66f9a(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    if (getdvarint(@"hash_11fa4c3ab4c1653d", 1) && !scripts\mp\gametypes\br_gametypes::isfeaturedisabled("oneLife")) {
        victimnum = "e?";
        meansofdeath = "m?";
        attackernum = "a?";
        inflictornum = "i?";
        attackerloc = "l?";
        if (isdefined(self)) {
            victimnum = self getentitynumber();
        }
        if (isdefined(smeansofdeath)) {
            meansofdeath = smeansofdeath;
        }
        if (isdefined(attacker) && !isstruct(attacker)) {
            attackernum = attacker getentitynumber();
            attackerloc = "( " + attacker.origin[0] + "," + attacker.origin[1] + "," + attacker.origin[2] + " )";
        }
        if (isdefined(einflictor)) {
            inflictornum = einflictor getentitynumber();
        }
        stringref = "*-- Kill: " + gettime() + ", ";
        stringref += victimnum + ", ";
        stringref += meansofdeath + ", ";
        stringref += attackernum + ", ";
        stringref += inflictornum + ", ";
        stringref += attackerloc;
        logstring(stringref);
    }
}

// Namespace br_utility / scripts\mp\gametypes\br_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc2
// Size: 0x94
function function_b6371a65209a055f(waseliminated, context) {
    if (getdvarint(@"hash_11fa4c3ab4c1653d", 1) && !scripts\mp\gametypes\br_gametypes::isfeaturedisabled("oneLife")) {
        stringref = ter_op(istrue(waseliminated), "*-- Mark: ", "*-- Unmark: ") + gettime() + ", ";
        stringref += ter_op(isdefined(self), self getentitynumber(), "?") + ", ";
        stringref += ter_op(isdefined(context), context, "?");
        logstring(stringref);
    }
}

// Namespace br_utility / scripts\mp\gametypes\br_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5e
// Size: 0xa4
function function_b5483af58ee9f2c3(var_ad8aec47e1a86534, team, context) {
    if (getdvarint(@"hash_11fa4c3ab4c1653d", 1) && !scripts\mp\gametypes\br_gametypes::isfeaturedisabled("oneLife")) {
        stringref = ter_op(istrue(var_ad8aec47e1a86534), "*-- Add: ", "*-- Remove: ") + gettime() + ", ";
        stringref += ter_op(isdefined(self), self getentitynumber(), "?") + ", " + team + ", ";
        stringref += ter_op(isdefined(context), context, "none");
        logstring(stringref);
    }
}

// Namespace br_utility / scripts\mp\gametypes\br_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0a
// Size: 0x52
function printteameliminated(team) {
    if (getdvarint(@"hash_11fa4c3ab4c1653d", 1) && !scripts\mp\gametypes\br_gametypes::isfeaturedisabled("oneLife")) {
        stringref = "*-- Team Elim: " + gettime() + ", " + team;
        logstring(stringref);
    }
}

// Namespace br_utility / scripts\mp\gametypes\br_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe64
// Size: 0xad
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

// Namespace br_utility / scripts\mp\gametypes\br_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1a
// Size: 0x22
function function_fd357ca89e5e29d9() {
    if (self function_9cc921a57ff4deb5()) {
        self function_61195b9ee307ad14();
        self notify("ascender_cancel");
        self notify("ascender_solo_cancel");
    }
}

