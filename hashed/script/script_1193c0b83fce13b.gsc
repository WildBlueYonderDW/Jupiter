// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using script_48814951e916af89;
#using script_65f58f3c394dcf9a;
#using script_6c4e8cea70bf4b6d;
#using script_3314add7998ab13;
#using script_5def7af2a9f04234;
#using script_3ff084f114b7f6c9;
#using script_64acb6ce534155b7;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_1174abedbefe9ada;
#using script_4948cdf739393d2d;
#using script_57d3850a12cf1d8f;
#using scripts\mp\hud_message.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;

#namespace namespace_99b5353ba6130ae4;

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f2
// Size: 0x117
function function_80d68c9701e1aea5(data) {
    if (getdvarint(@"hash_191305ad3d7422a8", 1) <= 0) {
        return;
    }
    function_d21c423660efca45();
    var_58e0d036347fd542 = [];
    phones = getentitylessscriptablearray("brloot_activity_starter_hacker_phone");
    foreach (phone in phones) {
        if (function_c8b12721d3a6c3fc(phone)) {
            origin = phone.origin;
            poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(origin);
            subarea = namespace_bfef6903bca5845d::function_a44e168e8cced18(origin, poiname);
            struct = spawnstruct();
            struct.origin = origin;
            struct.poi = poiname;
            var_58e0d036347fd542[var_58e0d036347fd542.size] = struct;
        }
    }
    function_b713f2d39b34540f(data, &function_565acf1a582df350, var_58e0d036347fd542);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x710
// Size: 0x111
function function_d21c423660efca45() {
    level.var_5dddedbf2bda5311 = spawnstruct();
    level.var_5dddedbf2bda5311.var_be8a6484aed40352 = getdvarint(@"hash_702ebf4ef0c6f88a", 3);
    level.var_5dddedbf2bda5311.var_576a3b6b02998159 = getdvarint(@"hash_46511004c7948df", 60);
    level.var_5dddedbf2bda5311.var_c669e317f1fd1293 = getdvarint(@"hash_c767586e70f5452f", 20);
    level.var_5dddedbf2bda5311.var_982966060d10f80a = getdvarint(@"hash_330cbe811cd82406", 400);
    level.var_5dddedbf2bda5311.var_88f1bf50c2880f31 = getdvarint(@"hash_3326ba811fa9de92", 0);
    level.var_5dddedbf2bda5311.var_d6b7c0cb8162cd8e = int(level.var_5dddedbf2bda5311.var_982966060d10f80a / level.var_5dddedbf2bda5311.var_c669e317f1fd1293);
    namespace_76a219af07c28c13::registerteamassimilatecallback(&function_6bdc6f56944dc3aa);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x828
// Size: 0x8
function function_a07f7c4c0c4ef8e3() {
    /#
        return [];
    #/
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x837
// Size: 0xec
function function_565acf1a582df350(activity, node) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.funcs["onInit"] = &function_7d55c65124970bdb;
    task.funcs["onTeamStart"] = &function_6efa8f1ae457e738;
    task.funcs["onPlayerJoined"] = &function_d151278d57e44ce9;
    task.funcs["onPlayerRemoved"] = &function_4e07eafa1b6b460c;
    task.funcs["onTeamAssigned"] = &function_1e8f1b7f3e56d2fc;
    task.funcs["onCancel"] = &function_43267367654390f3;
    task.ref = "dmz_hacker_phone";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.node = node;
    return task;
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92b
// Size: 0x2b
function function_7d55c65124970bdb() {
    namespace_f2c68794a1018c9d::function_c847bfd52c064289(self.node.origin + (0, 0, 25));
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95d
// Size: 0xc
function function_6efa8f1ae457e738(teamname) {
    
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x970
// Size: 0x70
function function_d151278d57e44ce9(player) {
    player.var_45b8e84de48bb89f = 1;
    player setclientomnvar("ui_br_hacker_phone_state", 2);
    namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.icon, player);
    player namespace_1eb3c4e0e28fac71::uiobjectivesetparameter(self.var_9f274e85b7bbd87f, level.var_5dddedbf2bda5311.var_be8a6484aed40352);
    function_4f4334ae28f70353(player, player.team);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e7
// Size: 0x5a
function function_4e07eafa1b6b460c(player) {
    player.var_45b8e84de48bb89f = undefined;
    player.var_6c8912ea30b21003 = undefined;
    player setclientomnvar("ui_br_hacker_phone_state", 0);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.icon, player);
    player setclientomnvar("ui_br_hacked_phones_data1", 0);
    player setclientomnvar("ui_br_hacked_phones_data2", 0);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa48
// Size: 0x1b
function function_43267367654390f3(teamname) {
    function_d0f1c9a699a0a2d8(teamname);
    function_688a2acdd7d9d902();
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6a
// Size: 0x1ba
function function_1e8f1b7f3e56d2fc(teamname) {
    level endon("game_ended");
    self endon("task_ended");
    self.var_9f274e85b7bbd87f = 0;
    self.var_cc4cd023f0195d5f = level.var_5dddedbf2bda5311.var_be8a6484aed40352;
    self.payoutvalue = function_2fbb9e83420ca54b(teamname);
    self.var_2655f1229ea3cb33 = [];
    if (!isdefined(level.teamdata[teamname]["hackerPhonePaymentCountActive"])) {
        level.teamdata[teamname]["hackerPhonePaymentCountActive"] = 0;
    }
    if (!isdefined(level.teamdata[teamname]["hackerPhonePaymentsRemaining"])) {
        level.teamdata[teamname]["hackerPhonePaymentsRemaining"] = 0;
    }
    if (!isdefined(level.teamdata[teamname]["hackedContractsData1"])) {
        level.teamdata[teamname]["hackedContractsData1"] = [];
    }
    if (!isdefined(level.teamdata[teamname]["hackedContractsData2"])) {
        level.teamdata[teamname]["hackedContractsData2"] = [];
    }
    function_851f0ba242e91378(teamname);
    function_70fbb5e0989f9e50(teamname);
    function_1759acfd39bb5edf("dmz_hacker_phone_accept", teamname);
    thread function_527ac84bfbbbad44(teamname);
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        if (!isdefined(player)) {
            continue;
        }
        player.var_45b8e84de48bb89f = 1;
        player setclientomnvar("ui_br_hacker_phone_state", 2);
        function_64623e2ff7409f39(player, 1);
    }
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("hacker_phone_start", teamname, 2);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc2b
// Size: 0x132
function private function_688a2acdd7d9d902(teamname) {
    if (isdefined(teamname)) {
        function_d0f1c9a699a0a2d8(teamname);
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("hacker_phone_success", teamname, 1.5);
        function_c1fd3441ccfba6f8(teamname, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
        var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
        namespace_d696adde758cbe79::showdmzsplash("dmz_hacker_phone_complete", var_e2b2bbd9e6539f11, undefined, level.var_5dddedbf2bda5311.var_d6b7c0cb8162cd8e);
        level.teamdata[teamname]["hackerPhonePaymentsRemaining"] = level.var_5dddedbf2bda5311.var_d6b7c0cb8162cd8e;
        function_8f0f565d34f52633(teamname);
        var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
        foreach (player in var_e2b2bbd9e6539f11) {
            if (!isdefined(player)) {
                continue;
            }
            player.var_6c8912ea30b21003 = 1;
        }
        if (!function_7586e893298068d4(teamname)) {
            wait(5.5);
        }
        thread function_fb296d840951ac58(teamname);
    }
    task_ended(teamname);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd64
// Size: 0x6a
function function_c8b12721d3a6c3fc(node) {
    origin = node.origin;
    poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(origin);
    subarea = namespace_bfef6903bca5845d::function_a44e168e8cced18(origin, poiname);
    return isdefined(subarea) && !namespace_7789f919216d38a2::function_cdcab1374db7f007(origin) && !namespace_9823ee6035594d67::function_f59f68adc71d49b3(origin) && !namespace_58dcf42cf567f34f::function_64332f29e2409e55(origin);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd6
// Size: 0x1f
function function_7586e893298068d4(teamname) {
    return level.teamdata[teamname]["hackerPhonePaymentCountActive"] > 0;
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfd
// Size: 0xe5
function function_d0f1c9a699a0a2d8(teamname) {
    function_629ed367d1393020();
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        if (isdefined(player)) {
            player.var_45b8e84de48bb89f = undefined;
            player setclientomnvar("ui_br_hacker_phone_state", 0);
        }
    }
    foreach (var_17953215dd7c5f9b in self.var_2655f1229ea3cb33) {
        function_3290c9088f8c4e53(var_17953215dd7c5f9b, teamname);
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee9
// Size: 0x61
function function_a232d3c610006843(var_431a56b37aba9942, var_fba0376e0036de8d) {
    self endon("death_or_disconnect");
    if (istrue(function_8bcccf23da031467(var_431a56b37aba9942.instance, var_fba0376e0036de8d.team))) {
        var_fba0376e0036de8d namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/HACKER_PHONE_ALREADY_HACKED");
        return;
    }
    var_fba0376e0036de8d namespace_f2c68794a1018c9d::function_9be29ad72a155ee1("intel_pickup_phone_alt", 11);
    function_5198324ff80596d8(var_431a56b37aba9942, var_fba0376e0036de8d);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf51
// Size: 0x1f7
function function_5198324ff80596d8(var_431a56b37aba9942, var_fba0376e0036de8d) {
    if (istrue(function_8bcccf23da031467(var_431a56b37aba9942.instance, var_fba0376e0036de8d.team))) {
        var_fba0376e0036de8d namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/HACKER_PHONE_ALREADY_HACKED");
        return;
    }
    task = function_37416c14e9703fb6(var_fba0376e0036de8d);
    if (!isdefined(task)) {
        return;
    }
    task function_105b8f7ebe0ad130(var_431a56b37aba9942.instance, var_fba0376e0036de8d.team);
    task.var_2655f1229ea3cb33[task.var_2655f1229ea3cb33.size] = var_431a56b37aba9942.instance;
    task.var_9f274e85b7bbd87f++;
    task.var_cc4cd023f0195d5f = level.var_5dddedbf2bda5311.var_be8a6484aed40352 - task.var_9f274e85b7bbd87f;
    task function_70fbb5e0989f9e50(var_fba0376e0036de8d.team);
    namespace_8361bad7391de074::function_8706a89fae666d51(var_fba0376e0036de8d);
    function_604a7fc1fb4b6dfd(var_431a56b37aba9942.instance, var_fba0376e0036de8d);
    if (task.var_9aa953016facacc == var_431a56b37aba9942.instance) {
        task notify("marked_contract_hacked");
        task function_851f0ba242e91378(var_fba0376e0036de8d.team, var_fba0376e0036de8d);
    }
    task.var_552c9e74f497621f = 0;
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(var_fba0376e0036de8d.team, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        player thread namespace_48a08c5037514e04::doscoreevent(#"hash_f085eaf302a7e140");
    }
    if (istrue(task function_171503a34d052b4e())) {
        task function_688a2acdd7d9d902(var_fba0376e0036de8d.team);
    } else {
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("hacker_phone_hacked", var_fba0376e0036de8d.team, 1);
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114f
// Size: 0x2f
function function_171503a34d052b4e() {
    if (self.var_9f274e85b7bbd87f >= level.var_5dddedbf2bda5311.var_be8a6484aed40352) {
        self notify("reached_hacked_limit");
        return 1;
    }
    return 0;
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1186
// Size: 0x7c
function function_527ac84bfbbbad44(teamname) {
    self endon("task_ended");
    level endon("game_ended");
    var_2773522dfbc4d477 = level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38;
    while (var_2773522dfbc4d477.size >= self.var_cc4cd023f0195d5f) {
        var_2773522dfbc4d477 = level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38;
        var_2773522dfbc4d477 = array_remove_array(var_2773522dfbc4d477, self.var_2655f1229ea3cb33);
        wait(1);
    }
    function_43267367654390f3(teamname);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1209
// Size: 0x5d
function function_105b8f7ebe0ad130(var_db376ee90688810d, teamname) {
    if (!isdefined(var_db376ee90688810d.var_5e3cc2521bd27a30)) {
        var_db376ee90688810d.var_5e3cc2521bd27a30 = [];
    }
    var_db376ee90688810d.var_5e3cc2521bd27a30[var_db376ee90688810d.var_5e3cc2521bd27a30.size] = teamname;
    function_991e730674c3cdd8(teamname, var_db376ee90688810d.index);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126d
// Size: 0x3c
function function_8bcccf23da031467(var_db376ee90688810d, teamname) {
    if (isdefined(var_db376ee90688810d.var_5e3cc2521bd27a30)) {
        if (array_contains(var_db376ee90688810d.var_5e3cc2521bd27a30, teamname)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b1
// Size: 0x6a
function function_3290c9088f8c4e53(var_db376ee90688810d, teamname) {
    if (isdefined(var_db376ee90688810d.var_5e3cc2521bd27a30) && array_contains(var_db376ee90688810d.var_5e3cc2521bd27a30, teamname)) {
        var_db376ee90688810d.var_5e3cc2521bd27a30 = array_remove(var_db376ee90688810d.var_5e3cc2521bd27a30, teamname);
        function_72db8368f7ffaafa(teamname, var_db376ee90688810d.index);
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1322
// Size: 0x8c
function function_70fbb5e0989f9e50(teamname) {
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        player namespace_1eb3c4e0e28fac71::uiobjectivesetparameter(self.var_9f274e85b7bbd87f, level.var_5dddedbf2bda5311.var_be8a6484aed40352);
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b5
// Size: 0x9b
function function_54bb0e15262ac835() {
    if (!isdefined(self.team)) {
        return;
    }
    teammates = namespace_54d20dd0dd79277f::getteamdata(self.team, "players");
    var_6cf4d7026c51235b = function_2fbb9e83420ca54b(self.team);
    var_9f870ccae9510eab = int(ceil(function_8c5476a01afab741(self, function_da38be107ae836ff(teammates, var_6cf4d7026c51235b))));
    var_94fdf3291d472947 = var_9f870ccae9510eab * level.var_5dddedbf2bda5311.var_d6b7c0cb8162cd8e;
    self setclientomnvar("ui_br_hacker_phone_potential_cash_value", var_94fdf3291d472947);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1457
// Size: 0xa1
function function_2fbb9e83420ca54b(teamname) {
    var_6cf4d7026c51235b = level.var_5dddedbf2bda5311.var_576a3b6b02998159;
    if (istrue(level.var_5dddedbf2bda5311.var_88f1bf50c2880f31)) {
        var_926316044e93f849 = getdvar(@"hash_a38ed422cbf98056", "60 45 30 15");
        var_21e6c4eb825d874d = strtok(var_926316044e93f849, " ");
        teamcount = int(min(namespace_54d20dd0dd79277f::getteamcount(teamname), var_21e6c4eb825d874d.size));
        var_6cf4d7026c51235b = var_21e6c4eb825d874d[teamcount - 1];
    }
    return int(var_6cf4d7026c51235b);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1500
// Size: 0x27
function function_cfb5d79cfe8c03a9(teamname) {
    return level.teamdata[teamname]["hackerPhonePaymentCountActive"] * self.payoutvalue;
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152f
// Size: 0x8a
function function_fb296d840951ac58(teamname) {
    level endon("game_ended");
    lootid = level.br_pickups.var_7b2bff2d04ee1017["brloot_payment_hacker_phone"];
    level.teamdata[teamname]["hackerPhonePaymentCountActive"]++;
    level.teamdata[teamname]["hackerPhonePaymentsRemaining"] = level.var_5dddedbf2bda5311.var_d6b7c0cb8162cd8e;
    function_53fcf5791ca038a0(teamname, lootid);
    thread function_725c819da2f98664(teamname, lootid);
    thread function_624d73a636eeffed(teamname);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c0
// Size: 0x6d
function function_725c819da2f98664(teamname, lootid) {
    level notify("monitor_payout_" + teamname);
    level endon("monitor_payout_" + teamname);
    level endon("game_ended");
    thread function_e387a70c3e4e731d(teamname);
    while (level.teamdata[teamname]["hackerPhonePaymentsRemaining"] > 0) {
        wait(level.var_5dddedbf2bda5311.var_c669e317f1fd1293);
        function_53fcf5791ca038a0(teamname, lootid);
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1634
// Size: 0x67
function function_624d73a636eeffed(teamname) {
    level endon("game_ended");
    wait(0.5);
    for (var_327efeb48a68a152 = level.teamdata[teamname]["hackerPhonePaymentsRemaining"]; var_327efeb48a68a152 > 0; var_327efeb48a68a152--) {
        wait(level.var_5dddedbf2bda5311.var_c669e317f1fd1293);
    }
    level.teamdata[teamname]["hackerPhonePaymentCountActive"]--;
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a2
// Size: 0x196
function function_53fcf5791ca038a0(teamname, lootid) {
    if (level.teamdata[teamname]["hackerPhonePaymentsRemaining"] > 0) {
        level.teamdata[teamname]["hackerPhonePaymentsRemaining"]--;
    }
    var_ec2736524e4a7410 = namespace_54d20dd0dd79277f::getteamdata(teamname, "alivePlayers");
    if (!var_ec2736524e4a7410.size) {
        return;
    }
    payoutvalue = function_cfb5d79cfe8c03a9(teamname);
    var_1dd0f3dfb99017d1 = function_da38be107ae836ff(var_ec2736524e4a7410, payoutvalue);
    foreach (player in var_ec2736524e4a7410) {
        if (isdefined(player) && var_1dd0f3dfb99017d1 > 0 && istrue(player.var_6c8912ea30b21003)) {
            var_9f870ccae9510eab = int(ceil(function_8c5476a01afab741(player, var_1dd0f3dfb99017d1)));
            player namespace_c6ccccd95254983f::playerplunderpickup(var_9f870ccae9510eab);
            if (isdefined(lootid)) {
                view_origin = player getvieworigin();
                player setclientomnvar("ui_br_hacker_phone_remaining_payments", level.teamdata[teamname]["hackerPhonePaymentsRemaining"]);
                player namespace_cb965d2f71fefddc::function_37be6e543436f3b3(lootid, view_origin, 1, var_9f870ccae9510eab);
            }
            if (isdefined(player.var_a4dd02e65175e1e7)) {
                player.var_a4dd02e65175e1e7["totalPayout"] = player.var_a4dd02e65175e1e7["totalPayout"] + var_9f870ccae9510eab * 10;
            }
            namespace_aad14af462a74d08::function_8359cadd253f9604(player, "passive_income_payment", 1);
        }
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183f
// Size: 0x1b2
function function_e387a70c3e4e731d(teamname) {
    level endon("monitor_payout_" + teamname);
    level endon("game_ended");
    var_9c231835be3c8312 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    for (var_327efeb48a68a152 = level.teamdata[teamname]["hackerPhonePaymentsRemaining"]; var_327efeb48a68a152 > 0; var_327efeb48a68a152--) {
        if (var_327efeb48a68a152 == 3) {
            foreach (player in var_9c231835be3c8312) {
                if (isdefined(player) && player.team == teamname) {
                    namespace_d696adde758cbe79::showdmzsplash("dmz_hacker_phone_expiring", [0:player]);
                }
            }
        }
        wait(level.var_5dddedbf2bda5311.var_c669e317f1fd1293);
    }
    foreach (player in var_9c231835be3c8312) {
        if (isdefined(player) && player.team == teamname) {
            namespace_d696adde758cbe79::showdmzsplash("dmz_hacker_phone_expired", [0:player]);
        }
    }
    wait(0.5);
    foreach (player in var_9c231835be3c8312) {
        if (isdefined(player)) {
            player.var_6c8912ea30b21003 = undefined;
        }
    }
    function_ec032bed730022d1(teamname, 0);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f8
// Size: 0x8d
function function_604a7fc1fb4b6dfd(var_30a99625b9f5d98c, player) {
    if (function_8bcccf23da031467(var_30a99625b9f5d98c, player.team)) {
        player setclientomnvar("ui_br_hacker_phone_state", 1);
    } else if (istrue(player.var_45b8e84de48bb89f)) {
        player setclientomnvar("ui_br_hacker_phone_state", 2);
    } else {
        player setclientomnvar("ui_br_hacker_phone_state", 0);
        if (var_30a99625b9f5d98c.activity.type == "hacker_phone") {
            player function_54bb0e15262ac835();
        }
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8c
// Size: 0x112
function function_991e730674c3cdd8(teamname, var_c9b0e78500221992) {
    var_c568c261258fb4e0 = level.teamdata[teamname]["hackedContractsData1"].size + level.teamdata[teamname]["hackedContractsData2"].size;
    /#
        assertex(var_c568c261258fb4e0 <= level.var_5dddedbf2bda5311.var_be8a6484aed40352, "Too much hacked phones, can't send all this data");
    #/
    if (level.teamdata[teamname]["hackedContractsData1"].size < 2) {
        level.teamdata[teamname]["hackedContractsData1"] = array_add(level.teamdata[teamname]["hackedContractsData1"], var_c9b0e78500221992);
        function_1ed7c25eba401809(teamname, level.teamdata[teamname]["hackedContractsData1"], "ui_br_hacked_phones_data1");
    } else {
        level.teamdata[teamname]["hackedContractsData2"] = array_add(level.teamdata[teamname]["hackedContractsData2"], var_c9b0e78500221992);
        function_1ed7c25eba401809(teamname, level.teamdata[teamname]["hackedContractsData2"], "ui_br_hacked_phones_data2");
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba5
// Size: 0xdd
function function_72db8368f7ffaafa(teamname, var_c9b0e78500221992) {
    if (array_contains(level.teamdata[teamname]["hackedContractsData1"], var_c9b0e78500221992)) {
        level.teamdata[teamname]["hackedContractsData1"] = array_remove(level.teamdata[teamname]["hackedContractsData1"], var_c9b0e78500221992);
        function_1ed7c25eba401809(teamname, level.teamdata[teamname]["hackedContractsData1"], "ui_br_hacked_phones_data1");
    } else if (array_contains(level.teamdata[teamname]["hackedContractsData2"], var_c9b0e78500221992)) {
        level.teamdata[teamname]["hackedContractsData2"] = array_remove(level.teamdata[teamname]["hackedContractsData2"], var_c9b0e78500221992);
        function_1ed7c25eba401809(teamname, level.teamdata[teamname]["hackedContractsData2"], "ui_br_hacked_phones_data2");
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c89
// Size: 0x93
function function_4f4334ae28f70353(player, teamname) {
    if (isdefined(level.teamdata[teamname]["hackedContractsData1"])) {
        var_81dab8953b9df82 = function_2f03a84e3419528(level.teamdata[teamname]["hackedContractsData1"]);
        player setclientomnvar("ui_br_hacked_phones_data1", var_81dab8953b9df82);
    }
    if (isdefined(level.teamdata[teamname]["hackedContractsData2"])) {
        var_81dab8953b9df82 = function_2f03a84e3419528(level.teamdata[teamname]["hackedContractsData2"]);
        player setclientomnvar("ui_br_hacked_phones_data2", var_81dab8953b9df82);
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d23
// Size: 0x95
function function_1ed7c25eba401809(teamname, var_b4a6c7c6c1ec8a4d, var_939613b9f38207b0) {
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    var_81dab8953b9df82 = function_2f03a84e3419528(var_b4a6c7c6c1ec8a4d);
    foreach (player in var_e2b2bbd9e6539f11) {
        player setclientomnvar(var_939613b9f38207b0, var_81dab8953b9df82);
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dbf
// Size: 0x3e
function function_2f03a84e3419528(var_b4a6c7c6c1ec8a4d) {
    var_81dab8953b9df82 = 0;
    for (i = 0; i < var_b4a6c7c6c1ec8a4d.size; i++) {
        var_81dab8953b9df82 = var_81dab8953b9df82 + (var_b4a6c7c6c1ec8a4d[i] << i * 16);
    }
    return var_81dab8953b9df82;
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e05
// Size: 0x3c
function function_5d4530ebfa3da544(player) {
    if (level.teamdata[player.team]["hackerPhonePaymentCountActive"] > 1) {
        return "br_pickup_cash_med_01";
    } else {
        return "br_pickup_cash_01";
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e48
// Size: 0x57
function function_851f0ba242e91378(teamname, var_fba0376e0036de8d) {
    var_7ca287a82f54e4f6 = self.activity.var_7ca287a82f54e4f6;
    if (isdefined(var_fba0376e0036de8d)) {
        var_7ca287a82f54e4f6 = var_fba0376e0036de8d;
    }
    var_3d397b9a8d8ccde2 = function_d81544c3289ce882(var_7ca287a82f54e4f6, teamname);
    thread function_f27b2d13f59d7978(var_3d397b9a8d8ccde2, teamname);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea6
// Size: 0x1c9
function function_d81544c3289ce882(var_7ca287a82f54e4f6, teamname) {
    var_6d1f29b3b0161959 = self.node.origin;
    if (isdefined(var_7ca287a82f54e4f6)) {
        var_6d1f29b3b0161959 = var_7ca287a82f54e4f6.origin;
    } else {
        var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
        foreach (player in var_e2b2bbd9e6539f11) {
            if (!isdefined(player)) {
                continue;
            }
            var_6d1f29b3b0161959 = player.origin;
            break;
        }
    }
    var_facf33f7f7ae6bcd = [];
    foreach (var_92709bf054b20c5d in level.var_1b7407dffe81e6e8.var_915f0d3c3a61e38) {
        if (!isdefined(var_92709bf054b20c5d) || !isdefined(var_92709bf054b20c5d.origin)) {
            continue;
        }
        var_facf33f7f7ae6bcd[var_facf33f7f7ae6bcd.size] = var_92709bf054b20c5d;
    }
    var_facf33f7f7ae6bcd = sortbydistance(var_facf33f7f7ae6bcd, var_6d1f29b3b0161959);
    var_facf33f7f7ae6bcd = array_remove_array(var_facf33f7f7ae6bcd, self.var_2655f1229ea3cb33);
    if (isdefined(var_facf33f7f7ae6bcd) && var_facf33f7f7ae6bcd.size > 0) {
        foreach (phone in var_facf33f7f7ae6bcd) {
            if (function_c8b12721d3a6c3fc(phone)) {
                function_91780adf8743a1d5(phone);
                return phone;
            }
        }
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2076
// Size: 0xc7
function function_f27b2d13f59d7978(var_4a84dd415b837de9, teamname) {
    level endon("game_ended");
    self endon("task_ended");
    self endon("marked_contract_hacked");
    if (!isdefined(var_4a84dd415b837de9)) {
        return;
    }
    haspart = var_4a84dd415b837de9 getscriptablehaspart("brloot_activity_starter");
    if (!haspart) {
        return;
    }
    self.var_552c9e74f497621f = 0;
    while (!istrue(function_171503a34d052b4e())) {
        if (var_4a84dd415b837de9 getscriptablepartstate("brloot_activity_starter") == "hidden" || self.var_552c9e74f497621f >= 90) {
            thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("hacker_phone_nag", teamname, 0);
            self.var_552c9e74f497621f = 0;
            var_4a84dd415b837de9 = function_d81544c3289ce882(self.activity.var_7ca287a82f54e4f6, teamname);
        }
        self.var_552c9e74f497621f++;
        wait(1);
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2144
// Size: 0x53
function function_91780adf8743a1d5(var_db376ee90688810d) {
    if (isdefined(self.var_9aa953016facacc) && self.var_9aa953016facacc == var_db376ee90688810d) {
        return;
    }
    function_cef2ed613a8338be(var_db376ee90688810d.origin + (0, 0, 25));
    self.var_9aa953016facacc = var_db376ee90688810d;
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x219e
// Size: 0xfb
function function_8f0f565d34f52633(teamname) {
    self.dlogdata = [];
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        if (isdefined(player)) {
            function_6ec01dd217d2ff03(player, 0, 0, 1);
            player.var_a4dd02e65175e1e7 = [];
            player.var_a4dd02e65175e1e7["tabletIndex"] = self.tablet.index;
            player.var_a4dd02e65175e1e7["totalPayout"] = 0;
            player.var_a4dd02e65175e1e7["payoutValue"] = self.payoutvalue * 10;
            namespace_f1d40c362677777e::registerondisconnecteventcallback(&function_3205795847561be3);
        }
    }
    thread function_89fbd9bb7207a48d(teamname);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a0
// Size: 0x83
function function_ec032bed730022d1(teamname, var_d1c192f65678cca7) {
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        function_6ec01dd217d2ff03(player, var_d1c192f65678cca7, 0, 0);
    }
    self notify("hackerPhoneDlogSent");
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232a
// Size: 0x18
function function_3205795847561be3(player) {
    function_6ec01dd217d2ff03(player, 0, 1, 0);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2349
// Size: 0x25
function function_89fbd9bb7207a48d(teamname) {
    level endon("hackerPhoneDlogSent");
    level waittill("game_ended");
    function_ec032bed730022d1(teamname, 1);
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2375
// Size: 0xd6
function function_6ec01dd217d2ff03(player, var_d1c192f65678cca7, var_f8b7fd6747ad8f77, var_1f5b8c9203a2f046) {
    if (isdefined(player) & isarray(player.var_a4dd02e65175e1e7)) {
        player dlog_recordplayerevent("dlog_event_contract_hacker_phone_payment_phase_completion", [0:"tablet_index", 1:player.var_a4dd02e65175e1e7["tabletIndex"], 2:"total_payout_value", 3:player.var_a4dd02e65175e1e7["totalPayout"], 4:"cash_per_payout", 5:player.var_a4dd02e65175e1e7["payoutValue"], 6:"stopped_by_match_end", 7:var_d1c192f65678cca7, 8:"stopped_by_disconnect", 9:var_f8b7fd6747ad8f77, 10:"payout_extended", 11:var_1f5b8c9203a2f046]);
        player.var_a4dd02e65175e1e7 = undefined;
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2452
// Size: 0x3f
function function_6bdc6f56944dc3aa(var_fe7bd20e5b3df7d2, oldteam, newteam) {
    if (istrue(var_fe7bd20e5b3df7d2.var_6c8912ea30b21003)) {
        var_fe7bd20e5b3df7d2.var_6c8912ea30b21003 = undefined;
        thread function_7113e9264646a968(var_fe7bd20e5b3df7d2);
    }
}

// Namespace namespace_99b5353ba6130ae4/namespace_210d6dd43cfaf195
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2498
// Size: 0x2f
function function_7113e9264646a968(player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    wait(1);
    namespace_d696adde758cbe79::showdmzsplash("dmz_hacker_phone_expired", [0:player]);
}

