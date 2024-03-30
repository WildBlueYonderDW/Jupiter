// mwiii decomp prototype
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\system.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using script_7b2517368c79e5bc;
#using script_749ff6f56673a813;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_41387eecc35b88bf;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\hud_message.gsc;
#using script_40b5006483288fd3;
#using script_62a4f7a62643fe8;
#using script_2583ee5680cf4736;

#namespace namespace_910f1c9e49a229ca;

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x7a0
// Size: 0x1a
function private autoexec __init__system__() {
    system::register(#"hash_23b157aee842e25e", undefined, undefined, &function_144097189064ffad);
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c1
// Size: 0x19e
function function_144097189064ffad() {
    if (getdvarint(@"hash_95e91827f8d9304a", 0) != 1) {
        return;
    }
    level.var_319c5fcabbf91284 = 1;
    level.var_b66406c81d84e91f = [];
    level.var_867a2a58a53c66f2 = &function_777650b23d69e74e;
    level.var_8d0eb92efe17b1c0 = getdvarint(@"hash_c1fac26e33ca48af", 1);
    level.var_10eebe39d476816e = getdvarint(@"hash_dfce5fa223df2cad", 5);
    level.var_6583f8d86afcc61a = getdvarint(@"hash_27fe27abbde8fd64", 1);
    level.var_ad34cf1255372b35 = getdvarint(@"hash_a11d5d6a27c6be24", 1);
    level.var_84e6692f7dce674a = getdvarint(@"hash_53e0ee5a932df698", 1);
    level.var_91b26b191aee211d = getdvarint(@"hash_733cb0dc88e4bdec", 1);
    level.var_135fcaa8f9802c71 = getdvarint(@"hash_736b8ddd707b3d8e", 1);
    level.var_f638d0429eb0ffd6 = getdvarint(@"hash_d35ec6cf08b913ca", 3);
    if (istrue(level.var_91b26b191aee211d)) {
        level.var_fd15b9ad0f909a26 = &function_be25d212fb44b9a9;
    }
    scripts/mp/teamrevive::function_5343ecb486b66bf1("recon_points", &onspawnrevivetrigger);
    level thread function_2950b8b7b06664d7();
    level callback::add("on_ai_killed", &onAIKilled);
    level callback::add("on_ob_laststand_player_killed", &onplayerkilled);
    level callback::add("player_connect", &onplayerconnected);
    level callback::add("player_disconnect", &onplayerdisconnected);
    function_8b5b2a3392fc7e2a("ActivitySuccess", &function_e07daf5fb2a4ecd3);
    /#
        level thread initdebug();
    #/
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x966
// Size: 0x64
function private onplayerconnected(params) {
    playerid = self getentitynumber();
    level.var_b66406c81d84e91f[playerid] = clamp(level.var_8d0eb92efe17b1c0, 0, level.var_10eebe39d476816e);
    /#
        self.zombiedamagemultiplier = getdvarint(@"hash_59c18d87dd312e0b", 1);
    #/
    function_2f5cbe081bc2430();
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d1
// Size: 0x13
function private onplayerdisconnected(params) {
    function_2f5cbe081bc2430();
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9eb
// Size: 0x19
function private function_1516111d965f0f5(val) {
    self setclientomnvar("ui_securing", val);
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa0b
// Size: 0x19
function private function_be2a38379b60c50(val) {
    self setclientomnvar("ui_securing_progress", val);
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa2b
// Size: 0x20
function private function_79fec5974e6c9ddf() {
    if (level.var_135fcaa8f9802c71 > 0) {
        return "recon_points_respawn_enabled";
    }
    return "press_to_spawn";
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa52
// Size: 0x5c
function private onspawnrevivetrigger() {
    deadplayer = self.victim;
    if (isdefined(deadplayer) && istrue(deadplayer.var_f8e619cb980be7d3)) {
        logstring("[recon_points] OnSpawnReviveTrigger DisablePlayerUseForAllPlayers");
        level.revivetriggers[deadplayer.guid] setscriptablepartstate("cyber_revive_icon", "unusable");
    }
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab5
// Size: 0x258
function private playeruseholdthink() {
    self endon("disconnect");
    logstring("[recon_points] respawn thread begins !!! " + self.name + " sessionstate: " + self.sessionstate);
    while (self.sessionstate != "playing") {
        if (!self getbeingrevived()) {
            if (function_33a21b2ea282d115() < level.var_135fcaa8f9802c71) {
                if (!istrue(self.squadwiped)) {
                    scripts/mp/utility/lower_message::setlowermessageomnvar("recon_points_respawn_disabled");
                } else {
                    logstring("[recon_points] respawn squadWiped !!! " + self.sessionteam + " " + self.sessionsquadid + " " + self.name);
                    break;
                }
            } else {
                scripts/mp/utility/lower_message::setlowermessageomnvar(function_79fec5974e6c9ddf());
                if (self usebuttonpressed()) {
                    usedtime = 0;
                    waittimestep = 0.05;
                    self.var_f8e619cb980be7d3 = 1;
                    function_1516111d965f0f5(5);
                    if (isdefined(level.revivetriggers[self.guid])) {
                        level.revivetriggers[self.guid] setscriptablepartstate("cyber_revive_icon", "unusable");
                    }
                    while (self usebuttonpressed() && self.sessionstate != "playing" && usedtime < level.var_f638d0429eb0ffd6) {
                        function_be2a38379b60c50(usedtime / level.var_f638d0429eb0ffd6);
                        usedtime = usedtime + waittimestep;
                        wait(waittimestep);
                    }
                    self.var_f8e619cb980be7d3 = undefined;
                    function_1516111d965f0f5(0);
                    function_be2a38379b60c50(0);
                    if (usedtime >= level.var_f638d0429eb0ffd6) {
                        logstring("[recon_points] useTime  !!! " + usedtime);
                        break;
                    }
                    if (isdefined(level.revivetriggers[self.guid])) {
                        level.revivetriggers[self.guid] setscriptablepartstate("cyber_revive_icon", "usable");
                    }
                }
            }
        } else {
            scripts/mp/utility/lower_message::setlowermessageomnvar("clear_lower_msg");
        }
        wait(0.2);
    }
    logstring("[recon_points] respawn thread end !!! " + self.name + " sessionstate: " + self.sessionstate);
    scripts/mp/utility/lower_message::setlowermessageomnvar("clear_lower_msg");
    if (self.sessionstate != "playing") {
        function_777650b23d69e74e(#"hash_f448446b03528bac");
    }
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd14
// Size: 0x21
function private onplayerkilled(params) {
    if (istrue(level.var_91b26b191aee211d)) {
        thread playeruseholdthink();
    }
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd3c
// Size: 0xb4
function private function_e07daf5fb2a4ecd3(params) {
    activity = self;
    playerlist = params.playerlist;
    if (isdefined(playerlist) && isdefined(activity) && isdefined(activity.category) && activity.category == "Contract") {
        foreach (player in playerlist) {
            player thread function_777650b23d69e74e(#"contracts_completed");
        }
    }
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf7
// Size: 0x2e
function function_33a21b2ea282d115() {
    if (!istrue(level.var_319c5fcabbf91284)) {
        return 0;
    }
    playerid = self getentitynumber();
    return level.var_b66406c81d84e91f[playerid];
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe2d
// Size: 0x8b
function private function_df4b133a2c53cb24(var_751df20fceaee5, var_ae579781d2b3fea1, nextobjectiveid) {
    if (isdefined(self.var_64891db3f3c85d57) && self.var_64891db3f3c85d57 != -1) {
        if (is_equal(self.var_64891db3f3c85d57, var_ae579781d2b3fea1)) {
            scripts/cp_mp/calloutmarkerping::calloutmarkerping_removecallout(self.var_3c32c1f7963d00d);
            self.var_64891db3f3c85d57 = nextobjectiveid;
            self.var_3c32c1f7963d00d = scripts/cp_mp/calloutmarkerping::calloutmarkerping_createcallout(11, var_751df20fceaee5.origin, nextobjectiveid);
            thread function_54f1ae7e02711fc9();
        }
    }
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xebf
// Size: 0xa4
function private function_10972832881180ee(var_751df20fceaee5, showprimary) {
    if (istrue(showprimary)) {
        scripts/mp/objidpoolmanager::objective_playermask_addshowplayer(var_751df20fceaee5.objectiveidprimary, self);
        scripts/mp/objidpoolmanager::objective_playermask_hidefrom(var_751df20fceaee5.objectiveidsecondary, self);
        function_df4b133a2c53cb24(var_751df20fceaee5, var_751df20fceaee5.objectiveidsecondary, var_751df20fceaee5.objectiveidprimary);
        return;
    }
    scripts/mp/objidpoolmanager::objective_playermask_addshowplayer(var_751df20fceaee5.objectiveidsecondary, self);
    scripts/mp/objidpoolmanager::objective_playermask_hidefrom(var_751df20fceaee5.objectiveidprimary, self);
    function_df4b133a2c53cb24(var_751df20fceaee5, var_751df20fceaee5.objectiveidprimary, var_751df20fceaee5.objectiveidsecondary);
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf6a
// Size: 0xa9
function private function_4f67cc94e9d23825(var_751df20fceaee5) {
    if (!isdefined(var_751df20fceaee5) || !isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
        return;
    }
    if (!is_equal(var_751df20fceaee5.var_d182b8d3f3aaa93b.type, "cp_mp_recon_points_exfil_site_entityless")) {
        return;
    }
    if (isdefined(var_751df20fceaee5.var_985e82f034f67960)) {
        function_10972832881180ee(var_751df20fceaee5, is_equal(self.team, var_751df20fceaee5.var_985e82f034f67960.team));
        return;
    }
    scripts/mp/objidpoolmanager::objective_playermask_hidefromall(var_751df20fceaee5.objectiveidprimary);
    scripts/mp/objidpoolmanager::objective_playermask_hidefromall(var_751df20fceaee5.objectiveidsecondary);
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x101a
// Size: 0x6b
function private function_bc9f002d4decfa9e(var_751df20fceaee5) {
    if (!isdefined(var_751df20fceaee5) || !isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
        return;
    }
    if (!is_equal(var_751df20fceaee5.var_d182b8d3f3aaa93b.type, "cp_mp_recon_points_exfil_site_entityless")) {
        return;
    }
    var_ed989f1ff40d4df4 = function_33a21b2ea282d115() >= level.var_8571b4c6c544a92c;
    function_10972832881180ee(var_751df20fceaee5, var_ed989f1ff40d4df4);
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x108c
// Size: 0x175
function private function_2f5cbe081bc2430() {
    var_41445c1d24a2bc4b = 0;
    offset = 4;
    teammates = getteamdata(self.team, "players");
    foreach (player in teammates) {
        squadmemberindex = player.var_3f78c6a0862f9e25;
        shiftoffset = squadmemberindex * offset;
        amount = int(player function_33a21b2ea282d115());
        var_41445c1d24a2bc4b = amount << shiftoffset | var_41445c1d24a2bc4b;
    }
    foreach (player in teammates) {
        player setclientomnvar("ui_ob_recon_points_count", var_41445c1d24a2bc4b);
    }
    var_30706430d8caaeb7 = function_8e6454dd6d0cedd3();
    foreach (var_751df20fceaee5 in var_30706430d8caaeb7) {
        player function_bc9f002d4decfa9e(var_751df20fceaee5);
    }
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1208
// Size: 0xbb
function private function_14debcad04282fbf(delta) {
    playerid = self getentitynumber();
    var_20d7ec5e9edb74a3 = level.var_b66406c81d84e91f[playerid];
    var_41445c1d24a2bc4b = var_20d7ec5e9edb74a3 + delta;
    if (var_20d7ec5e9edb74a3 < var_41445c1d24a2bc4b && var_20d7ec5e9edb74a3 < level.var_10eebe39d476816e) {
        scripts/mp/hud_message::showsplash("recon_points_earned", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
    }
    level.var_b66406c81d84e91f[playerid] = clamp(var_41445c1d24a2bc4b, 0, level.var_10eebe39d476816e);
    if (level.var_b66406c81d84e91f[playerid] == level.var_10eebe39d476816e) {
        scripts/mp/hud_message::showsplash("recon_points_max", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
    }
    function_2f5cbe081bc2430();
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12ca
// Size: 0x1a
function private function_be25d212fb44b9a9() {
    if (function_33a21b2ea282d115() >= level.var_135fcaa8f9802c71) {
        return false;
    }
    return true;
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12ec
// Size: 0xf7
function private function_777650b23d69e74e(event, params) {
    level endon("game_ended");
    self endon("disconnect");
    if (!istrue(level.var_319c5fcabbf91284) || !isdefined(event)) {
        return 0;
    }
    var_ada5a9c1e47b30de = undefined;
    switch (event) {
    case #"boss_killed":
        var_ada5a9c1e47b30de = level.var_ad34cf1255372b35;
        break;
    case #"hash_2a29c734c3883c89":
        var_ada5a9c1e47b30de = level.var_84e6692f7dce674a;
        break;
    case #"contracts_completed":
        var_ada5a9c1e47b30de = level.var_6583f8d86afcc61a;
        break;
    case #"hash_eea98455a74fc364":
        return doexfil(params);
    case #"hash_f448446b03528bac":
        return function_5e077dbd13c9817f();
    default:
        /#
            logstring("splash_list_jup_ob_pvpve" + function_3c8848a3a11b2553(event));
        #/
        break;
    }
    if (isdefined(var_ada5a9c1e47b30de)) {
        function_14debcad04282fbf(var_ada5a9c1e47b30de);
        return 1;
    }
    return 0;
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13eb
// Size: 0x90
function private doexfil(params) {
    if (isdefined(params) && isdefined(params.var_751df20fceaee5) && function_9a63dbbe0ab75279(params.var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
        /#
            logstring("<unknown string>");
        #/
        return true;
    }
    if (function_33a21b2ea282d115() < level.var_8571b4c6c544a92c) {
        scripts/mp/hud_message::showsplash("recon_points_insufficient", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
        return false;
    }
    function_14debcad04282fbf(level.var_8571b4c6c544a92c * -1);
    return true;
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1483
// Size: 0x70
function private function_5e077dbd13c9817f() {
    if (function_33a21b2ea282d115() < level.var_135fcaa8f9802c71) {
        scripts/mp/hud_message::showsplash("recon_points_insufficient", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
        return false;
    }
    function_14debcad04282fbf(level.var_135fcaa8f9802c71 * -1);
    if (isalive(self) && self.sessionstate != "playing") {
        self.health = 0;
    }
    thread namespace_dc38f0ea48cd4743::function_a6a654c500d6b6c2();
    return true;
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fb
// Size: 0x135
function onAIKilled(params) {
    var_168224244dcb1447 = isdefined(self.subclass) && string_starts_with(self.subclass, "ob_warlord_");
    var_a7d68498d3a48332 = isdefined(self.subclass) && self.subclass == "zombie_abom_mega";
    if (!var_168224244dcb1447 && !var_a7d68498d3a48332) {
        return;
    }
    playerattacker = params.eattacker;
    if (isdefined(playerattacker) && !isplayer(playerattacker) && isplayer(playerattacker.owner)) {
        playerattacker = playerattacker.owner;
    }
    if (!isplayer(playerattacker)) {
        return;
    }
    var_665a0099fb4fc6e1 = getteamdata(playerattacker.team, "players");
    foreach (player in var_665a0099fb4fc6e1) {
        player thread function_777650b23d69e74e(#"boss_killed");
    }
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1637
// Size: 0x91
function private function_9a63dbbe0ab75279(var_ac4d58e2f21d26e7) {
    if (level.var_8571b4c6c544a92c == 0) {
        return true;
    }
    if (isdefined(var_ac4d58e2f21d26e7) && isdefined(level.var_27aad97b556a4fcf)) {
        foreach (var_751df20fceaee5 in level.var_27aad97b556a4fcf) {
            if (var_ac4d58e2f21d26e7 == var_751df20fceaee5.var_d182b8d3f3aaa93b) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16d0
// Size: 0x60
function private function_50ff57d0f4bd0d0e(player) {
    if (!isdefined(player)) {
        return true;
    }
    maxdistancesqrt = level.var_31f34dcf808ad455 * level.var_31f34dcf808ad455;
    var_d9c6176b077a7891 = distance2dsquared(player.origin, self.origin);
    if (var_d9c6176b077a7891 > maxdistancesqrt) {
        return true;
    }
    return false;
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1738
// Size: 0x10
function private function_14d4e08fe0b364e7() {
    if (namespace_6776e8e74ed64842::expansion_started()) {
        return true;
    }
    return false;
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1750
// Size: 0xcf
function private function_4bc55e63d13224ef() {
    logstring("[recon_points] StartCommunalExfil " + self.name);
    self.var_d182b8d3f3aaa93b.interact setscriptablepartstate("cp_mp_exfil_icon", "free_exfil_icon");
    self.var_d182b8d3f3aaa93b.interact setscriptablepartstate("cp_mp_exfil_site", "free_exfil_site");
    self.var_1c13f1737dccef9a = 1;
    level.var_44194c664b77bf1b = array_remove(level.var_44194c664b77bf1b, self);
    self.var_81fff6332116316f = level.var_dae00956e0a3d5c5;
    self.var_cfaabfb649760fac = &function_50ff57d0f4bd0d0e;
    self.var_c9b6fe30b53a07f8 = level.var_cafbd8eacf78a549;
    function_1590a66b9f6c2c3b(self, level.var_dae00956e0a3d5c5);
    level thread function_748fd8b59180efd1(self);
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1826
// Size: 0x87
function private function_d2f63cdbcf2830e8() {
    self.var_1c13f1737dccef9a = 0;
    self.var_985e82f034f67960 = undefined;
    var_30706430d8caaeb7 = function_8e6454dd6d0cedd3();
    if (array_contains(var_30706430d8caaeb7, self)) {
        self.var_d182b8d3f3aaa93b.interact setscriptablepartstate("cp_mp_exfil_icon", "default_icon");
    }
    level.var_27aad97b556a4fcf = array_remove(level.var_27aad97b556a4fcf, self);
    /#
        logstring("<unknown string>" + self.name);
    #/
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18b4
// Size: 0x6f
function private function_959e7645849321e5() {
    if (isdefined(level.var_27aad97b556a4fcf)) {
        foreach (var_751df20fceaee5 in level.var_27aad97b556a4fcf) {
            var_751df20fceaee5 function_d2f63cdbcf2830e8();
        }
    }
    level.var_27aad97b556a4fcf = [];
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x192a
// Size: 0x18a
function private function_ca9c0366894334e8() {
    var_56cbe00f8fc22d4b = [];
    foreach (var_751df20fceaee5 in function_8e6454dd6d0cedd3()) {
        if (function_4027f5445bb7c8fb(var_751df20fceaee5)) {
            continue;
        }
        var_56cbe00f8fc22d4b[var_56cbe00f8fc22d4b.size] = var_751df20fceaee5;
    }
    if (var_56cbe00f8fc22d4b.size <= 0) {
        foreach (player in level.players) {
            player scripts/mp/hud_message::showsplash("recon_points_free_exfil_not_found", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
        }
        return;
    }
    var_3a80af333de4222 = random(var_56cbe00f8fc22d4b);
    level.var_27aad97b556a4fcf[level.var_27aad97b556a4fcf.size] = var_3a80af333de4222;
    foreach (player in level.players) {
        if (var_3a80af333de4222 function_50ff57d0f4bd0d0e(player)) {
            continue;
        }
        player scripts/mp/hud_message::showsplash("recon_points_free_exfil_activated", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
    }
    if (istrue(level.var_34a7933267810c4)) {
        var_3a80af333de4222 function_4bc55e63d13224ef();
    }
    var_3a80af333de4222 thread function_fc46b6e2c35361c4();
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1abb
// Size: 0x8d
function private function_c28fc02badb3bf98(var_cc371abb7f83dd1b, var_8cbf72799df0c438) {
    var_ee71204034f2c8d1 = var_cc371abb7f83dd1b - var_8cbf72799df0c438;
    if (var_ee71204034f2c8d1 > 0) {
        wait(var_ee71204034f2c8d1);
        foreach (player in level.players) {
            player scripts/mp/hud_message::showsplash("recon_points_free_exfil_coming", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
        }
    }
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b4f
// Size: 0x12
function private function_fc46b6e2c35361c4() {
    self waittill("exfil_complete_timeout");
    function_d2f63cdbcf2830e8();
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b68
// Size: 0x5d
function private function_5ac28eb279e004dc(var_cc371abb7f83dd1b, var_8cbf72799df0c438) {
    thread function_c28fc02badb3bf98(var_cc371abb7f83dd1b, var_8cbf72799df0c438);
    wait(var_cc371abb7f83dd1b);
    if (!flag("exfil_initialized")) {
        logstring("[recon_points] WaitAndStartRandomExfil exfil not initialized ");
        return;
    }
    if (function_14d4e08fe0b364e7()) {
        function_959e7645849321e5();
        logstring("[recon_points] WaitAndStartRandomExfil free exfil finished ");
        return;
    }
    function_ca9c0366894334e8();
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bcc
// Size: 0x81
function private function_36763cf05948f767() {
    level notify("recon_points_free_exfil_think");
    level endon("game_ended");
    level endon("recon_points_free_exfil_think");
    level waittill("prematch_done");
    logstring("[recon_points] FreeExfilThink starts: Delay " + level.var_7c5c009a2bb8fdf0 + " Interval: " + level.var_1422423eba8353d6);
    var_d25ce37b0193c4cf = 30;
    function_5ac28eb279e004dc(level.var_7c5c009a2bb8fdf0, var_d25ce37b0193c4cf);
    while (!function_14d4e08fe0b364e7()) {
        function_5ac28eb279e004dc(level.var_1422423eba8353d6, var_d25ce37b0193c4cf);
    }
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c54
// Size: 0x93
function private onexfilstart(var_751df20fceaee5) {
    scripts/mp/objidpoolmanager::update_objective_icon(var_751df20fceaee5.objectiveidsecondary, "ui_map_icon_extraction_enemy");
    foreach (player in level.players) {
        player function_4f67cc94e9d23825(var_751df20fceaee5);
    }
    /#
        logstring("<unknown string>" + var_751df20fceaee5.name);
    #/
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cee
// Size: 0x30
function private function_b3c36611131bd74a(var_751df20fceaee5) {
    scripts/mp/objidpoolmanager::objective_playermask_hidefromall(var_751df20fceaee5.objectiveidprimary);
    scripts/mp/objidpoolmanager::objective_playermask_hidefromall(var_751df20fceaee5.objectiveidsecondary);
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d25
// Size: 0x93
function private onexfilreset(var_751df20fceaee5) {
    scripts/mp/objidpoolmanager::update_objective_icon(var_751df20fceaee5.objectiveidsecondary, "ui_map_icon_extraction_recon_points_disabled");
    foreach (player in level.players) {
        player function_bc9f002d4decfa9e(var_751df20fceaee5);
    }
    /#
        logstring("<unknown string>" + var_751df20fceaee5.name);
    #/
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1dbf
// Size: 0xa9
function private function_7b7d449978e92e60(pingowner, pingindex) {
    target = scripts/cp_mp/calloutmarkerping::function_b6cb97b6f81f0fd2(pingowner, pingindex);
    params = spawnstruct();
    params.player = pingowner;
    params.pingindex = pingindex;
    params.obj = target;
    if (isdefined(target)) {
        target callback::callback("on_ping", params);
        return;
    }
    gscobjectiveid = self calloutmarkerping_getgscobjectiveindex(pingindex);
    if (gscobjectiveid != -1) {
        self.var_3c32c1f7963d00d = pingindex;
        self.var_64891db3f3c85d57 = gscobjectiveid;
        thread function_54f1ae7e02711fc9();
    }
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e6f
// Size: 0x3f
function private function_54f1ae7e02711fc9() {
    self notify("wait_gsc_objective_id_ping_removed");
    self endon("death_or_disconnect");
    self endon("wait_gsc_objective_id_ping_removed");
    self waittill("predictiveCalloutClear_" + self.var_3c32c1f7963d00d);
    self.var_3c32c1f7963d00d = undefined;
    self.var_64891db3f3c85d57 = undefined;
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1eb5
// Size: 0x21c
function private function_2950b8b7b06664d7(params) {
    level endon("game_ended");
    level.var_8571b4c6c544a92c = getdvarint(@"hash_bf8760b03bb33e61", 3);
    level.var_f08929157ba33935 = "cp_mp_recon_points_exfil_site_entityless";
    level callback::add("on_exfil_start", &onexfilstart);
    level callback::add("on_exfil_complete_timeout", &function_b3c36611131bd74a);
    level callback::add("on_exfil_reset", &onexfilreset);
    level.var_ace7dc473d9a419c = getdvarint(@"hash_9d775aefdae1feca", 1);
    if (istrue(level.var_ace7dc473d9a419c)) {
        level.var_7c5c009a2bb8fdf0 = getdvarint(@"hash_fa3f338b67619453", 0);
        level.var_1422423eba8353d6 = getdvarint(@"hash_6dada563188d81ec", 300);
        level.var_34a7933267810c4 = getdvarint(@"hash_c3bcce1b831ac283", 1);
        level.var_dae00956e0a3d5c5 = getdvarint(@"hash_9ccf5d0dade47f04", 45);
        level.var_31f34dcf808ad455 = getdvarint(@"hash_9de7f0c50de4427f", 2000) / 0.0254;
        level.var_cafbd8eacf78a549 = getdvarint(@"hash_5d81b35300440f5d", 500) / 0.0254;
        level.var_27aad97b556a4fcf = [];
        level thread function_36763cf05948f767();
    }
    level flag_wait("exfil_initialized");
    utility::registersharedfunc("ping", "calloutMarkerPing_markerAdded", &function_7b7d449978e92e60);
    var_30706430d8caaeb7 = function_8e6454dd6d0cedd3();
    foreach (var_751df20fceaee5 in var_30706430d8caaeb7) {
        if (!isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b) || !isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b.interact)) {
            continue;
        }
        var_751df20fceaee5 function_7d5272871e474c76();
        var_751df20fceaee5.var_d182b8d3f3aaa93b.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_eed2d218028f84f2);
    }
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20d8
// Size: 0xb1
function private function_7d5272871e474c76() {
    if (!isdefined(self.var_d182b8d3f3aaa93b)) {
        return;
    }
    if (!is_equal(self.var_d182b8d3f3aaa93b.type, "cp_mp_recon_points_exfil_site_entityless")) {
        return;
    }
    self.objectiveidprimary = function_3472777904abc5b8("ui_map_icon_extraction_recon_points");
    self.objectiveidsecondary = function_3472777904abc5b8("ui_map_icon_extraction_recon_points_disabled");
    foreach (player in level.players) {
        player function_bc9f002d4decfa9e(self);
    }
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2190
// Size: 0xba
function private function_3472777904abc5b8(markericon) {
    objectivemarkerid = scripts/mp/objidpoolmanager::requestobjectiveid(0);
    scripts/mp/objidpoolmanager::objective_add_objective(objectivemarkerid, "active");
    scripts/mp/objidpoolmanager::function_bf66c6833e867284(objectivemarkerid, function_1b78dd27be5b243());
    scripts/mp/objidpoolmanager::function_d7e3c4a08682c1b9(objectivemarkerid, 0);
    scripts/mp/objidpoolmanager::objective_set_play_intro(objectivemarkerid, 0);
    scripts/mp/objidpoolmanager::objective_set_play_outro(objectivemarkerid, 0);
    scripts/mp/objidpoolmanager::function_2946e9eb07acb3f1(objectivemarkerid, "SHARED_HINTSTRINGS/EXFIL");
    scripts/mp/objidpoolmanager::update_objective_icon(objectivemarkerid, markericon);
    scripts/mp/objidpoolmanager::update_objective_setbackground(objectivemarkerid, 1);
    scripts/mp/objidpoolmanager::update_objective_setzoffset(objectivemarkerid, 60);
    scripts/mp/objidpoolmanager::function_c3c6bff089dfdd34(objectivemarkerid, "icon_regular");
    scripts/mp/objidpoolmanager::update_objective_ownerteam(objectivemarkerid, "neutral");
    scripts/mp/objidpoolmanager::update_objective_position(objectivemarkerid, self.origin);
    scripts/mp/objidpoolmanager::function_98ba077848896a3(objectivemarkerid, 0);
    scripts/mp/objidpoolmanager::objective_playermask_hidefromall(objectivemarkerid);
    return objectivemarkerid;
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2252
// Size: 0xd4
function private function_eed2d218028f84f2(usable, player) {
    if (isdefined(player) && istrue(player.interactions_disabled)) {
        return {string:"", type:"HINT_NOICON"};
    }
    if (isdefined(usable) && function_9a63dbbe0ab75279(usable)) {
        return {string:"SHARED_HINTSTRINGS/EXFIL_START_USE_GENERIC", type:"HINT_BUTTON"};
    }
    var_b68f84bc1bd7a8a5 = player function_33a21b2ea282d115();
    if (var_b68f84bc1bd7a8a5 < level.var_8571b4c6c544a92c) {
        return {string:"SHARED_HINTSTRINGS/RECON_POINTS_EXFIL_DISABLED", type:"HINT_BUTTON"};
    }
    return {string:"SHARED_HINTSTRINGS/RECON_POINTS_EXFIL_ENABLED", type:"HINT_BUTTON"};
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x232d
// Size: 0xf
function private initdebug() {
    /#
        level thread function_5be6f854fd9386d8();
    #/
}

// Namespace namespace_910f1c9e49a229ca / namespace_dff82f9820538a93
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2343
// Size: 0xee
function private function_5be6f854fd9386d8() {
    /#
        while (true) {
            if (!isdefined(level.players) || level.players.size <= 0) {
                waitframe();
                continue;
            }
            var_5a2901b28853284c = getdvarint(@"hash_6009a9b7652ef648", 0);
            if (var_5a2901b28853284c != 0) {
                setdvar(@"hash_6009a9b7652ef648", 0);
                foreach (player in level.players) {
                    player function_14debcad04282fbf(var_5a2901b28853284c);
                }
            }
            var_4ef1432760234ab6 = getdvarint(@"hash_ff0ad2ee4fe8a96c", 0);
            if (var_4ef1432760234ab6 != 0) {
                setdvar(@"hash_ff0ad2ee4fe8a96c", 0);
                function_ca9c0366894334e8();
            }
            waitframe();
        }
    #/
}

