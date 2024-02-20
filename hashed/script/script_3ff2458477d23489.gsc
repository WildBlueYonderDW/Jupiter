// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_64acb6ce534155b7;
#using script_3ff084f114b7f6c9;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\hud_message.gsc;
#using script_6c4e8cea70bf4b6d;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;

#namespace namespace_46a48466a348d5e2;

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x667
// Size: 0x19
function autoexec main() {
    utility::registersharedfunc("hacker_phone", "get_contract_data", &function_fb7271d5ee18b98d);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x687
// Size: 0xee
function function_fb7271d5ee18b98d(data) {
    function_2fac9b58d42b2920();
    data.funcs["onInit"] = &function_8c64a4f648288a95;
    data.funcs["onTeamAssigned"] = &function_921a0be9ec330c6a;
    data.funcs["onEnterGulag"] = &function_ca07a6ca5c3c8af5;
    data.funcs["onPlayerRespawn"] = &function_f6755bd234f8e261;
    data.funcs["onPlayerKilled"] = &function_a2045d8caf0f792f;
    data.funcs["onPlayerDisconnect"] = &function_319ba124f0ec457c;
    data.funcs["onCancel"] = &function_afd4bf63773cd7ad;
    data.funcs["onPlayerTearDown"] = &function_83d3732a571f142a;
    data.funcs["onPlayerAssimilated"] = &function_75b53ad947495f9c;
    namespace_76a219af07c28c13::registerTeamAssimilateCallback(&function_3d221e16860007d5);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77c
// Size: 0x11
function function_2fac9b58d42b2920() {
    function_adc3c411e839c811();
    function_89538dc128a24e58();
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x794
// Size: 0x179
function function_adc3c411e839c811() {
    level.var_5dddedbf2bda5311 = spawnstruct();
    level.var_5dddedbf2bda5311.enabled = getdvarint(@"hash_2665e66573a7705c", 1);
    level.var_5dddedbf2bda5311.var_61ab58dc6657120c = getdvarint(@"hash_c7d4297bb4f79596", function_ea591c2a379e3424("hacker_phone"));
    level.var_5dddedbf2bda5311.var_be8a6484aed40352 = getdvarint(@"hash_9eef987db450c17a", 2);
    level.var_5dddedbf2bda5311.var_576a3b6b02998159 = getdvarint(@"hash_c4e08d2fdaab55f3", 75);
    level.var_5dddedbf2bda5311.var_c669e317f1fd1293 = getdvarint(@"hash_23fab88c275bec9f", 20);
    level.var_5dddedbf2bda5311.var_982966060d10f80a = getdvarint(@"hash_3cf195484e92a076", 200);
    level.var_5dddedbf2bda5311.var_88f1bf50c2880f31 = getdvarint(@"hash_630e4b6f3cc13d1e", 0);
    level.var_5dddedbf2bda5311.var_d6b7c0cb8162cd8e = int(level.var_5dddedbf2bda5311.var_982966060d10f80a / level.var_5dddedbf2bda5311.var_c669e317f1fd1293);
    level.var_5dddedbf2bda5311.var_30f17800e8ec227d = getdvarint(@"hash_7152a29b5f75e34d", 1);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x914
// Size: 0x75
function function_89538dc128a24e58() {
    game["dialog"]["hacker_phone_start"] = "hack_grav_msns_01";
    game["dialog"]["hacker_phone_nag"] = "hack_grav_nag1";
    game["dialog"]["hacker_phone_missing"] = "hack_wzan_mrkl";
    game["dialog"]["hacker_phone_timer_expired"] = "hack_grav_tmxp";
    game["dialog"]["hacker_phone_contract_hacked"] = "hack_wzan_cnhc";
    game["dialog"]["hacker_phone_complete"] = "hack_grav_scmh";
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x990
// Size: 0x16
function function_8c64a4f648288a95() {
    return level.var_5dddedbf2bda5311.enabled;
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ae
// Size: 0x1dd
function function_921a0be9ec330c6a() {
    self.category = "hacker_phone";
    teamname = self.teams[0];
    self.var_9f274e85b7bbd87f = 0;
    self.var_cc4cd023f0195d5f = level.var_5dddedbf2bda5311.var_be8a6484aed40352;
    self.payoutValue = function_7fa77e2dbbd62db5(teamname);
    self.var_2655f1229ea3cb33 = [];
    function_8280acd4058f343b(teamname);
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        if (!isdefined(player)) {
            continue;
        }
        player.var_45b8e84de48bb89f = 1;
        player setclientomnvar("ui_br_hacker_phone_state", 2);
    }
    displayteamsplash(teamname, "br_hacker_phone_quest_start_team");
    displaysquadmessagetoteam(teamname, self.var_d154ac2657c5f44, 6, getquestindex("hacker_phone"));
    uiobjectiveshowtoteam("hacker_phone", teamname);
    function_e2aa45e2c6b5dec1(self.var_9f274e85b7bbd87f, level.var_5dddedbf2bda5311.var_be8a6484aed40352);
    time = function_9b6275085fbcb8f4(level.var_5dddedbf2bda5311.var_61ab58dc6657120c);
    function_5a15174d34f0670c(time);
    thread function_6410262eccc0ab66(time);
    createquestobjicon("ui_map_icon_obj_hacker", "current", (0, 0, 0));
    objective_removeallfrommask(self.objectiveiconid);
    thread function_ead4d06481b4437e(self.objectiveiconid, teamname);
    function_7155a66b3081eaca(teamname);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("hacker_phone_start", teamname, 1, 1, undefined);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb92
// Size: 0xac
function function_8280acd4058f343b(teamname) {
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
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc45
// Size: 0xa1
function function_7fa77e2dbbd62db5(teamname) {
    var_6cf4d7026c51235b = level.var_5dddedbf2bda5311.var_576a3b6b02998159;
    if (istrue(level.var_5dddedbf2bda5311.var_88f1bf50c2880f31)) {
        var_926316044e93f849 = getdvar(@"hash_779eac48f0f0fa66", "75 70 65 60");
        var_21e6c4eb825d874d = strtok(var_926316044e93f849, " ");
        teamcount = int(min(namespace_54d20dd0dd79277f::getteamcount(teamname), var_21e6c4eb825d874d.size));
        var_6cf4d7026c51235b = var_21e6c4eb825d874d[teamcount - 1];
    }
    return int(var_6cf4d7026c51235b);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcee
// Size: 0x4d
function function_7155a66b3081eaca(teamname, var_fba0376e0036de8d) {
    var_7ca287a82f54e4f6 = self.var_7ca287a82f54e4f6;
    if (isdefined(var_fba0376e0036de8d)) {
        var_7ca287a82f54e4f6 = var_fba0376e0036de8d;
    }
    var_3d397b9a8d8ccde2 = function_6fc3c13ca7d3708(var_7ca287a82f54e4f6, teamname);
    thread function_d9ba30c978790906(var_3d397b9a8d8ccde2, teamname);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd42
// Size: 0x182
function function_6fc3c13ca7d3708(var_7ca287a82f54e4f6, teamname) {
    var_6d1f29b3b0161959 = self.tablet.origin;
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
    foreach (var_92709bf054b20c5d in level.var_41f4bc9ee8c7c9c6.activetablets) {
        if (!isdefined(var_92709bf054b20c5d) || !isdefined(var_92709bf054b20c5d.origin)) {
            continue;
        }
        var_facf33f7f7ae6bcd[var_facf33f7f7ae6bcd.size] = var_92709bf054b20c5d;
    }
    var_facf33f7f7ae6bcd = sortbydistance(var_facf33f7f7ae6bcd, var_6d1f29b3b0161959);
    var_facf33f7f7ae6bcd = array_remove_array(var_facf33f7f7ae6bcd, self.var_2655f1229ea3cb33);
    if (isdefined(var_facf33f7f7ae6bcd) && var_facf33f7f7ae6bcd.size > 0) {
        var_30a99625b9f5d98c = var_facf33f7f7ae6bcd[0];
        function_68c7ee907c012fad(var_30a99625b9f5d98c);
        return var_30a99625b9f5d98c;
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecb
// Size: 0xd2
function function_d9ba30c978790906(var_4a84dd415b837de9, teamname) {
    level endon("game_ended");
    self endon("task_ended");
    self endon("marked_contract_hacked");
    if (!isdefined(var_4a84dd415b837de9)) {
        return;
    }
    self.var_552c9e74f497621f = 0;
    while (!istrue(function_1c6066d91ae79a56())) {
        var_62787ab10cd11954 = 0;
        if (self.var_552c9e74f497621f >= 70) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("hacker_phone_nag", teamname, 1, 0, undefined);
            var_62787ab10cd11954 = 1;
            self.var_552c9e74f497621f = 0;
        }
        if (!isdefined(var_4a84dd415b837de9) || !array_contains(level.var_41f4bc9ee8c7c9c6.activetablets, var_4a84dd415b837de9)) {
            var_62787ab10cd11954 = 1;
        }
        if (istrue(var_62787ab10cd11954)) {
            var_4a84dd415b837de9 = function_6fc3c13ca7d3708(self.var_7ca287a82f54e4f6, teamname);
        }
        self.var_552c9e74f497621f++;
        wait(1);
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa4
// Size: 0x53
function function_68c7ee907c012fad(var_db376ee90688810d) {
    if (isdefined(self.var_9aa953016facacc) && self.var_9aa953016facacc == var_db376ee90688810d) {
        return;
    }
    movequestobjicon(var_db376ee90688810d.origin + (0, 0, 25));
    self.var_9aa953016facacc = var_db376ee90688810d;
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffe
// Size: 0x78
function function_5d0b1fa9645f3c89(pickupent, var_fba0376e0036de8d) {
    var_fba0376e0036de8d endon("death_or_disconnect");
    if (istrue(function_2fdcb6899db87a0f(pickupent.instance, var_fba0376e0036de8d.team))) {
        var_fba0376e0036de8d namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/HACKER_PHONE_ALREADY_HACKED");
        return;
    }
    if (istrue(level.var_5dddedbf2bda5311.var_30f17800e8ec227d)) {
        var_fba0376e0036de8d namespace_f2c68794a1018c9d::function_9be29ad72a155ee1("intel_pickup_phone_alt", 11);
    }
    function_302cb8661b3c7afa(pickupent, var_fba0376e0036de8d);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107d
// Size: 0x3c
function function_2fdcb6899db87a0f(var_db376ee90688810d, teamname) {
    if (isdefined(var_db376ee90688810d.var_5e3cc2521bd27a30)) {
        if (array_contains(var_db376ee90688810d.var_5e3cc2521bd27a30, teamname)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c1
// Size: 0x5d
function function_247bb9f9abb4c268(var_db376ee90688810d, teamname) {
    if (!isdefined(var_db376ee90688810d.var_5e3cc2521bd27a30)) {
        var_db376ee90688810d.var_5e3cc2521bd27a30 = [];
    }
    var_db376ee90688810d.var_5e3cc2521bd27a30[var_db376ee90688810d.var_5e3cc2521bd27a30.size] = teamname;
    function_34bc4caefcde3120(teamname, var_db376ee90688810d.index);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1125
// Size: 0x6a
function function_b111c1d13e127b6d(var_db376ee90688810d, teamname) {
    if (isdefined(var_db376ee90688810d.var_5e3cc2521bd27a30) && array_contains(var_db376ee90688810d.var_5e3cc2521bd27a30, teamname)) {
        var_db376ee90688810d.var_5e3cc2521bd27a30 = array_remove(var_db376ee90688810d.var_5e3cc2521bd27a30, teamname);
        function_5bbf368bf1a6b402(teamname, var_db376ee90688810d.index);
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1196
// Size: 0x1ee
function function_302cb8661b3c7afa(pickupent, var_fba0376e0036de8d) {
    if (istrue(function_2fdcb6899db87a0f(pickupent.instance, var_fba0376e0036de8d.team))) {
        var_fba0376e0036de8d namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/HACKER_PHONE_ALREADY_HACKED");
        return;
    }
    task = namespace_1eb3c4e0e28fac71::function_22239d4cff05d0a1(var_fba0376e0036de8d.team);
    if (!isdefined(task)) {
        return;
    }
    task function_247bb9f9abb4c268(pickupent.instance, var_fba0376e0036de8d.team);
    task.var_2655f1229ea3cb33[task.var_2655f1229ea3cb33.size] = pickupent.instance;
    task.var_9f274e85b7bbd87f++;
    task.var_cc4cd023f0195d5f = level.var_5dddedbf2bda5311.var_be8a6484aed40352 - task.var_9f274e85b7bbd87f;
    task function_e2aa45e2c6b5dec1(task.var_9f274e85b7bbd87f, level.var_5dddedbf2bda5311.var_be8a6484aed40352);
    function_4f6916c4e48cc55(pickupent.instance, var_fba0376e0036de8d);
    if (task.var_9aa953016facacc == pickupent.instance) {
        task notify("marked_contract_hacked");
        task function_7155a66b3081eaca(var_fba0376e0036de8d.team, var_fba0376e0036de8d);
    }
    task.var_552c9e74f497621f = 0;
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(var_fba0376e0036de8d.team, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_f085eaf302a7e140");
    }
    if (istrue(task function_1c6066d91ae79a56())) {
        task function_aa30a0b07502a038(1, "Win");
        goto LOC_000001ec;
    }
LOC_000001ec:
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138b
// Size: 0x37
function function_6410262eccc0ab66(time) {
    self endon("task_ended");
    level endon("game_ended");
    thread function_fc63c9695ed174c();
    wait(time);
    function_cd0f560fad2e9cb6("br_hacker_phone_quest_timer_expired", undefined, undefined, "Time");
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c9
// Size: 0x7e
function function_fc63c9695ed174c() {
    self endon("task_ended");
    level endon("game_ended");
    var_2773522dfbc4d477 = level.var_41f4bc9ee8c7c9c6.activetablets;
    while (var_2773522dfbc4d477.size >= self.var_cc4cd023f0195d5f) {
        var_2773522dfbc4d477 = level.var_41f4bc9ee8c7c9c6.activetablets;
        var_2773522dfbc4d477 = array_remove_array(var_2773522dfbc4d477, self.var_2655f1229ea3cb33);
        wait(1);
    }
    function_cd0f560fad2e9cb6("br_hacker_phone_quest_failure", undefined, undefined, "Circle");
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144e
// Size: 0x1e
function function_ca07a6ca5c3c8af5(player) {
    if (function_42a0806457ea8039(player)) {
        hidequestobjiconfromplayer(player);
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1473
// Size: 0x1e
function function_f6755bd234f8e261(player) {
    if (function_42a0806457ea8039(player)) {
        showquestobjicontoplayer(player);
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1498
// Size: 0x1c
function function_a2045d8caf0f792f(attacker, victim) {
    function_f59b4b0550d4e1e9(victim);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14bb
// Size: 0x14
function function_319ba124f0ec457c(player) {
    function_f59b4b0550d4e1e9(player);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d6
// Size: 0x5c
function function_f59b4b0550d4e1e9(player) {
    if (player.team == self.teams[0]) {
        if (!namespace_4bc0ead8d2af3d84::isteamvalid(self.teams[0], level.var_41f4bc9ee8c7c9c6.defaultfilter)) {
            function_cd0f560fad2e9cb6(undefined, undefined, undefined, "Killed");
        }
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1539
// Size: 0x2c
function function_afd4bf63773cd7ad(team) {
    if (istrue(self.teams[0] == team)) {
        function_cd0f560fad2e9cb6(undefined, undefined, undefined, "Cancel");
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156c
// Size: 0x7c
function function_cd0f560fad2e9cb6(var_f7b6cc6c062a7a43, var_a7b676aca5b263c2, delayoverride, var_4048d341197bbe4b) {
    if (isdefined(var_f7b6cc6c062a7a43)) {
        displayteamsplash(self.teams[0], var_f7b6cc6c062a7a43);
    }
    delay = 0;
    if (isdefined(delayoverride)) {
        delay = delayoverride;
    }
    if (isdefined(var_a7b676aca5b263c2)) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam(var_a7b676aca5b263c2, self.teams[0], 1, delay, undefined);
    }
    thread function_aa30a0b07502a038(0, var_4048d341197bbe4b);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ef
// Size: 0x27
function function_1c6066d91ae79a56() {
    if (self.var_9f274e85b7bbd87f >= level.var_5dddedbf2bda5311.var_be8a6484aed40352) {
        return 1;
    }
    return 0;
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161e
// Size: 0x69
function function_aa30a0b07502a038(success, var_4048d341197bbe4b) {
    level endon("game_ended");
    self notify("task_ended");
    wait(1);
    teamname = self.teams[0];
    function_4b223b8df93235aa(teamname);
    function_93663fe58d95f174(ter_op(istrue(success), teamname, undefined), undefined, undefined, var_4048d341197bbe4b);
    if (istrue(success)) {
        thread function_4fee9a98dfed4a76(teamname);
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168e
// Size: 0xe5
function function_4b223b8df93235aa(teamname) {
    deletequestobjicon();
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        if (isdefined(player)) {
            player.var_45b8e84de48bb89f = undefined;
            player setclientomnvar("ui_br_hacker_phone_state", 0);
        }
    }
    foreach (var_17953215dd7c5f9b in self.var_2655f1229ea3cb33) {
        function_b111c1d13e127b6d(var_17953215dd7c5f9b, teamname);
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x177a
// Size: 0xf7
function function_4fee9a98dfed4a76(teamname) {
    level endon("game_ended");
    params = spawnstruct();
    params.intvar = level.var_5dddedbf2bda5311.var_d6b7c0cb8162cd8e;
    displayteamsplash(teamname, "br_hacker_phone_quest_complete", params);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("hacker_phone_complete", teamname, 1, 1.5, undefined);
    function_196e12780ecc8e3b(teamname);
    if (!function_aaa32ae55c133b06(teamname)) {
        wait(4);
    }
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        if (!isdefined(player)) {
            continue;
        }
        player.var_6c8912ea30b21003 = 1;
    }
    thread function_305219f2cd4252ce(teamname);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1878
// Size: 0x1f
function function_aaa32ae55c133b06(teamname) {
    return level.teamdata[teamname]["hackerPhonePaymentCountActive"] > 0;
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189f
// Size: 0x83
function function_305219f2cd4252ce(teamname) {
    lootid = level.br_pickups.var_7b2bff2d04ee1017["brloot_payment_hacker_phone"];
    level.teamdata[teamname]["hackerPhonePaymentCountActive"]++;
    level.teamdata[teamname]["hackerPhonePaymentsRemaining"] = level.var_5dddedbf2bda5311.var_d6b7c0cb8162cd8e;
    function_bdcfa4ac81dc3472(teamname, lootid);
    thread function_40f8341d00ee8be6(teamname, lootid);
    thread function_d1fe6ac87f940bfb(teamname);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1929
// Size: 0x67
function function_d1fe6ac87f940bfb(teamname) {
    level endon("game_ended");
    wait(0.05);
    for (var_327efeb48a68a152 = level.teamdata[teamname]["hackerPhonePaymentsRemaining"]; var_327efeb48a68a152 > 0; var_327efeb48a68a152--) {
        wait(level.var_5dddedbf2bda5311.var_c669e317f1fd1293);
    }
    level.teamdata[teamname]["hackerPhonePaymentCountActive"]--;
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1997
// Size: 0x6d
function function_40f8341d00ee8be6(teamname, lootid) {
    level notify("monitor_payout_" + teamname);
    level endon("monitor_payout_" + teamname);
    level endon("game_ended");
    thread function_ac7aaafed966dcff(teamname);
    while (level.teamdata[teamname]["hackerPhonePaymentsRemaining"] > 0) {
        wait(level.var_5dddedbf2bda5311.var_c669e317f1fd1293);
        function_bdcfa4ac81dc3472(teamname, lootid);
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0b
// Size: 0x158
function function_bdcfa4ac81dc3472(teamname, lootid) {
    if (level.teamdata[teamname]["hackerPhonePaymentsRemaining"] > 0) {
        level.teamdata[teamname]["hackerPhonePaymentsRemaining"]--;
    }
    payoutValue = function_97ff781643ef7daf(teamname);
    var_ec2736524e4a7410 = namespace_54d20dd0dd79277f::getteamdata(teamname, "alivePlayers");
    foreach (player in var_ec2736524e4a7410) {
        if (isdefined(player) && payoutValue > 0 && istrue(player.var_6c8912ea30b21003) && !player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            player namespace_c6ccccd95254983f::playerplunderpickup(payoutValue);
            if (isdefined(lootid)) {
                view_origin = player getvieworigin();
                player setclientomnvar("ui_br_hacker_phone_remaining_payments", level.teamdata[teamname]["hackerPhonePaymentsRemaining"]);
                player namespace_cb965d2f71fefddc::function_37be6e543436f3b3(lootid, view_origin, 1, payoutValue);
            }
            if (isdefined(player.var_a4dd02e65175e1e7)) {
                player.var_a4dd02e65175e1e7["totalPayout"] = player.var_a4dd02e65175e1e7["totalPayout"] + payoutValue * 10;
            }
        }
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6a
// Size: 0x1a8
function function_ac7aaafed966dcff(teamname) {
    level endon("monitor_payout_" + teamname);
    level endon("game_ended");
    var_359f2cd3b12bb4cb = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    for (var_327efeb48a68a152 = level.teamdata[teamname]["hackerPhonePaymentsRemaining"]; var_327efeb48a68a152 > 0; var_327efeb48a68a152--) {
        if (var_327efeb48a68a152 == 3) {
            foreach (player in var_359f2cd3b12bb4cb) {
                if (isdefined(player) && player.team == teamname) {
                    displayplayersplash(player, "br_hacker_phone_quest_payment_expiring");
                }
            }
        }
        wait(level.var_5dddedbf2bda5311.var_c669e317f1fd1293);
    }
    function_19f022d240a597b9(teamname, 0);
    foreach (player in var_359f2cd3b12bb4cb) {
        if (isdefined(player) && player.team == teamname) {
            displayplayersplash(player, "br_hacker_phone_quest_payment_expired");
        }
    }
    wait(0.05);
    foreach (player in var_359f2cd3b12bb4cb) {
        if (isdefined(player)) {
            player.var_6c8912ea30b21003 = undefined;
        }
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d19
// Size: 0x27
function function_97ff781643ef7daf(teamname) {
    return level.teamdata[teamname]["hackerPhonePaymentCountActive"] * self.payoutValue;
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d48
// Size: 0x112
function function_34bc4caefcde3120(teamname, var_c9b0e78500221992) {
    var_c568c261258fb4e0 = level.teamdata[teamname]["hackedContractsData1"].size + level.teamdata[teamname]["hackedContractsData2"].size;
    /#
        assertex(var_c568c261258fb4e0 <= level.var_5dddedbf2bda5311.var_be8a6484aed40352, "Too much hacked phones, can't send all this data");
    #/
    if (level.teamdata[teamname]["hackedContractsData1"].size < 2) {
        level.teamdata[teamname]["hackedContractsData1"] = array_add(level.teamdata[teamname]["hackedContractsData1"], var_c9b0e78500221992);
        function_fa76fc991ff22cdb(teamname, level.teamdata[teamname]["hackedContractsData1"], "ui_br_hacked_phones_data1");
    } else {
        level.teamdata[teamname]["hackedContractsData2"] = array_add(level.teamdata[teamname]["hackedContractsData2"], var_c9b0e78500221992);
        function_fa76fc991ff22cdb(teamname, level.teamdata[teamname]["hackedContractsData2"], "ui_br_hacked_phones_data2");
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e61
// Size: 0xdd
function function_5bbf368bf1a6b402(teamname, var_c9b0e78500221992) {
    if (array_contains(level.teamdata[teamname]["hackedContractsData1"], var_c9b0e78500221992)) {
        level.teamdata[teamname]["hackedContractsData1"] = array_remove(level.teamdata[teamname]["hackedContractsData1"], var_c9b0e78500221992);
        function_fa76fc991ff22cdb(teamname, level.teamdata[teamname]["hackedContractsData1"], "ui_br_hacked_phones_data1");
    } else if (array_contains(level.teamdata[teamname]["hackedContractsData2"], var_c9b0e78500221992)) {
        level.teamdata[teamname]["hackedContractsData2"] = array_remove(level.teamdata[teamname]["hackedContractsData2"], var_c9b0e78500221992);
        function_fa76fc991ff22cdb(teamname, level.teamdata[teamname]["hackedContractsData2"], "ui_br_hacked_phones_data2");
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f45
// Size: 0x93
function function_a3fcfe7472f9c5db(player, teamname) {
    if (isdefined(level.teamdata[teamname]["hackedContractsData1"])) {
        var_81dab8953b9df82 = function_4f0fae2ece09d000(level.teamdata[teamname]["hackedContractsData1"]);
        player setclientomnvar("ui_br_hacked_phones_data1", var_81dab8953b9df82);
    }
    if (isdefined(level.teamdata[teamname]["hackedContractsData2"])) {
        var_81dab8953b9df82 = function_4f0fae2ece09d000(level.teamdata[teamname]["hackedContractsData2"]);
        player setclientomnvar("ui_br_hacked_phones_data2", var_81dab8953b9df82);
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fdf
// Size: 0xfb
function function_196e12780ecc8e3b(teamname) {
    self.dlogdata = [];
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        if (isdefined(player)) {
            function_8cf0f4e99dcf177b(player, 0, 0, 1);
            player.var_a4dd02e65175e1e7 = [];
            player.var_a4dd02e65175e1e7["tabletIndex"] = self.tablet.index;
            player.var_a4dd02e65175e1e7["totalPayout"] = 0;
            player.var_a4dd02e65175e1e7["payoutValue"] = self.payoutValue * 10;
            namespace_f1d40c362677777e::registerondisconnecteventcallback(&function_a3a8454199eae9cb);
        }
    }
    thread function_c5110ae0cad07145(teamname);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e1
// Size: 0x83
function function_19f022d240a597b9(teamname, var_d1c192f65678cca7) {
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    foreach (player in var_e2b2bbd9e6539f11) {
        function_8cf0f4e99dcf177b(player, var_d1c192f65678cca7, 0, 0);
    }
    self notify("hackerPhoneDlogSent");
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x216b
// Size: 0xd6
function function_8cf0f4e99dcf177b(player, var_d1c192f65678cca7, var_f8b7fd6747ad8f77, var_1f5b8c9203a2f046) {
    if (isdefined(player) & isarray(player.var_a4dd02e65175e1e7)) {
        player dlog_recordplayerevent("dlog_event_contract_hacker_phone_payment_phase_completion", [0:"tablet_index", 1:player.var_a4dd02e65175e1e7["tabletIndex"], 2:"total_payout_value", 3:player.var_a4dd02e65175e1e7["totalPayout"], 4:"cash_per_payout", 5:player.var_a4dd02e65175e1e7["payoutValue"], 6:"stopped_by_match_end", 7:var_d1c192f65678cca7, 8:"stopped_by_disconnect", 9:var_f8b7fd6747ad8f77, 10:"payout_extended", 11:var_1f5b8c9203a2f046]);
        player.var_a4dd02e65175e1e7 = undefined;
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2248
// Size: 0x18
function function_a3a8454199eae9cb(player) {
    function_8cf0f4e99dcf177b(player, 0, 1, 0);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2267
// Size: 0x25
function function_c5110ae0cad07145(teamname) {
    self endon("hackerPhoneDlogSent");
    level waittill("game_ended");
    function_19f022d240a597b9(teamname, 1);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2293
// Size: 0x95
function function_fa76fc991ff22cdb(teamname, var_b4a6c7c6c1ec8a4d, var_939613b9f38207b0) {
    var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
    var_81dab8953b9df82 = function_4f0fae2ece09d000(var_b4a6c7c6c1ec8a4d);
    foreach (player in var_e2b2bbd9e6539f11) {
        player setclientomnvar(var_939613b9f38207b0, var_81dab8953b9df82);
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232f
// Size: 0x3e
function function_4f0fae2ece09d000(var_b4a6c7c6c1ec8a4d) {
    var_81dab8953b9df82 = 0;
    for (i = 0; i < var_b4a6c7c6c1ec8a4d.size; i++) {
        var_81dab8953b9df82 = var_81dab8953b9df82 + (var_b4a6c7c6c1ec8a4d[i] << i * 16);
    }
    return var_81dab8953b9df82;
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2375
// Size: 0x8d
function function_4f6916c4e48cc55(var_30a99625b9f5d98c, player) {
    if (function_2fdcb6899db87a0f(var_30a99625b9f5d98c, player.team)) {
        player setclientomnvar("ui_br_hacker_phone_state", 1);
    } else if (istrue(player.var_45b8e84de48bb89f)) {
        player setclientomnvar("ui_br_hacker_phone_state", 2);
    } else {
        player setclientomnvar("ui_br_hacker_phone_state", 0);
        if (var_30a99625b9f5d98c.tablettype.ref == "hacker_phone") {
            player function_7a1a95a9782f2d03();
        }
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2409
// Size: 0x4a
function function_7a1a95a9782f2d03() {
    var_6cf4d7026c51235b = function_7fa77e2dbbd62db5(self.team);
    var_94fdf3291d472947 = var_6cf4d7026c51235b * level.var_5dddedbf2bda5311.var_d6b7c0cb8162cd8e;
    self setclientomnvar("ui_br_hacker_phone_potential_cash_value", var_94fdf3291d472947);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245a
// Size: 0x3f
function function_3d221e16860007d5(var_fe7bd20e5b3df7d2, oldteam, newteam) {
    if (istrue(var_fe7bd20e5b3df7d2.var_6c8912ea30b21003)) {
        var_fe7bd20e5b3df7d2.var_6c8912ea30b21003 = undefined;
        thread function_7481b64fddcb07ca(var_fe7bd20e5b3df7d2);
    }
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a0
// Size: 0x2a
function function_7481b64fddcb07ca(player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    wait(1);
    displayplayersplash(player, "br_hacker_phone_quest_payment_expired");
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d1
// Size: 0x6b
function function_83d3732a571f142a(player, oldteam, newteam) {
    player.var_45b8e84de48bb89f = undefined;
    player.var_6c8912ea30b21003 = undefined;
    player setclientomnvar("ui_br_hacker_phone_state", 0);
    if (function_42a0806457ea8039(player)) {
        hidequestobjiconfromplayer(player);
    }
    player setclientomnvar("ui_br_hacked_phones_data1", 0);
    player setclientomnvar("ui_br_hacked_phones_data2", 0);
}

// Namespace namespace_46a48466a348d5e2/namespace_735f8af4d2aa34fb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2543
// Size: 0xa3
function function_75b53ad947495f9c(player, oldteam, newteam) {
    if (function_42a0806457ea8039(player)) {
        player.var_45b8e84de48bb89f = 1;
        player uiobjectiveshow("hacker_phone");
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
        player setclientomnvar("ui_br_hacker_phone_state", 2);
        player namespace_1eb3c4e0e28fac71::uiobjectivesetparameter(self.var_9f274e85b7bbd87f, level.var_5dddedbf2bda5311.var_be8a6484aed40352);
        showquestobjicontoplayer(player);
        function_a3fcfe7472f9c5db(player, player.team);
    }
}

