// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\utility\teams.gsc;
#using script_25c7a5935190c3f0;
#using script_38eb8f4be20d54f4;
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

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x3af
// Size: 0x19
function autoexec main() {
    utility::registersharedfunc("elite_chopper", "get_contract_data", &function_fb7271d5ee18b98d);
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cf
// Size: 0x86
function function_fb7271d5ee18b98d(data) {
    function_30a591676d601c38();
    data.funcs["onInit"] = &function_e05bdb2a6122fe4a;
    data.funcs["onTeamAssigned"] = &function_89e3fc49199d2019;
    data.funcs["onCancel"] = &function_4448ccf5aaafbcd2;
    data.funcs["onPlayerTearDown"] = &function_30ff47cffe7fca99;
    data.funcs["onPlayerAssimilated"] = &function_e16cc4efa3a21aad;
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45c
// Size: 0x22
function function_30a591676d601c38() {
    function_adc3c411e839c811();
    function_63ede2e37ad0a069();
    function_89538dc128a24e58();
    /#
        function_5dee7155086e9ada();
    #/
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x485
// Size: 0xa1
function function_adc3c411e839c811() {
    level.var_a42d57d98410ffa8 = spawnstruct();
    level.var_a42d57d98410ffa8.enabled = getdvarint(@"hash_c328e9c6d2fbc848", 1);
    level.var_a42d57d98410ffa8.time = getdvarint(@"hash_a6da41eda5e7570a", 240);
    level.var_a42d57d98410ffa8.var_b728e1ff992a323a = getdvarint(@"hash_cbe277634708ac85", 3000);
    level.var_a42d57d98410ffa8.var_2dcb144daab3c487 = getdvarint(@"hash_65f03a19129db21a", 0);
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52d
// Size: 0x2b
function function_63ede2e37ad0a069() {
    namespace_7921f301da16c1ba::init();
    level.var_a83a4e71446bfef7 = 1;
    registersharedfunc("br_elitechopper", "eliteChopper_onCrateUse", &function_a1ea17b3a2931b82);
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55f
// Size: 0x50
function function_89538dc128a24e58() {
    /#
        /#
            assert(isdefined(game["death"]));
        #/
    #/
    game["dialog"]["mission_elite_chopper_heli_arrive"] = "cqsh_grav_c2st";
    game["dialog"]["mission_elite_chopper_heli_destroy"] = "cqsh_grav_c2cl";
    game["dialog"]["mission_elite_chopper_heli_depart"] = "srcs_grav_sshp";
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b6
// Size: 0x71
function function_5dee7155086e9ada() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_1c35bcf919ecbf37);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_3f460c87ff0d374);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_d9f3e7f2b05c8ed9);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_5c2f254d18707855);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e
// Size: 0x48
function function_8d032f436b816d9d(success) {
    self notify("task_ended");
    self.ended = 1;
    thread function_8af2a0d1c41847e3();
    wait(1);
    function_93663fe58d95f174(ter_op(istrue(success), self.teams[0], undefined));
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67d
// Size: 0x1d
function function_e05bdb2a6122fe4a() {
    if (!level.var_a42d57d98410ffa8.enabled) {
        return 0;
    }
    return 1;
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a2
// Size: 0x36
function function_89e3fc49199d2019() {
    self.category = "elite_chopper";
    teamname = self.teams[0];
    function_c28cf680f4d0d4dc(teamname);
    function_b76f3380abd30d8e();
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6df
// Size: 0x6d
function function_30ff47cffe7fca99(player, oldteam, newteam) {
    if (oldteam == self.teams[0]) {
        if (!namespace_4bc0ead8d2af3d84::isteamvalid(oldteam, level.var_41f4bc9ee8c7c9c6.defaultfilter)) {
            thread function_4448ccf5aaafbcd2(oldteam);
        } else {
            player uiobjectivehide();
            objective_removeclientfrommask(self.objectiveiconid, player);
        }
    }
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x753
// Size: 0x6c
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

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c6
// Size: 0x26
function function_4448ccf5aaafbcd2(team) {
    if (istrue(self.teams[0] == team)) {
        thread function_8d032f436b816d9d(0);
    }
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f3
// Size: 0x79
function function_c28cf680f4d0d4dc(team) {
    uiobjectiveshowtoteam("elite_chopper", team);
    if (level.var_a42d57d98410ffa8.var_2dcb144daab3c487) {
        displayteamsplash(team, "br_elite_chopper_start");
    }
    displaysquadmessagetoteam(team, self.var_d154ac2657c5f44, 6, getquestindex("elite_chopper"));
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_elite_chopper_heli_arrive", self.teams[0], undefined, 2);
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x873
// Size: 0x1e
function function_b76f3380abd30d8e() {
    chopper = function_e2674314764bdf3();
    self.chopper = chopper;
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x898
// Size: 0x22d
function function_e2674314764bdf3() {
    circlecenter = undefined;
    circleradius = undefined;
    if (isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent)) {
        circlecenter = namespace_c5622898120e827f::getnextsafecircleorigin();
        circleradius = namespace_c5622898120e827f::getnextsafecircleradius();
    }
    var_ed09715e306a1455 = namespace_479f2912131dabfc::lootchopper_initcircleinfo(circlecenter, circleradius);
    var_af7939a940e9bfab = function_a74aae7b461714e1(var_ed09715e306a1455);
    var_35039a9883ab69d2 = getdvarint(@"hash_ca56ccb8d0de7869", 8000);
    patrolzone = var_af7939a940e9bfab[randomint(var_af7939a940e9bfab.size)];
    newchopper = namespace_479f2912131dabfc::lootchopper_spawn(patrolzone, "veh9_mil_air_heli_hind_nophysics_br", "veh9_mil_air_heli_hind_nuke_weapons", "chopper_support_turret_elite");
    if (isdefined(newchopper)) {
        newchopper.lootfunc = &function_c944aead940730a7;
        newchopper.var_58b999784e669170 = &function_915ba9b028110d40;
        newchopper.health = level.var_a42d57d98410ffa8.var_b728e1ff992a323a;
        newchopper.maxhealth = level.var_a42d57d98410ffa8.var_b728e1ff992a323a;
        namespace_5a22b6f3a56f7e9b::update_objective_icon(newchopper.objectiveiconid, "ui_mp_br_mapmenu_icon_elite_chopper");
        namespace_5a22b6f3a56f7e9b::function_2946e9eb07acb3f1(newchopper.objectiveiconid, "VEHICLES/NUCLEAR_CHOPPER");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(newchopper.objectiveiconid, 1);
        namespace_5a22b6f3a56f7e9b::function_846c2acd91309cd8(newchopper.objectiveiconid, 246, 192, 72);
        newchopper.var_7b5e5c2bbc8f9f79 = newchopper.objectiveiconid;
        newchopper function_1cd1ee312fd03bb4(1);
        thread function_b012a5a56983477(newchopper);
        thread function_8b0afc16e14eaa13(newchopper);
        newchopper.task = self;
        self.chopper = newchopper;
    } else {
        logstring("br_elite_chopper_quest::task_spawnChopper - no chopper was spawned!");
        if (getdvarint(@"hash_3e40b4675d05b5b1", 1)) {
            var_fedf4b30a2c699e5 = spawnstruct();
            var_fedf4b30a2c699e5.origin = (circlecenter[0], circlecenter[1], 10000);
            var_fedf4b30a2c699e5.task = self;
            var_fedf4b30a2c699e5 function_c944aead940730a7();
        }
    }
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacc
// Size: 0xf9
function function_a74aae7b461714e1(var_ed09715e306a1455) {
    var_8bc6e10ea09fe64 = [];
    var_a43491919a0d6a88 = namespace_479f2912131dabfc::lootchopper_getspawnlocations(var_ed09715e306a1455);
    if (var_a43491919a0d6a88.size == 0) {
        var_20b2b8c140f2f473 = spawnstruct();
        var_20b2b8c140f2f473.origin = var_ed09715e306a1455.origin;
        var_a43491919a0d6a88[0] = var_20b2b8c140f2f473;
    }
    foreach (spawnzone in var_a43491919a0d6a88) {
        spawnzone.origin = spawnzone.origin * (1, 1, 0);
        spawnzone.origin = namespace_d20f8ef223912e12::getoffsetspawnoriginmultitrace(spawnzone.origin, (0, 0, 10000));
        var_8bc6e10ea09fe64[var_8bc6e10ea09fe64.size] = spawnzone;
    }
    return var_8bc6e10ea09fe64;
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbcd
// Size: 0xd5
function function_915ba9b028110d40() {
    targets = [];
    foreach (info in level.arrow.teaminfo) {
        players = namespace_54d20dd0dd79277f::getteamdata(info.targetteam, "players");
        foreach (player in players) {
            targets[targets.size] = player;
        }
    }
    return targets;
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcaa
// Size: 0x5b
function function_c944aead940730a7() {
    droplocation = namespace_479f2912131dabfc::lootchopper_finddroplocation(self.origin + (0, 0, 500));
    crate = namespace_6c578d6ef48f10ef::function_4671cbee65d1615d(self.origin, droplocation);
    crate.task = self.task;
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0c
// Size: 0x128
function function_a1ea17b3a2931b82(player) {
    task = self.task;
    task notify("task_ended");
    task function_93663fe58d95f174(task.teams[0]);
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    var_cb4fad49263e20c4 = spawnstruct();
    var_cb4fad49263e20c4.origin = self.origin + (0, 0, 10);
    var_cb4fad49263e20c4.angles = self.angles;
    var_cb4fad49263e20c4.itemsdropped = 0;
    items = getscriptcachecontents("br_elite_chopper_crate");
    if (isdefined(items)) {
        var_e05413a53b5d9167 = var_cb4fad49263e20c4 namespace_1b7e64f50cca9321::lootspawnitemlist(dropstruct, items, 0, player);
    }
    team = self.task.teams[0];
    element = namespace_6c622b52017c6808::function_f517a8eefb0eb61a(team);
    namespace_6c622b52017c6808::function_cc25131864fa213c(team, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles, element, dropstruct);
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3b
// Size: 0x85
function function_b012a5a56983477(newchopper) {
    level endon("game_ended");
    self endon("task_ended");
    newchopper waittill("death");
    if (level.var_a42d57d98410ffa8.var_2dcb144daab3c487) {
        displayteamsplash(self.teams[0], "br_elite_chopper_end");
    }
    uiobjectiveshowtoteam("elite_chopper_loot", self.teams[0]);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_elite_chopper_heli_destroy", self.teams[0], undefined, 8.5);
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec7
// Size: 0x2b
function function_8b0afc16e14eaa13(newchopper) {
    level endon("game_ended");
    self endon("task_ended");
    newchopper waittill("leaving");
    thread function_8d032f436b816d9d(0);
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef9
// Size: 0x48
function function_8af2a0d1c41847e3() {
    if (checkforactiveobjicon()) {
        deletequestobjicon();
        self.objectiveiconid = undefined;
    }
    if (isdefined(self.chopper)) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_elite_chopper_heli_depart", self.teams[0], 1, 2, undefined);
    }
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf48
// Size: 0xd
function function_d9f3e7f2b05c8ed9() {
    /#
        function_e2674314764bdf3();
    #/
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf5c
// Size: 0x49d
function function_5c2f254d18707855() {
    /#
        var_fedf4b30a2c699e5 = spawnstruct();
        var_fedf4b30a2c699e5.origin = (level.player.origin[0], level.player.origin[1], 10000);
        var_fedf4b30a2c699e5.task = spawnstruct();
        var_fedf4b30a2c699e5.task.iselite = 1;
        var_fedf4b30a2c699e5.task.type = spawnstruct();
        var_fedf4b30a2c699e5.task.type.ref = "<unknown string>";
        var_fedf4b30a2c699e5.task.type.index = 0;
        var_fedf4b30a2c699e5.task.teams[0] = level.player.team;
        level.var_41f4bc9ee8c7c9c6.var_b6fae9c9655c73bf[level.player.team] = 1;
        level.var_81e77c935dfefd11.var_d8daebc51dd41288[level.player.team] = spawnstruct();
        level.var_81e77c935dfefd11.var_d8daebc51dd41288[level.player.team].index = 2;
        level.var_81e77c935dfefd11.var_d8daebc51dd41288[level.player.team].var_f1556c55fa1774f5 = spawnstruct();
        level.var_81e77c935dfefd11.var_d8daebc51dd41288[level.player.team].var_46f432042b3473d8 = 3;
        level.var_81e77c935dfefd11.var_d8daebc51dd41288[level.player.team].ref = "<unknown string>";
        level.arrow.teaminfo[level.player.team] = spawnstruct();
        level.arrow.teaminfo[level.player.team].targetteam = level.player.team;
        level.arrow.teaminfo[level.player.team].state = 2;
        level.arrow.teaminfo[level.player.team].var_3451fa20079de642 = 0;
        level.arrow.teaminfo[level.player.team].var_876be3bc4df3a81d = 0;
        level.arrow.teaminfo[level.player.team].var_8dfd9e71543b605b["<unknown string>"] = 0;
        level.arrow.teaminfo[level.player.team].var_8dfd9e71543b605b["<unknown string>"] = 0;
        level.arrow.teaminfo[level.player.team].var_8dfd9e71543b605b["<unknown string>"] = 0;
        level.arrow.teaminfo[level.player.team].var_8dfd9e71543b605b["<unknown string>"] = 0;
        level.arrow.teaminfo[level.player.team].var_8dfd9e71543b605b["<unknown string>"] = 0;
        level.arrow.teaminfo[level.player.team].var_8dfd9e71543b605b["<unknown string>"] = 0;
        var_fedf4b30a2c699e5 function_c944aead940730a7();
    #/
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1400
// Size: 0x95
function function_1c35bcf919ecbf37() {
    /#
        host = namespace_e6eafa63d63ab54d::devfindhost();
        println("<unknown string>");
        println("<unknown string>");
        println("<unknown string>" + level.var_a42d57d98410ffa8.enabled);
        println("<unknown string>" + level.var_a42d57d98410ffa8.time);
        println("<unknown string>" + level.var_a42d57d98410ffa8.var_b728e1ff992a323a);
        println("<unknown string>");
    #/
}

// Namespace namespace_a42d57d98410ffa8/namespace_448d4e1fafe9b52f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x149c
// Size: 0x17
function function_3f460c87ff0d374() {
    /#
        setdvar(@"hash_fbd8d42235a256d6", 1);
    #/
}

