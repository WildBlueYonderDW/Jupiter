// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\supers.gsc;

#namespace namespace_ecb54f1ef997b69f;

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe43
// Size: 0xad
function function_bb1348b8361a6742() {
    level.var_64586d042bc83658 = &function_da50e02d9e2c31d2;
    level.var_bc366ef8514f9c7e = &function_de30d8b0a3c06fd8;
    level.var_cb98c0fda2fd2c79 = spawnstruct();
    level.var_cb98c0fda2fd2c79.var_d1e945b3a961aee = &function_aa01fe87ee1cb415;
    level.var_b290423f07c0fa3c = spawnstruct();
    level.var_b290423f07c0fa3c.var_21e140b4aaaf4563 = "dlog_event_esports_player_match_end_koth";
    level.var_b290423f07c0fa3c.var_d1e945b3a961aee = &function_664e133f4636982c;
    level.var_2b79862d8e89e043 = spawnstruct();
    level.var_2b79862d8e89e043.var_d1e945b3a961aee = &function_f93988444dece179;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef7
// Size: 0xed
function function_89b5debaabf76ff3() {
    level.var_64586d042bc83658 = &function_c358696cb940224b;
    level.var_bc366ef8514f9c7e = &function_e16b616be638e777;
    level.var_cb98c0fda2fd2c79 = spawnstruct();
    level.var_cb98c0fda2fd2c79.var_d1e945b3a961aee = &function_9576e752aed74566;
    level.var_2b79862d8e89e043 = spawnstruct();
    level.var_2b79862d8e89e043.var_d1e945b3a961aee = &function_66d2b5499b862642;
    level.var_b290423f07c0fa3c = spawnstruct();
    level.var_b290423f07c0fa3c.var_21e140b4aaaf4563 = "dlog_event_esports_player_match_end_sd";
    level.var_b290423f07c0fa3c.var_d1e945b3a961aee = &function_20524d471d23d817;
    level.var_9f33f41b213a1be7 = spawnstruct();
    level.var_9f33f41b213a1be7.var_21e140b4aaaf4563 = "dlog_event_esports_player_round_end_sd";
    level.var_9f33f41b213a1be7.var_d1e945b3a961aee = &function_1b1ee2699a6a524c;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfeb
// Size: 0xdf
function function_da27978a46c38e71() {
    level.var_bc366ef8514f9c7e = &function_86c1b16817ad3899;
    level.var_cb98c0fda2fd2c79 = spawnstruct();
    level.var_cb98c0fda2fd2c79.var_d1e945b3a961aee = &function_935ad059f8bc1ae8;
    level.var_b290423f07c0fa3c = spawnstruct();
    level.var_b290423f07c0fa3c.var_21e140b4aaaf4563 = "dlog_event_esports_player_match_end_control";
    level.var_b290423f07c0fa3c.var_d1e945b3a961aee = &function_3a0bba2841cc215b;
    level.var_9f33f41b213a1be7 = spawnstruct();
    level.var_9f33f41b213a1be7.var_21e140b4aaaf4563 = "dlog_event_esports_player_round_end_control";
    level.var_9f33f41b213a1be7.var_d1e945b3a961aee = &function_7b9680c1e187bd00;
    level.var_2b79862d8e89e043 = spawnstruct();
    level.var_2b79862d8e89e043.var_d1e945b3a961aee = &function_6e10cfdfa388094c;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d1
// Size: 0x2a
function function_a9ef96191f2b64a9() {
    level.var_2b79862d8e89e043 = spawnstruct();
    level.var_2b79862d8e89e043.var_d1e945b3a961aee = &function_6e10cfdfa388094c;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1102
// Size: 0x21a
function init() {
    if (getdvarint(@"hash_830d682c147b23bb", 0) > 0) {
        wait(getdvarint(@"hash_830d682c147b23bb", 0));
    }
    if (!function_3b6961b424a382f() && getdvarint(@"hash_8d2f43eb37209bae", 0) == 0) {
        return;
    }
    level.esports = spawnstruct();
    level.esports.teams = [];
    level.esports.players = [];
    level.esports.var_241db65c803fdcd0 = getdvarint(@"hash_839ed56f32c687f1", 5);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_server_start", &function_ec68f43c79e586dc);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_match_start", &function_393baf20db478c0d);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_match_end", &function_f5f91665fe4dba94);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_round_start", &function_8eeea3969df7e964);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_round_end", &function_b610a0d728dfa59e);
    if (getdvarint(@"hash_f405928d962ae17e", 0) < 2) {
        namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_objective_state_changed", &function_cd0b801a8b092ca);
    }
    if (getdvarint(@"hash_f405928d962ae17e", 0) < 1) {
        namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_player_loadout_changed", &function_c82d72ebcdb14059);
        namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_disconnect", &on_player_disconnect);
    }
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_player_death", &on_player_death);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_first_connect", &function_a51c2c04a3f452cc);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_connect", &on_player_connect);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_player_round_end", &function_49472736af222fcc);
    namespace_de6e6777b0937bd7::function_aacbbe63c26687ae("callback_on_player_spawned", &function_ed4b9c7445b52be8);
    switch (level.gametype) {
    case #"hash_6efb0f59a62300fb":
        function_bb1348b8361a6742();
        break;
    case #"hash_fa50b0f6bd82e972":
        function_89b5debaabf76ff3();
        break;
    case #"hash_a1313b745c17c07e":
        function_da27978a46c38e71();
        break;
    default:
        function_a9ef96191f2b64a9();
        break;
    }
    level notify("telemetry_init");
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1323
// Size: 0x5d
function function_d3c6179b65106833() {
    if (getdvarint(@"hash_f405928d962ae17e", 0) >= 2) {
        return;
    }
    self endon("death");
    level endon("game_ended");
    var_241db65c803fdcd0 = level.esports.var_241db65c803fdcd0;
    while (1) {
        function_a6c2b5a6203b8813();
        function_c22652f83b317b82();
        wait(var_241db65c803fdcd0);
    }
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1387
// Size: 0x9a
function function_36fa9aa217c6858() {
    var_4dba79dfa0880763 = getdvarint(@"hash_e38ee0a901267948", 0);
    if (var_4dba79dfa0880763 <= 0) {
        return;
    }
    var_9bd7564c71693e36 = getdvarint(@"hash_5425503fa577c921", 10000) / 1000;
    var_720c6460e66c2e7f = getdvarint(@"hash_9b4fbaf632d0f62e", 1);
    var_d80f4a569a2e75bd = function_ae0481d6812510b2();
    while (1) {
        for (i = 0; i < var_720c6460e66c2e7f; i++) {
            function_4eaf70b59b015528(var_d80f4a569a2e75bd);
        }
        wait(var_9bd7564c71693e36);
    }
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1428
// Size: 0x5e
function function_ae0481d6812510b2() {
    var_cac5351de1e9ba74 = [];
    for (i = 0; i <= 7; i++) {
        dvar_name = function_2ef675c13ca1c4af(@"hash_3ab224a3325d7169", i);
        var_74bf1c0eff8313d3 = getdvarfloat(dvar_name, 0);
        var_cac5351de1e9ba74[i] = var_74bf1c0eff8313d3;
    }
    return var_cac5351de1e9ba74;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148e
// Size: 0x14b
function function_4eaf70b59b015528(distribution) {
    var_5a46afdcd4f81177 = function_1433fc1cd0f15328(distribution);
    switch (var_5a46afdcd4f81177) {
    case 0:
        function_9f5de9916ad7fb1e("dlog_event_esports_test_0", 20);
        break;
    case 1:
        function_9f5de9916ad7fb1e("dlog_event_esports_test_1", 50);
        break;
    case 2:
        function_9f5de9916ad7fb1e("dlog_event_esports_test_2", 100);
        break;
    case 3:
        function_9f5de9916ad7fb1e("dlog_event_esports_test_3", 150);
        break;
    case 4:
        function_9f5de9916ad7fb1e("dlog_event_esports_test_4", 250);
        break;
    case 5:
        function_9f5de9916ad7fb1e("dlog_event_esports_test_5", 500);
        break;
    case 6:
        function_9f5de9916ad7fb1e("dlog_event_esports_test_6", 1000);
        break;
    case 7:
        var_bbd656ce5a10696c = function_550037a80866cb85(1024);
        var_35554ae84383490 = [0:"test_column_1", 1:var_bbd656ce5a10696c, 2:"test_column_2", 3:var_bbd656ce5a10696c];
        dlog_recordevent("dlog_event_esports_test_7", var_35554ae84383490);
        break;
    }
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e0
// Size: 0x3d
function function_550037a80866cb85(count) {
    var_73f4f7f2ccc98c73 = [];
    for (i = 0; i < count; i++) {
        var_73f4f7f2ccc98c73[i] = randomint(256);
    }
    return var_73f4f7f2ccc98c73;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1625
// Size: 0x3c
function function_9f5de9916ad7fb1e(event_name, var_febd4e2d7597b3f5) {
    var_35554ae84383490 = [0:"test_column", 1:function_550037a80866cb85(var_febd4e2d7597b3f5)];
    dlog_recordevent(event_name, var_35554ae84383490);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1668
// Size: 0x79
function function_1433fc1cd0f15328(distribution) {
    var_ab1e1b0c0c442e40 = randomfloat(1);
    current_index = 0;
    var_3ee256c689d62fa7 = 0;
    var_6645afb1fb6e3e31 = distribution[current_index];
    while (!function_877519ea69933232(var_3ee256c689d62fa7, var_ab1e1b0c0c442e40, var_6645afb1fb6e3e31)) {
        current_index++;
        var_3ee256c689d62fa7 = var_6645afb1fb6e3e31;
        if (current_index != distribution.size - 1) {
            var_6645afb1fb6e3e31 = var_6645afb1fb6e3e31 + distribution[current_index];
        } else {
            var_6645afb1fb6e3e31 = 1;
        }
    }
    return current_index;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e9
// Size: 0x26
function function_877519ea69933232(min, value, max) {
    return value >= min && value <= max;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1717
// Size: 0x24
function function_a3d4800b4cb51b38(vector) {
    return [0:vector[0], 1:vector[1], 2:vector[2]];
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1743
// Size: 0x6b
function function_78707b6b4cb17a1c(team_id) {
    if (!isdefined(level.esports.teams[team_id])) {
        team_name = function_ca9af9c7fabd79a0(team_id);
        level.esports.teams[team_id] = ter_op(isdefined(team_name), team_name, team_id);
    }
    return level.esports.teams[team_id];
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b6
// Size: 0x2e
function get_winning_team(winning_team) {
    if (winning_team == "none" || winning_team == "tie") {
        return "draw";
    }
    return function_78707b6b4cb17a1c(winning_team);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ec
// Size: 0x8a
function function_1da7bfa6bc897e5e(player) {
    if (!isdefined(player.xuid)) {
        return player function_bb91c271085a7728();
    }
    if (!isdefined(level.esports.players[player.xuid])) {
        level.esports.players[player.xuid] = player function_bb91c271085a7728();
    }
    return level.esports.players[player.xuid];
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x187e
// Size: 0xe
function function_22de454b228d857c() {
    return namespace_eb72aa155b5e14e7::gettimefrommatchstart(gettime());
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1894
// Size: 0x9c
function function_df75e8bd68b005f0(end_reason) {
    if (!isdefined(end_reason)) {
        return "unknown";
    }
    var_867de8b456966b94 = game["end_reason"];
    reasons = getarraykeys(var_867de8b456966b94);
    foreach (reason in reasons) {
        var_a3b15dfc45fa034a = var_867de8b456966b94[reason];
        if (var_a3b15dfc45fa034a == end_reason) {
            return reason;
        }
    }
    return "unknown";
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1938
// Size: 0xd0
function function_bd8cfc6e4a98dee6(winning_team) {
    var_f7fb016578461b57 = spawnstruct();
    if (winning_team == game["attackers"]) {
        var_f7fb016578461b57.side = "attack";
        var_f7fb016578461b57.win_team = winning_team;
        var_f7fb016578461b57.loss_team = game["defenders"];
    } else if (winning_team == game["defenders"]) {
        var_f7fb016578461b57.side = "defense";
        var_f7fb016578461b57.win_team = winning_team;
        var_f7fb016578461b57.loss_team = game["attackers"];
    } else {
        var_f7fb016578461b57.side = "none";
        var_f7fb016578461b57.win_team = "none";
        var_f7fb016578461b57.loss_team = "none";
    }
    return var_f7fb016578461b57;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a10
// Size: 0x99
function function_8b0f3d64ee5d77da() {
    var_f011be8c331f0f = spawnstruct();
    if (isroundbased()) {
        if (game["attackers"] == "allies") {
            var_f011be8c331f0f.team1 = "attack";
            var_f011be8c331f0f.team2 = "defense";
        } else {
            var_f011be8c331f0f.team1 = "defense";
            var_f011be8c331f0f.team2 = "attack";
        }
    } else {
        var_f011be8c331f0f.team1 = "none";
        var_f011be8c331f0f.team2 = "none";
    }
    return var_f011be8c331f0f;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab1
// Size: 0x57
function function_b6c29e08764ae361(means_of_death) {
    round = 1;
    if (!isroundbased()) {
        return round;
    }
    round = game["roundsPlayed"];
    if (isdefined(means_of_death) && (means_of_death == "MOD_GAME_ENDED" || means_of_death == "MOD_ROUND_ENDED")) {
        round--;
        if (round < 1) {
            round = 1;
        }
    }
    return round;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b10
// Size: 0x53
function function_aae4068942e8bc69() {
    objective_time = level.zoneendtime;
    if (isdefined(level.defuseendtime)) {
        objective_time = level.defuseendtime;
    }
    if (isdefined(objective_time)) {
        currenttime = gettime();
        return ter_op(currenttime < objective_time, objective_time - currenttime, 0);
    }
    return 0;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6b
// Size: 0x5b
function is_ace_kill(attacker, victim) {
    var_988b0676a35ef9d6 = namespace_54d20dd0dd79277f::getfriendlyplayers(victim.team, 0).size;
    return attacker.pers["kills"] - attacker.var_934379620852e329.kills == var_988b0676a35ef9d6;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bce
// Size: 0x2a
function function_1e412fb6d8cbc655(var_642470e1abc1bbf9) {
    return isdefined(var_642470e1abc1bbf9.damageflags) && var_642470e1abc1bbf9.damageflags & 8;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c00
// Size: 0x24
function function_d303e25d324b2874() {
    return !level.var_bf918fc5f938cd0c && level.zoneendtime - gettime() <= 15000;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c2c
// Size: 0x28
function function_bffb24c16c411c32() {
    objective_key = level.zone.objectivekey;
    return "point" + objective_key;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5c
// Size: 0x3f
function function_e553b81f7f609a5b() {
    var_76276113dd5b929 = self.objectivekey;
    if (isdefined(var_76276113dd5b929) && (var_76276113dd5b929 == "_a" || var_76276113dd5b929 == "_b")) {
        return ("point" + var_76276113dd5b929);
    }
    return "bomb";
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca3
// Size: 0x12
function function_50280cf505622041() {
    return "point" + self.objectivekey;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cbd
// Size: 0x55
function function_3fc5fd079e76a114(objective) {
    var_35599c2772650db9 = [0:"obj_name", 1:"point" + objective.objectivekey, 2:"origin", 3:function_a3d4800b4cb51b38(objective.curorigin)];
    return var_35599c2772650db9;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1a
// Size: 0x5f
function is_interacting_objective() {
    var_96349e74c9078d79 = istrue(self.isbombcarrier) || istrue(self.isplanting) || istrue(self.isdefusing);
    var_3fc17555cf838dd1 = isdefined(self.touchtriggers) && self.touchtriggers.size > 0;
    return var_96349e74c9078d79 || var_3fc17555cf838dd1;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d81
// Size: 0x9e
function function_da50e02d9e2c31d2() {
    if (!isdefined(self.pers["obj1Time"])) {
        initpersstat("obj1Time");
    }
    if (!isdefined(self.pers["obj2Time"])) {
        initpersstat("obj2Time");
    }
    if (!isdefined(self.pers["obj3Time"])) {
        initpersstat("obj3Time");
    }
    if (!isdefined(self.pers["obj4Time"])) {
        initpersstat("obj4Time");
    }
    if (!isdefined(self.pers["obj5Time"])) {
        initpersstat("obj5Time");
    }
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e26
// Size: 0x22
function function_c358696cb940224b() {
    if (!isdefined(self.pers["sneakDefuses"])) {
        initpersstat("sneakDefuses");
    }
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e4f
// Size: 0x1cf
function function_2cbdf94f9506ad4f() {
    if (!isdefined(self.pers["total_time_alive"])) {
        initpersstat("total_time_alive");
    }
    if (!isdefined(self.pers["shotsHitHead"])) {
        initpersstat("shotsHitHead");
    }
    if (!isdefined(self.pers["totalMultikills"])) {
        initpersstat("totalMultikills");
    }
    if (!isdefined(self.pers["soloKills"])) {
        initpersstat("soloKills");
    }
    if (!isdefined(self.pers["deadSilenceKills"])) {
        initpersstat("deadSilenceKills");
    }
    if (!isdefined(self.pers["deadSilenceTime"])) {
        initpersstat("deadSilenceTime");
    }
    if (!isdefined(self.pers["damageHealed"])) {
        initpersstat("damageHealed");
    }
    if (!isdefined(self.pers["inapplicableTradedKills"])) {
        initpersstat("inapplicableTradedKills");
    }
    if (!isdefined(self.pers["inapplicableTradedDeaths"])) {
        initpersstat("inapplicableTradedDeaths");
    }
    if (!isdefined(self.pers["friendlyDamageDone"])) {
        initpersstat("friendlyDamageDone");
    }
    if (!isdefined(self.pers["tacticalsUsed"])) {
        initpersstat("tacticalsUsed");
    }
    if (!isdefined(self.pers["lethalsUsed"])) {
        initpersstat("lethalsUsed");
    }
    if (!isdefined(self.pers["damageTaken"])) {
        initpersstat("damageTaken");
    }
    if (!isdefined(self.pers["totalDistTraveled"])) {
        initpersstat("totalDistTraveled");
    }
    if (isdefined(level.var_64586d042bc83658)) {
        self [[ level.var_64586d042bc83658 ]]();
    }
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2025
// Size: 0x3b
function function_de30d8b0a3c06fd8(var_934379620852e329, var_2dbfe016101d4381) {
    var_934379620852e329.hill_time = function_a08fea26a49145a8(0);
    var_934379620852e329.contested_hill_time = function_a08fea26a49145a8(12);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2067
// Size: 0x4d
function function_e16b616be638e777(var_934379620852e329, var_2dbfe016101d4381) {
    var_934379620852e329.bombs_planted = var_2dbfe016101d4381["plants"];
    var_934379620852e329.bombs_defused = var_2dbfe016101d4381["defuses"];
    var_934379620852e329.sneak_defuses = var_2dbfe016101d4381["sneakDefuses"];
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20bb
// Size: 0x28
function function_86c1b16817ad3899(var_934379620852e329, var_2dbfe016101d4381) {
    var_934379620852e329.tiers_captured = function_a08fea26a49145a8(8);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ea
// Size: 0x23e
function function_42afc3bfbb1e92cb() {
    var_934379620852e329 = spawnstruct();
    var_2dbfe016101d4381 = self.pers;
    var_934379620852e329.kills = var_2dbfe016101d4381["kills"];
    var_934379620852e329.deaths = var_2dbfe016101d4381["deaths"];
    var_934379620852e329.assists = var_2dbfe016101d4381["assists"];
    var_934379620852e329.score = var_2dbfe016101d4381["score"];
    var_934379620852e329.highest_streak = var_2dbfe016101d4381["longestStreak"];
    var_934379620852e329.shots_fired = function_e42724fbfacff469(0);
    var_934379620852e329.shots_hit = function_e42724fbfacff469(1);
    var_934379620852e329.shots_head = var_2dbfe016101d4381["shotsHitHead"];
    var_934379620852e329.untraded_kills = function_815fee43d577e1b6(5);
    var_934379620852e329.untraded_deaths = var_2dbfe016101d4381["untradedDeaths"];
    var_934379620852e329.traded_kills = var_2dbfe016101d4381["tradedKills"];
    var_934379620852e329.traded_deaths = var_2dbfe016101d4381["tradedDeaths"];
    var_934379620852e329.inapplicable_traded_kills = var_2dbfe016101d4381["inapplicableTradedKills"];
    var_934379620852e329.inapplicable_traded_deaths = var_2dbfe016101d4381["inapplicableTradedDeaths"];
    var_934379620852e329.damage_dealt = function_815fee43d577e1b6(1);
    var_934379620852e329.damage_taken = var_2dbfe016101d4381["damageTaken"];
    var_934379620852e329.damage_healed = var_2dbfe016101d4381["damageHealed"];
    var_934379620852e329.damage_friend = var_2dbfe016101d4381["friendlyDamageDone"];
    var_934379620852e329.tacticals_used = var_2dbfe016101d4381["tacticalsUsed"];
    var_934379620852e329.lethals_used = var_2dbfe016101d4381["lethalsUsed"];
    var_934379620852e329.time_alive = var_2dbfe016101d4381["total_time_alive"];
    var_934379620852e329.distance_traveled = var_2dbfe016101d4381["totalDistTraveled"];
    var_934379620852e329.dead_silence_time = var_2dbfe016101d4381["deadSilenceTime"];
    var_934379620852e329.movementupdatecount = var_2dbfe016101d4381["movementUpdateCount"];
    var_934379620852e329.movingtotal = var_2dbfe016101d4381["movingTotal"];
    var_934379620852e329.distancetotal = var_2dbfe016101d4381["distanceTotal"];
    if (isdefined(level.var_bc366ef8514f9c7e)) {
        self [[ level.var_bc366ef8514f9c7e ]](var_934379620852e329, var_2dbfe016101d4381);
    }
    self.var_934379620852e329 = var_934379620852e329;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232f
// Size: 0x3d
function function_e2ec18c5b7de4fb6() {
    deathtime = function_22de454b228d857c();
    var_cc785f48d0173169 = deathtime - namespace_eb72aa155b5e14e7::gettimefrommatchstart(self.spawntime);
    incpersstat("total_time_alive", var_cc785f48d0173169);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2373
// Size: 0x46
function function_d21dfe417b65b64a() {
    if (isalive(self)) {
        match_time = function_22de454b228d857c();
        var_cc785f48d0173169 = match_time - namespace_eb72aa155b5e14e7::gettimefrommatchstart(self.spawntime);
        incpersstat("total_time_alive", var_cc785f48d0173169);
    }
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c0
// Size: 0x9b
function function_c56d015e4cd2e47c(data) {
    var_51e6ce77b3d9cc11 = spawnstruct();
    if (isdefined(data["movementUpdateCount"]) && data["movementUpdateCount"] > 0) {
        var_51e6ce77b3d9cc11.percent_time_moving = int(data["movingTotal"] / data["movementUpdateCount"] / 5 * 100);
        var_51e6ce77b3d9cc11.average_speed = float(data["distanceTotal"] / data["movementUpdateCount"]);
        return var_51e6ce77b3d9cc11;
    }
    var_51e6ce77b3d9cc11.percent_time_moving = 0;
    var_51e6ce77b3d9cc11.average_speed = 0;
    return var_51e6ce77b3d9cc11;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2463
// Size: 0xae
function function_3ddc4f55dfe66ebb() {
    var_934379620852e329 = self.var_934379620852e329;
    if (!isdefined(var_934379620852e329.movementupdatecount)) {
        return function_c56d015e4cd2e47c(self.pers);
    }
    var_2dbfe016101d4381 = self.pers;
    var_104538cf2341cf1e = [];
    var_104538cf2341cf1e["movingTotal"] = var_2dbfe016101d4381["movingTotal"] - var_934379620852e329.movingtotal;
    var_104538cf2341cf1e["movementUpdateCount"] = var_2dbfe016101d4381["movementUpdateCount"] - var_934379620852e329.movementupdatecount;
    var_104538cf2341cf1e["distanceTotal"] = var_2dbfe016101d4381["distanceTotal"] - var_934379620852e329.distancetotal;
    return function_c56d015e4cd2e47c(var_104538cf2341cf1e);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2519
// Size: 0xf8
function function_b433743dc5925931(var_fb5a2da2d4c3c2e7) {
    player = self;
    var_e170a74f4cb5d9d5 = var_fb5a2da2d4c3c2e7.weapon;
    weapon_name = "none";
    if (isdefined(var_e170a74f4cb5d9d5)) {
        weapon_name = var_e170a74f4cb5d9d5.basename;
    }
    weapon_attachments = [];
    if (!isundefinedweapon(var_e170a74f4cb5d9d5)) {
        weapon_attachments = getweaponattachments(var_e170a74f4cb5d9d5);
    }
    return [0:"name", 1:function_1da7bfa6bc897e5e(player), 2:"team", 3:function_78707b6b4cb17a1c(player.sessionteam), 4:"origin", 5:function_a3d4800b4cb51b38(var_fb5a2da2d4c3c2e7.origin), 6:"viewangles", 7:function_a3d4800b4cb51b38(var_fb5a2da2d4c3c2e7.angles), 8:"weapon", 9:weapon_name, 10:"weapon_attachments", 11:weapon_attachments];
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2619
// Size: 0x51
function function_770a5e6a8a9e1289() {
    player = self;
    return [0:"is_ads", 1:player isplayerads(), 2:"is_flashed", 3:istrue(player.flashbanged), 4:"is_interacting_objective", 5:player is_interacting_objective()];
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2672
// Size: 0x11
function function_393baf20db478c0d() {
    function_8773797d27789d6e();
    function_62268a7bb3b85f6c();
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x268a
// Size: 0x86
function function_f5f91665fe4dba94(data) {
    function_458ce094fbf47be3(data);
    foreach (player in level.players) {
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = player;
        function_e60b22a0532246a9(var_7e2c53b0bcf117d9);
    }
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2717
// Size: 0x1c
function function_8eeea3969df7e964() {
    level thread function_d3c6179b65106833();
    level thread function_36fa9aa217c6858();
    function_ebacc818c229d2e3();
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x273a
// Size: 0x1e
function function_a51c2c04a3f452cc(player) {
    if (player iscodcaster()) {
        return;
    }
    player function_2cbdf94f9506ad4f();
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275f
// Size: 0x4d
function on_player_connect(player) {
    if (player iscodcaster()) {
        return;
    }
    if (!isdefined(player.var_f038145f52e97ce3)) {
        player.var_f038145f52e97ce3 = spawnstruct();
    }
    if (!isdefined(player.var_934379620852e329)) {
        player function_42afc3bfbb1e92cb();
    }
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27b3
// Size: 0x36
function on_player_death(data) {
    if (!isdefined(data.attacker)) {
        return;
    }
    data.victim function_e2ec18c5b7de4fb6();
    function_a9d9e4dd889a4258(data);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f0
// Size: 0x87
function on_player_disconnect(data) {
    player = data.player;
    if (player iscodcaster() || !namespace_4b0406965e556711::gameflag("prematch_done")) {
        return;
    }
    var_e44c9440aaae891b = player.var_f038145f52e97ce3;
    if (!istrue(var_e44c9440aaae891b.round_end)) {
        function_49472736af222fcc(data);
    }
    if (!istrue(var_e44c9440aaae891b.match_end)) {
        function_e60b22a0532246a9(data);
    }
    function_b30fd7d465d6d57c(data);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287e
// Size: 0x7d
function function_ec68f43c79e586dc() {
    function_d47580052756d597();
    var_35554ae84383490 = [0:"game_type", 1:level.gametype, 2:"map_name", 3:level.mapname, 4:"team1_name", 5:function_78707b6b4cb17a1c("allies"), 6:"team2_name", 7:function_78707b6b4cb17a1c("axis")];
    dlog_recordevent("dlog_event_esports_server_start", var_35554ae84383490);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2902
// Size: 0x77
function function_8773797d27789d6e() {
    var_35554ae84383490 = [0:"game_type", 1:level.gametype, 2:"map_name", 3:level.mapname, 4:"team1_name", 5:function_78707b6b4cb17a1c("allies"), 6:"team2_name", 7:function_78707b6b4cb17a1c("axis")];
    dlog_recordevent("dlog_event_esports_match_start", var_35554ae84383490);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2980
// Size: 0x83
function function_458ce094fbf47be3(data) {
    var_35554ae84383490 = [0:"match_time", 1:function_22de454b228d857c(), 2:"team1_score", 3:getteamscore("allies"), 4:"team2_score", 5:getteamscore("axis"), 6:"win_team", 7:get_winning_team(data.winner)];
    dlog_recordevent("dlog_event_esports_match_end", var_35554ae84383490);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a0a
// Size: 0x8d
function function_a6c2b5a6203b8813() {
    var_35554ae84383490 = [0:"game_timer", 1:int(namespace_d576b6dc7cef9c62::gettimeremaining() / 1000), 2:"objective_timer", 3:int(function_aae4068942e8bc69() / 1000), 4:"team1_score", 5:getteamscore("allies"), 6:"team2_score", 7:getteamscore("axis")];
    var_21e140b4aaaf4563 = "dlog_event_esports_match_interval_info";
    dlog_recordevent(var_21e140b4aaaf4563, var_35554ae84383490);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a9e
// Size: 0x5c
function function_ebacc818c229d2e3() {
    var_f011be8c331f0f = function_8b0f3d64ee5d77da();
    var_35554ae84383490 = [0:"team1_side", 1:var_f011be8c331f0f.team1, 2:"team2_side", 3:var_f011be8c331f0f.team2];
    dlog_recordevent("dlog_event_esports_round_start", var_35554ae84383490);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b01
// Size: 0xcf
function function_b610a0d728dfa59e(data) {
    if (!isroundbased()) {
        return;
    }
    round_info = function_bd8cfc6e4a98dee6(data.winner);
    var_35554ae84383490 = [0:"result", 1:function_df75e8bd68b005f0(data.end_reason), 2:"win_side", 3:round_info.side, 4:"match_time", 5:function_22de454b228d857c(), 6:"win_team", 7:function_78707b6b4cb17a1c(round_info.win_team), 8:"loss_team", 9:function_78707b6b4cb17a1c(round_info.loss_team)];
    dlog_recordevent("dlog_event_esports_round_end", var_35554ae84383490);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bd7
// Size: 0xc8
function function_62268a7bb3b85f6c() {
    var_35554ae84383490 = [];
    objectives = ter_op(isdefined(level.objectives), level.objectives, []);
    var_12632b94c52c98a0 = [];
    foreach (objective in objectives) {
        var_12632b94c52c98a0 = array_add(var_12632b94c52c98a0, function_3fc5fd079e76a114(objective));
    }
    var_35554ae84383490 = array_add(var_35554ae84383490, "objectives_info");
    var_35554ae84383490 = array_add(var_35554ae84383490, var_12632b94c52c98a0);
    var_21e140b4aaaf4563 = "dlog_event_esports_objective_info";
    dlog_recordevent(var_21e140b4aaaf4563, var_35554ae84383490);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca6
// Size: 0x98
function function_aa01fe87ee1cb415(var_35554ae84383490, var_418408e3f965a0b1) {
    obj_team = var_418408e3f965a0b1.obj_team;
    var_35554ae84383490 = array_combine(var_35554ae84383490, [0:"obj_name", 1:function_bffb24c16c411c32()]);
    var_35554ae84383490 = array_add(var_35554ae84383490, "objective_state_zone");
    var_35554ae84383490 = array_add(var_35554ae84383490, [0:"is_captured", 1:obj_team != "none", 2:"is_contested", 3:self.stalemate, 4:"tiers_captured", 5:0]);
    return var_35554ae84383490;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d46
// Size: 0xb8
function function_9576e752aed74566(var_35554ae84383490, var_418408e3f965a0b1) {
    player = var_418408e3f965a0b1.var_22282e7d48ca3400;
    is_bomb_picked_up = 0;
    if (isdefined(player)) {
        is_bomb_picked_up = player.isbombcarrier;
    }
    var_35554ae84383490 = array_combine(var_35554ae84383490, [0:"obj_name", 1:function_e553b81f7f609a5b()]);
    var_35554ae84383490 = array_add(var_35554ae84383490, "objective_state_bomb");
    var_35554ae84383490 = array_add(var_35554ae84383490, [0:"is_bomb_picked_up", 1:is_bomb_picked_up, 2:"is_bomb_planted", 3:level.bombplanted, 4:"is_bomb_defused", 5:level.bombdefused]);
    return var_35554ae84383490;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e06
// Size: 0xdb
function function_935ad059f8bc1ae8(var_35554ae84383490, var_418408e3f965a0b1) {
    obj_team = var_418408e3f965a0b1.obj_team;
    tiers_captured = 0;
    if (isdefined(self.var_ae9b09d28693b763)) {
        tiers_captured = self.var_ae9b09d28693b763;
    }
    var_35554ae84383490 = array_combine(var_35554ae84383490, [0:"obj_name", 1:function_50280cf505622041()]);
    var_35554ae84383490 = array_add(var_35554ae84383490, "objective_state_zone");
    var_35554ae84383490 = array_add(var_35554ae84383490, [0:"is_captured", 1:self.claimteam != "none" && self.claimteam != self.ownerteam, 2:"is_contested", 3:self.stalemate, 4:"tiers_captured", 5:tiers_captured]);
    return var_35554ae84383490;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee9
// Size: 0x175
function function_cd0b801a8b092ca(data) {
    if (!isdefined(self.objidnum)) {
        return;
    }
    var_22282e7d48ca3400 = data.var_22282e7d48ca3400;
    var_239b4b5fa4bcf6c6 = data.var_239b4b5fa4bcf6c6;
    player_name = "none";
    obj_team = "none";
    if (isdefined(var_22282e7d48ca3400)) {
        player_name = function_1da7bfa6bc897e5e(var_22282e7d48ca3400);
        obj_team = function_78707b6b4cb17a1c(var_22282e7d48ca3400.sessionteam);
    }
    var_35554ae84383490 = [0:"player_name", 1:player_name, 2:"obj_pos", 3:function_a3d4800b4cb51b38(self.curorigin), 4:"obj_team", 5:obj_team, 6:"match_time", 7:function_22de454b228d857c()];
    var_21e140b4aaaf4563 = "dlog_event_esports_objective_state_changed";
    if (isdefined(level.var_cb98c0fda2fd2c79)) {
        var_418408e3f965a0b1 = spawnstruct();
        var_418408e3f965a0b1.var_22282e7d48ca3400 = var_22282e7d48ca3400;
        var_418408e3f965a0b1.obj_team = obj_team;
        var_35554ae84383490 = self [[ level.var_cb98c0fda2fd2c79.var_d1e945b3a961aee ]](var_35554ae84383490, var_418408e3f965a0b1);
    }
    if (!array_contains_key(var_35554ae84383490, "obj_name")) {
        var_35554ae84383490 = array_combine(var_35554ae84383490, [0:"obj_name", 1:""]);
    }
    dlog_recordevent(var_21e140b4aaaf4563, var_35554ae84383490);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3065
// Size: 0x4f
function function_b30fd7d465d6d57c(data) {
    player = data.player;
    var_35554ae84383490 = [0:"player_name", 1:function_1da7bfa6bc897e5e(player)];
    player dlog_recordplayerevent("dlog_event_esports_player_disconnect", var_35554ae84383490);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30bb
// Size: 0xa5
function function_ed4b9c7445b52be8(player) {
    player_origin = player.origin;
    player_angles = player getplayerangles();
    var_35554ae84383490 = [0:"player_name", 1:function_1da7bfa6bc897e5e(player), 2:"player_team", 3:function_78707b6b4cb17a1c(player.sessionteam), 4:"match_time", 5:function_22de454b228d857c(), 6:"origin", 7:function_a3d4800b4cb51b38(player_origin)];
    player dlog_recordplayerevent("dlog_event_esports_player_spawned", var_35554ae84383490);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3167
// Size: 0x62
function function_f93988444dece179(var_35554ae84383490, data) {
    var_35554ae84383490[11] = array_combine(var_35554ae84383490[11], [0:"is_planter_kill", 1:0, 2:"is_defuser_kill", 3:0, 4:"is_ace_kill", 5:0, 6:"is_rotation_kill", 7:function_d303e25d324b2874()]);
    return var_35554ae84383490;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d1
// Size: 0xd5
function function_66d2b5499b862642(var_35554ae84383490, data) {
    attacker = data.attacker;
    if (!isdefined(attacker)) {
        return function_6e10cfdfa388094c(var_35554ae84383490, data);
    }
    victim = data.victim;
    var_d1d276488b645d67 = ter_op(isdefined(attacker.modifiers), attacker.modifiers, []);
    var_35554ae84383490[11] = array_combine(var_35554ae84383490[11], [0:"is_planter_kill", 1:istrue(var_d1d276488b645d67["killed_planter"]), 2:"is_defuser_kill", 3:istrue(var_d1d276488b645d67["killed_defuser"]), 4:"is_ace_kill", 5:is_ace_kill(attacker, victim), 6:"is_rotation_kill", 7:0]);
    return var_35554ae84383490;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32ae
// Size: 0x5d
function function_6e10cfdfa388094c(var_35554ae84383490, data) {
    var_35554ae84383490[11] = array_combine(var_35554ae84383490[11], [0:"is_planter_kill", 1:0, 2:"is_defuser_kill", 3:0, 4:"is_ace_kill", 5:0, 6:"is_rotation_kill", 7:0]);
    return var_35554ae84383490;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3313
// Size: 0x3ee
function function_a9d9e4dd889a4258(data) {
    victim = data.victim;
    var_5b88fd6cc81411a4 = victim.lastdeathpos;
    var_51e0b68e2cd1ede6 = victim.lastdeathangles;
    attacker = data.attacker;
    if (isplayer(attacker)) {
        attacker_origin = attacker.origin;
        var_522fed3f783c2e47 = attacker getplayerangles();
        attacker_weapon = data.objweapon;
        var_d1d276488b645d67 = ter_op(isdefined(attacker.modifiers), attacker.modifiers, []);
        var_7ff0a085ae13029 = spawnstruct();
        var_7ff0a085ae13029.origin = attacker_origin;
        var_7ff0a085ae13029.angles = var_522fed3f783c2e47;
        var_7ff0a085ae13029.weapon = attacker_weapon;
        var_3812d02e5f7a0da3 = attacker function_b433743dc5925931(var_7ff0a085ae13029);
        var_7633e290ec9d496c = attacker function_770a5e6a8a9e1289();
        attacker_in_victim_fov = within_fov(var_5b88fd6cc81411a4, var_51e0b68e2cd1ede6, attacker_origin, 0.4226);
        victim_in_attacker_fov = within_fov(attacker_origin, var_522fed3f783c2e47, var_5b88fd6cc81411a4, 0.4226);
        is_dead_silence_kill = 0;
        var_7639389406e14c2e = attacker namespace_85d036cb78063c4a::getcurrentsuper();
        if (isdefined(var_7639389406e14c2e) && attacker namespace_85d036cb78063c4a::issuperinuse() && var_7639389406e14c2e.staticdata.ref == "super_deadsilence") {
            is_dead_silence_kill = 1;
        }
        kill_context = [0:"is_longshot_kill", 1:istrue(var_d1d276488b645d67["longshot"]), 2:"is_pointblank_kill", 3:istrue(var_d1d276488b645d67["pointblank"]), 4:"is_first_blood", 5:istrue(var_d1d276488b645d67["firstblood"]), 6:"is_revenge_kill", 7:istrue(var_d1d276488b645d67["revenge"]), 8:"is_wallbang", 9:function_1e412fb6d8cbc655(data), 10:"attacker_in_victim_fov", 11:attacker_in_victim_fov, 12:"victim_in_attacker_fov", 13:victim_in_attacker_fov, 14:"is_dead_silence_kill", 15:is_dead_silence_kill];
        kill_distance = distance(attacker_origin, var_5b88fd6cc81411a4);
    } else {
        var_3812d02e5f7a0da3 = [];
        var_7633e290ec9d496c = [];
        kill_context = [];
        kill_distance = 0;
    }
    victim_weapon = victim.lastweaponused;
    var_54ac843c056a6336 = spawnstruct();
    var_54ac843c056a6336.origin = var_5b88fd6cc81411a4;
    var_54ac843c056a6336.angles = var_51e0b68e2cd1ede6;
    var_54ac843c056a6336.weapon = victim_weapon;
    var_b16a17c14de95bda = victim function_b433743dc5925931(var_54ac843c056a6336);
    var_43c8b33f18127c89 = victim function_770a5e6a8a9e1289();
    var_b0f559936c1b6bae = [0:"match_time", 1:function_22de454b228d857c(), 2:"means_of_death", 3:data.meansofdeath, 4:"players_distance", 5:kill_distance];
    var_35554ae84383490 = [0:"info", 1:var_b0f559936c1b6bae, 2:"attacker", 3:var_3812d02e5f7a0da3, 4:"attacker_status", 5:var_7633e290ec9d496c, 6:"victim", 7:var_b16a17c14de95bda, 8:"victim_status", 9:var_43c8b33f18127c89, 10:"kill_context", 11:kill_context];
    var_21e140b4aaaf4563 = "dlog_event_esports_player_killed";
    if (isdefined(level.var_2b79862d8e89e043)) {
        var_35554ae84383490 = self [[ level.var_2b79862d8e89e043.var_d1e945b3a961aee ]](var_35554ae84383490, data);
    }
    victim dlog_recordplayerevent(var_21e140b4aaaf4563, var_35554ae84383490);
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3708
// Size: 0x50
function function_664e133f4636982c(var_35554ae84383490, var_2dbfe016101d4381, var_934379620852e329) {
    var_35554ae84383490 = array_combine(var_35554ae84383490, [0:"hill_time", 1:function_a08fea26a49145a8(0), 2:"contested_hill_time", 3:function_a08fea26a49145a8(12)]);
    return var_35554ae84383490;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3760
// Size: 0x63
function function_20524d471d23d817(var_35554ae84383490, var_2dbfe016101d4381, var_934379620852e329) {
    var_35554ae84383490 = array_combine(var_35554ae84383490, [0:"bombs_planted", 1:var_2dbfe016101d4381["plants"], 2:"bombs_defused", 3:var_2dbfe016101d4381["defuses"], 4:"sneak_defuses", 5:var_2dbfe016101d4381["sneakDefuses"]]);
    return var_35554ae84383490;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37cb
// Size: 0x50
function function_3a0bba2841cc215b(var_35554ae84383490, var_2dbfe016101d4381, var_934379620852e329) {
    var_35554ae84383490 = array_combine(var_35554ae84383490, [0:"total_objectives_captured", 1:var_2dbfe016101d4381["captures"], 2:"objective_tiers_contributed", 3:function_a08fea26a49145a8(8)]);
    return var_35554ae84383490;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3823
// Size: 0x371
function function_e60b22a0532246a9(data) {
    player = data.player;
    if (player iscodcaster()) {
        return;
    }
    var_2dbfe016101d4381 = player.pers;
    var_934379620852e329 = player.var_934379620852e329;
    var_51e6ce77b3d9cc11 = function_c56d015e4cd2e47c(var_2dbfe016101d4381);
    var_22677881bd1351d = var_2dbfe016101d4381["cur_kill_streak"];
    var_367dd5a8d820c25f = 0;
    if (isdefined(var_2dbfe016101d4381["totalDistTraveled"])) {
        var_367dd5a8d820c25f = float(var_2dbfe016101d4381["totalDistTraveled"]);
    }
    var_35554ae84383490 = [0:"player_name", 1:function_1da7bfa6bc897e5e(player), 2:"kills", 3:var_2dbfe016101d4381["kills"], 4:"deaths", 5:var_2dbfe016101d4381["deaths"], 6:"assists", 7:var_2dbfe016101d4381["assists"], 8:"score", 9:var_2dbfe016101d4381["score"], 10:"highest_streak", 11:var_2dbfe016101d4381["longestStreak"], 12:"shots_fired", 13:player function_e42724fbfacff469(0), 14:"shots_hit", 15:player function_e42724fbfacff469(1), 16:"shots_head", 17:var_2dbfe016101d4381["shotsHitHead"], 18:"untraded_kills", 19:player function_815fee43d577e1b6(5), 20:"untraded_deaths", 21:var_2dbfe016101d4381["untradedDeaths"], 22:"traded_kills", 23:var_2dbfe016101d4381["tradedKills"], 24:"traded_deaths", 25:var_2dbfe016101d4381["tradedDeaths"], 26:"inapplicable_traded_kills", 27:var_2dbfe016101d4381["inapplicableTradedKills"], 28:"inapplicable_traded_deaths", 29:var_2dbfe016101d4381["inapplicableTradedDeaths"], 30:"damage_dealt", 31:player function_815fee43d577e1b6(1), 32:"damage_taken", 33:ter_op(isdefined(var_2dbfe016101d4381["damageTaken"]), var_2dbfe016101d4381["damageTaken"], 0), 34:"damage_healed", 35:var_2dbfe016101d4381["damageHealed"], 36:"damage_friend", 37:var_2dbfe016101d4381["friendlyDamageDone"], 38:"tacticals_used", 39:var_2dbfe016101d4381["tacticalsUsed"], 40:"lethals_used", 41:var_2dbfe016101d4381["lethalsUsed"], 42:"time_alive", 43:ter_op(var_2dbfe016101d4381["total_time_alive"] == 0, function_22de454b228d857c(), var_2dbfe016101d4381["total_time_alive"]), 44:"distance_traveled", 45:var_367dd5a8d820c25f, 46:"average_speed", 47:var_51e6ce77b3d9cc11.average_speed, 48:"percent_time_moving", 49:var_51e6ce77b3d9cc11.percent_time_moving, 50:"dead_silence_time", 51:int(var_2dbfe016101d4381["deadSilenceTime"] / 1000)];
    var_21e140b4aaaf4563 = "dlog_event_esports_player_match_end";
    if (isdefined(level.var_b290423f07c0fa3c)) {
        var_21e140b4aaaf4563 = level.var_b290423f07c0fa3c.var_21e140b4aaaf4563;
        var_35554ae84383490 = player [[ level.var_b290423f07c0fa3c.var_d1e945b3a961aee ]](var_35554ae84383490, var_2dbfe016101d4381, player.var_934379620852e329);
    }
    player dlog_recordplayerevent(var_21e140b4aaaf4563, var_35554ae84383490);
    player.var_f038145f52e97ce3.match_end = 1;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b9b
// Size: 0x1d7
function function_c22652f83b317b82() {
    var_78631bfb7b795754 = [];
    foreach (player in level.players) {
        if (!isdefined(player) || player iscodcaster()) {
            continue;
        }
        var_2dbfe016101d4381 = player.pers;
        var_35554ae84383490 = [0:"player_name", 1:function_1da7bfa6bc897e5e(player), 2:"origin", 3:function_a3d4800b4cb51b38(player.origin), 4:"viewangles", 5:function_a3d4800b4cb51b38(player getplayerangles())];
        if (isdefined(level.var_f8fa0c6bb4b9de4e)) {
            var_35554ae84383490 = player [[ level.var_f8fa0c6bb4b9de4e.var_d1e945b3a961aee ]](var_35554ae84383490);
        }
        var_1f934bfc41f3a853 = spawnstruct();
        var_1f934bfc41f3a853.player = player;
        var_1f934bfc41f3a853.event = var_35554ae84383490;
        var_78631bfb7b795754 = array_add(var_78631bfb7b795754, var_1f934bfc41f3a853);
    }
    var_21e140b4aaaf4563 = "dlog_event_esports_player_interval_info";
    if (isdefined(level.var_f8fa0c6bb4b9de4e)) {
        var_21e140b4aaaf4563 = level.var_f8fa0c6bb4b9de4e.var_21e140b4aaaf4563;
    }
    foreach (var_1f934bfc41f3a853 in var_78631bfb7b795754) {
        player = var_1f934bfc41f3a853.player;
        if (!isdefined(player)) {
            continue;
        }
        player dlog_recordplayerevent(var_21e140b4aaaf4563, var_1f934bfc41f3a853.event);
        waitframe();
    }
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d79
// Size: 0x87
function function_1b1ee2699a6a524c(var_35554ae84383490, var_2dbfe016101d4381, var_934379620852e329) {
    var_35554ae84383490 = array_combine(var_35554ae84383490, [0:"bombs_planted", 1:var_2dbfe016101d4381["plants"] - var_934379620852e329.bombs_planted, 2:"bombs_defused", 3:var_2dbfe016101d4381["defuses"] - var_934379620852e329.bombs_defused, 4:"sneak_defuses", 5:var_2dbfe016101d4381["sneakDefuses"] - var_934379620852e329.sneak_defuses]);
    return var_35554ae84383490;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e08
// Size: 0x48
function function_7b9680c1e187bd00(var_35554ae84383490, var_2dbfe016101d4381, var_934379620852e329) {
    var_35554ae84383490 = array_combine(var_35554ae84383490, [0:"tiers_captured", 1:function_a08fea26a49145a8(8) - var_934379620852e329.tiers_captured]);
    return var_35554ae84383490;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e58
// Size: 0x4d2
function function_49472736af222fcc(data) {
    player = data.player;
    if (player iscodcaster() || !isroundbased()) {
        return;
    }
    player function_d21dfe417b65b64a();
    var_2dbfe016101d4381 = player.pers;
    var_934379620852e329 = player.var_934379620852e329;
    var_22677881bd1351d = var_2dbfe016101d4381["cur_kill_streak"];
    var_51e6ce77b3d9cc11 = player function_3ddc4f55dfe66ebb();
    distance_traveled = 0;
    if (isdefined(var_2dbfe016101d4381["totalDistTraveled"])) {
        distance_traveled = float(var_2dbfe016101d4381["totalDistTraveled"]);
    }
    var_35554ae84383490 = [0:"player_name", 1:function_1da7bfa6bc897e5e(player), 2:"round_number", 3:function_b6c29e08764ae361(), 4:"round_won", 5:ter_op(isdefined(player.team) && data.winner == player.team, 1, 0), 6:"kills", 7:var_2dbfe016101d4381["kills"] - var_934379620852e329.kills, 8:"deaths", 9:var_2dbfe016101d4381["deaths"] - var_934379620852e329.deaths, 10:"assists", 11:var_2dbfe016101d4381["assists"] - var_934379620852e329.assists, 12:"score", 13:var_2dbfe016101d4381["score"] - var_934379620852e329.score, 14:"highest_streak", 15:var_2dbfe016101d4381["longestStreak"], 16:"shots_fired", 17:player function_e42724fbfacff469(0) - var_934379620852e329.shots_fired, 18:"shots_hit", 19:player function_e42724fbfacff469(1) - var_934379620852e329.shots_hit, 20:"shots_head", 21:var_2dbfe016101d4381["shotsHitHead"] - var_934379620852e329.shots_head, 22:"untraded_kills", 23:player function_815fee43d577e1b6(5) - var_934379620852e329.untraded_kills, 24:"untraded_deaths", 25:var_2dbfe016101d4381["untradedDeaths"] - var_934379620852e329.untraded_deaths, 26:"traded_kills", 27:var_2dbfe016101d4381["tradedKills"] - var_934379620852e329.traded_kills, 28:"traded_deaths", 29:var_2dbfe016101d4381["tradedDeaths"] - var_934379620852e329.traded_deaths, 30:"inapplicable_traded_kills", 31:var_2dbfe016101d4381["inapplicableTradedKills"] - var_934379620852e329.inapplicable_traded_kills, 32:"inapplicable_traded_deaths", 33:var_2dbfe016101d4381["inapplicableTradedDeaths"] - var_934379620852e329.inapplicable_traded_deaths, 34:"damage_dealt", 35:player function_815fee43d577e1b6(1) - var_934379620852e329.damage_dealt, 36:"damage_taken", 37:ter_op(isdefined(var_2dbfe016101d4381["damageTaken"]), var_2dbfe016101d4381["damageTaken"], 0) - var_934379620852e329.damage_taken, 38:"damage_healed", 39:var_2dbfe016101d4381["damageHealed"] - var_934379620852e329.damage_healed, 40:"damage_friend", 41:var_2dbfe016101d4381["friendlyDamageDone"] - var_934379620852e329.damage_friend, 42:"tacticals_used", 43:var_2dbfe016101d4381["tacticalsUsed"] - var_934379620852e329.tacticals_used, 44:"lethals_used", 45:var_2dbfe016101d4381["lethalsUsed"] - var_934379620852e329.lethals_used, 46:"time_alive", 47:ter_op(var_2dbfe016101d4381["total_time_alive"] == 0, function_22de454b228d857c(), var_2dbfe016101d4381["total_time_alive"]) - var_934379620852e329.time_alive, 48:"distance_traveled", 49:distance_traveled - var_934379620852e329.distance_traveled, 50:"average_speed", 51:var_51e6ce77b3d9cc11.average_speed, 52:"percent_time_moving", 53:var_51e6ce77b3d9cc11.percent_time_moving, 54:"dead_silence_time", 55:int((var_2dbfe016101d4381["deadSilenceTime"] - var_934379620852e329.dead_silence_time) / 1000)];
    var_21e140b4aaaf4563 = "dlog_event_esports_player_round_end";
    if (isdefined(level.var_9f33f41b213a1be7)) {
        var_21e140b4aaaf4563 = level.var_9f33f41b213a1be7.var_21e140b4aaaf4563;
        var_35554ae84383490 = player [[ level.var_9f33f41b213a1be7.var_d1e945b3a961aee ]](var_35554ae84383490, var_2dbfe016101d4381, var_934379620852e329);
    }
    player dlog_recordplayerevent(var_21e140b4aaaf4563, var_35554ae84383490);
    player.var_f038145f52e97ce3.round_end = 1;
}

// Namespace namespace_ecb54f1ef997b69f/namespace_30dbbb8647994e6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4331
// Size: 0x2cf
function function_c82d72ebcdb14059(data) {
    player = data.player;
    if (player iscodcaster()) {
        return;
    }
    struct = data.struct;
    killstreaks = [0:struct.loadoutkillstreak1, 1:struct.loadoutkillstreak2, 2:struct.loadoutkillstreak3];
    field_upgrades = [0:struct.loadoutfieldupgrade1, 1:struct.loadoutfieldupgrade2];
    perks = struct.loadoutperks;
    if (isdefined(struct.var_15f3e6df722fb1cf) && struct.var_15f3e6df722fb1cf != "none" && !perkisrestricted(struct.var_15f3e6df722fb1cf)) {
        perks = array_add(perks, struct.var_15f3e6df722fb1cf);
    }
    if (isdefined(struct.var_15f3e5df722faf9c) && struct.var_15f3e5df722faf9c != "none" && !perkisrestricted(struct.var_15f3e5df722faf9c)) {
        perks = array_add(perks, struct.var_15f3e5df722faf9c);
    }
    primary_weapon_attachments = [0:"none"];
    if (isdefined(struct.loadoutprimaryattachments) && struct.loadoutprimaryattachments.size > 0) {
        primary_weapon_attachments = struct.loadoutprimaryattachments;
    }
    secondary_weapon_attachments = [0:"none"];
    if (isdefined(struct.loadoutsecondaryattachments) && struct.loadoutsecondaryattachments.size > 0) {
        secondary_weapon_attachments = struct.loadoutsecondaryattachments;
    }
    if (istrue(level.var_9e090a159cb48220)) {
    }
    var_35554ae84383490 = [0:"player_name", 1:function_1da7bfa6bc897e5e(player), 2:"primary_weapon", 3:struct.loadoutprimary, 4:"primary_weapon_attachments", 5:primary_weapon_attachments, 6:"secondary_weapon", 7:struct.loadoutsecondary, 8:"secondary_weapon_attachments", 9:secondary_weapon_attachments, 10:"primary_grenade", 11:struct.loadoutequipmentprimary, 12:"secondary_grenade", 13:struct.loadoutequipmentsecondary, 14:"field_upgrades", 15:field_upgrades, 16:"streaks", 17:killstreaks, 18:"perks", 19:perks, 20:"match_time", 21:function_22de454b228d857c()];
    player dlog_recordplayerevent("dlog_event_esports_player_loadout_changed", var_35554ae84383490);
}

