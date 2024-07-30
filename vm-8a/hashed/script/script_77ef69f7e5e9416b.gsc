#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\utility\teams.gsc;
#using script_25c7a5935190c3f0;
#using scripts\common\devgui.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_lootchopper.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using script_728ffcee8cbf30ee;
#using scripts\mp\dev.gsc;

#namespace namespace_a42d57d98410ffa8;

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x3af
// Size: 0x18
function autoexec main() {
    utility::registersharedfunc("elite_chopper", "get_contract_data", &getcontractdata);
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cf
// Size: 0x85
function getcontractdata(data) {
    quest_init();
    data.funcs["onInit"] = &function_e05bdb2a6122fe4a;
    data.funcs["onTeamAssigned"] = &function_89e3fc49199d2019;
    data.funcs["onCancel"] = &task_oncancel;
    data.funcs["onPlayerTearDown"] = &function_30ff47cffe7fca99;
    data.funcs["onPlayerAssimilated"] = &function_e16cc4efa3a21aad;
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45c
// Size: 0x21
function quest_init() {
    function_adc3c411e839c811();
    function_63ede2e37ad0a069();
    function_89538dc128a24e58();
    /#
        function_5dee7155086e9ada();
    #/
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x485
// Size: 0xa0
function function_adc3c411e839c811() {
    level.var_a42d57d98410ffa8 = spawnstruct();
    level.var_a42d57d98410ffa8.enabled = getdvarint(@"hash_c328e9c6d2fbc848", 1);
    level.var_a42d57d98410ffa8.time = getdvarint(@"hash_a6da41eda5e7570a", 240);
    level.var_a42d57d98410ffa8.chopperhealth = getdvarint(@"hash_cbe277634708ac85", 3000);
    level.var_a42d57d98410ffa8.splashenabled = getdvarint(@"hash_65f03a19129db21a", 0);
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52d
// Size: 0x2a
function function_63ede2e37ad0a069() {
    namespace_7921f301da16c1ba::init();
    level.var_a83a4e71446bfef7 = 1;
    registersharedfunc("br_elitechopper", "eliteChopper_onCrateUse", &function_a1ea17b3a2931b82);
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55f
// Size: 0x4f
function function_89538dc128a24e58() {
    assert(isdefined(game["<dev string:x1c>"]));
    game["dialog"]["mission_elite_chopper_heli_arrive"] = "cqsh_grav_c2st";
    game["dialog"]["mission_elite_chopper_heli_destroy"] = "cqsh_grav_c2cl";
    game["dialog"]["mission_elite_chopper_heli_depart"] = "srcs_grav_sshp";
}

/#

    // Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5b6
    // Size: 0x70
    function function_5dee7155086e9ada() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x23>");
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x42>", "<dev string:x5a>", &function_1c35bcf919ecbf37);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x6e>", "<dev string:x7d>", &function_3f460c87ff0d374);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x91>", "<dev string:x9e>", &function_d9f3e7f2b05c8ed9);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:xb3>", "<dev string:xbf>", &function_5c2f254d18707855);
        scripts\common\devgui::function_fe953f000498048f();
    }

#/

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e
// Size: 0x47
function function_8d032f436b816d9d(success) {
    self notify("task_ended");
    self.ended = 1;
    thread function_8af2a0d1c41847e3();
    wait 1;
    endcontract(ter_op(istrue(success), self.teams[0], undefined));
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67d
// Size: 0x1c
function function_e05bdb2a6122fe4a() {
    if (!level.var_a42d57d98410ffa8.enabled) {
        return false;
    }
    return true;
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a2
// Size: 0x35
function function_89e3fc49199d2019() {
    self.category = "elite_chopper";
    teamname = self.teams[0];
    function_c28cf680f4d0d4dc(teamname);
    function_b76f3380abd30d8e();
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6df
// Size: 0x6c
function function_30ff47cffe7fca99(player, oldteam, newteam) {
    if (oldteam == self.teams[0]) {
        if (!scripts\mp\gametypes\br_quest_util::isteamvalid(oldteam, level.contractmanager.defaultfilter)) {
            thread task_oncancel(oldteam);
            return;
        }
        player uiobjectivehide();
        objective_removeclientfrommask(self.objectiveiconid, player);
    }
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x753
// Size: 0x6b
function function_e16cc4efa3a21aad(player, oldteam, newteam) {
    if (!isdefined(self.vehicle)) {
        return;
    }
    if (newteam == self.teams[0]) {
        objective_addclienttomask(self.objectiveiconid, player);
        player uiobjectiveshow("elite_chopper");
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c6
// Size: 0x25
function task_oncancel(team) {
    if (istrue(self.teams[0] == team)) {
        thread function_8d032f436b816d9d(0);
    }
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f3
// Size: 0x78
function function_c28cf680f4d0d4dc(team) {
    uiobjectiveshowtoteam("elite_chopper", team);
    if (level.var_a42d57d98410ffa8.splashenabled) {
        displayteamsplash(team, "br_elite_chopper_start");
    }
    displaysquadmessagetoteam(team, self.var_d154ac2657c5f44, 6, getquestindex("elite_chopper"));
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_elite_chopper_heli_arrive", self.teams[0], undefined, 2);
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x873
// Size: 0x1d
function function_b76f3380abd30d8e() {
    chopper = function_e2674314764bdf3();
    self.chopper = chopper;
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x898
// Size: 0x22c
function function_e2674314764bdf3() {
    circlecenter = undefined;
    circleradius = undefined;
    if (isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent)) {
        circlecenter = scripts\mp\gametypes\br_circle::getnextsafecircleorigin();
        circleradius = scripts\mp\gametypes\br_circle::getnextsafecircleradius();
    }
    circleinfo = scripts\mp\gametypes\br_lootchopper::lootchopper_initcircleinfo(circlecenter, circleradius);
    spawnzones = function_a74aae7b461714e1(circleinfo);
    var_35039a9883ab69d2 = getdvarint(@"hash_ca56ccb8d0de7869", 8000);
    patrolzone = spawnzones[randomint(spawnzones.size)];
    newChopper = scripts\mp\gametypes\br_lootchopper::lootchopper_spawn(patrolzone, "veh9_mil_air_heli_hind_nophysics_br", "veh9_mil_air_heli_hind_nuke_weapons", "chopper_support_turret_elite");
    if (isdefined(newChopper)) {
        newChopper.lootfunc = &task_dropcrate;
        newChopper.gettargetfunc = &function_915ba9b028110d40;
        newChopper.health = level.var_a42d57d98410ffa8.chopperhealth;
        newChopper.maxhealth = level.var_a42d57d98410ffa8.chopperhealth;
        scripts\mp\objidpoolmanager::update_objective_icon(newChopper.objectiveiconid, "ui_mp_br_mapmenu_icon_elite_chopper");
        scripts\mp\objidpoolmanager::function_2946e9eb07acb3f1(newChopper.objectiveiconid, %VEHICLES/NUCLEAR_CHOPPER);
        scripts\mp\objidpoolmanager::update_objective_setbackground(newChopper.objectiveiconid, 1);
        scripts\mp\objidpoolmanager::function_846c2acd91309cd8(newChopper.objectiveiconid, 246, 192, 72);
        newChopper.scriptedobjid = newChopper.objectiveiconid;
        newChopper function_1cd1ee312fd03bb4(1);
        thread function_b012a5a56983477(newChopper);
        thread function_8b0afc16e14eaa13(newChopper);
        newChopper.task = self;
        self.chopper = newChopper;
        return;
    }
    logstring("br_elite_chopper_quest::task_spawnChopper - no chopper was spawned!");
    if (getdvarint(@"hash_3e40b4675d05b5b1", 1)) {
        cratestruct = spawnstruct();
        cratestruct.origin = (circlecenter[0], circlecenter[1], 10000);
        cratestruct.task = self;
        cratestruct task_dropcrate();
    }
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacc
// Size: 0xf8
function function_a74aae7b461714e1(circleinfo) {
    var_8bc6e10ea09fe64 = [];
    var_a43491919a0d6a88 = scripts\mp\gametypes\br_lootchopper::lootchopper_getspawnlocations(circleinfo);
    if (var_a43491919a0d6a88.size == 0) {
        chopperspawn = spawnstruct();
        chopperspawn.origin = circleinfo.origin;
        var_a43491919a0d6a88[0] = chopperspawn;
    }
    foreach (spawnzone in var_a43491919a0d6a88) {
        spawnzone.origin *= (1, 1, 0);
        spawnzone.origin = scripts\mp\gametypes\br::getoffsetspawnoriginmultitrace(spawnzone.origin, (0, 0, 10000));
        var_8bc6e10ea09fe64[var_8bc6e10ea09fe64.size] = spawnzone;
    }
    return var_8bc6e10ea09fe64;
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbcd
// Size: 0xd4
function function_915ba9b028110d40() {
    targets = [];
    foreach (info in level.arrow.teaminfo) {
        players = scripts\mp\utility\teams::getteamdata(info.targetteam, "players");
        foreach (player in players) {
            targets[targets.size] = player;
        }
    }
    return targets;
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcaa
// Size: 0x5a
function task_dropcrate() {
    droplocation = scripts\mp\gametypes\br_lootchopper::lootchopper_finddroplocation(self.origin + (0, 0, 500));
    crate = scripts\cp_mp\killstreaks\airdrop::function_4671cbee65d1615d(self.origin, droplocation);
    crate.task = self.task;
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0c
// Size: 0x127
function function_a1ea17b3a2931b82(player) {
    task = self.task;
    task notify("task_ended");
    task endcontract(task.teams[0]);
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    dropinfo = spawnstruct();
    dropinfo.origin = self.origin + (0, 0, 10);
    dropinfo.angles = self.angles;
    dropinfo.itemsdropped = 0;
    items = getscriptcachecontents("br_elite_chopper_crate");
    if (isdefined(items)) {
        pickupents = dropinfo scripts\mp\gametypes\br_lootcache::lootspawnitemlist(dropstruct, items, 0, player);
    }
    team = self.task.teams[0];
    element = namespace_6c622b52017c6808::function_f517a8eefb0eb61a(team);
    namespace_6c622b52017c6808::function_cc25131864fa213c(team, dropinfo.origin, dropinfo.angles, element, dropstruct);
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3b
// Size: 0x84
function function_b012a5a56983477(newChopper) {
    level endon("game_ended");
    self endon("task_ended");
    newChopper waittill("death");
    if (level.var_a42d57d98410ffa8.splashenabled) {
        displayteamsplash(self.teams[0], "br_elite_chopper_end");
    }
    uiobjectiveshowtoteam("elite_chopper_loot", self.teams[0]);
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_elite_chopper_heli_destroy", self.teams[0], undefined, 8.5);
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec7
// Size: 0x2a
function function_8b0afc16e14eaa13(newChopper) {
    level endon("game_ended");
    self endon("task_ended");
    newChopper waittill("leaving");
    thread function_8d032f436b816d9d(0);
}

// Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef9
// Size: 0x47
function function_8af2a0d1c41847e3() {
    if (checkforactiveobjicon()) {
        deletequestobjicon();
        self.objectiveiconid = undefined;
    }
    if (isdefined(self.chopper)) {
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_elite_chopper_heli_depart", self.teams[0], 1, 2, undefined);
    }
}

/#

    // Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf48
    // Size: 0xc
    function function_d9f3e7f2b05c8ed9() {
        function_e2674314764bdf3();
    }

    // Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf5c
    // Size: 0x49c
    function function_5c2f254d18707855() {
        cratestruct = spawnstruct();
        cratestruct.origin = (level.player.origin[0], level.player.origin[1], 10000);
        cratestruct.task = spawnstruct();
        cratestruct.task.iselite = 1;
        cratestruct.task.type = spawnstruct();
        cratestruct.task.type.ref = "<dev string:xd0>";
        cratestruct.task.type.index = 0;
        cratestruct.task.teams[0] = level.player.team;
        level.contractmanager.var_b6fae9c9655c73bf[level.player.team] = 1;
        level.var_81e77c935dfefd11.teaminstances[level.player.team] = spawnstruct();
        level.var_81e77c935dfefd11.teaminstances[level.player.team].index = 2;
        level.var_81e77c935dfefd11.teaminstances[level.player.team].startertask = spawnstruct();
        level.var_81e77c935dfefd11.teaminstances[level.player.team].len = 3;
        level.var_81e77c935dfefd11.teaminstances[level.player.team].ref = "<dev string:xde>";
        level.arrow.teaminfo[level.player.team] = spawnstruct();
        level.arrow.teaminfo[level.player.team].targetteam = level.player.team;
        level.arrow.teaminfo[level.player.team].state = 2;
        level.arrow.teaminfo[level.player.team].firstpickups = 0;
        level.arrow.teaminfo[level.player.team].var_876be3bc4df3a81d = 0;
        level.arrow.teaminfo[level.player.team].var_8dfd9e71543b605b["<dev string:xe4>"] = 0;
        level.arrow.teaminfo[level.player.team].var_8dfd9e71543b605b["<dev string:xe8>"] = 0;
        level.arrow.teaminfo[level.player.team].var_8dfd9e71543b605b["<dev string:xec>"] = 0;
        level.arrow.teaminfo[level.player.team].var_8dfd9e71543b605b["<dev string:xf0>"] = 0;
        level.arrow.teaminfo[level.player.team].var_8dfd9e71543b605b["<dev string:xf4>"] = 0;
        level.arrow.teaminfo[level.player.team].var_8dfd9e71543b605b["<dev string:xf8>"] = 0;
        cratestruct task_dropcrate();
    }

    // Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1400
    // Size: 0x94
    function function_1c35bcf919ecbf37() {
        host = scripts\mp\dev::devfindhost();
        println("<dev string:xfc>");
        println("<dev string:x11d>");
        println("<dev string:x13a>" + level.var_a42d57d98410ffa8.enabled);
        println("<dev string:x15a>" + level.var_a42d57d98410ffa8.time);
        println("<dev string:x17a>" + level.var_a42d57d98410ffa8.chopperhealth);
        println("<dev string:xfc>");
    }

    // Namespace namespace_a42d57d98410ffa8 / namespace_448d4e1fafe9b52f
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x149c
    // Size: 0x16
    function function_3f460c87ff0d374() {
        setdvar(@"hash_fbd8d42235a256d6", 1);
    }

#/
