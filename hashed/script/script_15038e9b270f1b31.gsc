// mwiii decomp prototype
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_2c3a8b16eb34bd6;

// Namespace namespace_2c3a8b16eb34bd6/namespace_eca7530e5715bb19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132
// Size: 0xb6
function init() {
    if (getdvarint(@"hash_a6b52f16f3853a9a", 0) == 0) {
        return;
    }
    level.var_bf269015710de2dd = 1;
    level.var_8ed22c88753f7445 = getdvarint(@"hash_2401fbc45a4682a5", 100);
    level.var_a4dab5000eca4682 = getdvarint(@"hash_3fd4f18a01c87ce2", 10);
    level.var_be6c4a2a3ea18574 = 0;
    level.var_373b806b04381d6f = 0;
    namespace_71073fa38f11492::registerbrgametypefunc("updatePlayerAndTeamCountUI", &function_806ad317de2af4f3);
    namespace_71073fa38f11492::registerbrgametypefunc("onPlayerKilled", &function_6436c089f777048b);
    namespace_71073fa38f11492::registerbrgametypefunc("onPlayerConnect", &function_f5fd598a80445d04);
    namespace_71073fa38f11492::registerbrgametypefunc("onPlayerDisconnect", &function_98b1fbbdd7377898);
    level thread watchprematchdone();
}

// Namespace namespace_2c3a8b16eb34bd6/namespace_eca7530e5715bb19
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef
// Size: 0x246
function function_806ad317de2af4f3(aliveplayercount, var_a4c3a5afe5b8da9b) {
    totalplayers = level.players.size;
    aliveplayercount = 0;
    var_35068b9b9dc4c73f = 0;
    var_a4c3a5afe5b8da9b = [];
    for (i = 0; i < totalplayers; i++) {
        player = level.players[i];
        if (player namespace_d20f8ef223912e12::function_7dbb8165d792b06c()) {
            continue;
        }
        if (!istrue(player.br_iseliminated)) {
            if (istrue(player.iszombie)) {
                var_35068b9b9dc4c73f++;
            } else {
                aliveplayercount++;
                var_a4c3a5afe5b8da9b[player.team] = 1;
            }
        }
        if (!isdefined(var_a4c3a5afe5b8da9b[player.team])) {
            result = namespace_71073fa38f11492::runbrgametypefunc("isTeamEliminated", player.team);
            if (isdefined(result)) {
                if (!result) {
                    var_a4c3a5afe5b8da9b[player.team] = 1;
                }
            }
        }
    }
    foreach (uibot in namespace_d20f8ef223912e12::function_749723c2a45a0233()) {
        aliveplayercount++;
        var_a4c3a5afe5b8da9b[uibot.team] = 1;
    }
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        activeteamcount = int(var_a4c3a5afe5b8da9b.size + level.var_8ed22c88753f7445 / namespace_36f464722d326bbe::function_4fb37368ae3585bb());
        aliveplayercount = int(aliveplayercount + level.var_8ed22c88753f7445);
    } else {
        activeteamcount = int(var_a4c3a5afe5b8da9b.size + level.var_be6c4a2a3ea18574 / namespace_36f464722d326bbe::function_4fb37368ae3585bb());
        aliveplayercount = int(aliveplayercount + level.var_be6c4a2a3ea18574);
    }
    level.var_373b806b04381d6f = activeteamcount;
    /#
        var_6837562bca96ad34 = int(pow(2, 8)) - 1;
        /#
            assert(var_35068b9b9dc4c73f <= var_6837562bca96ad34);
        #/
        /#
            assert(aliveplayercount <= var_6837562bca96ad34);
        #/
        /#
            assert(var_a4c3a5afe5b8da9b.size <= var_6837562bca96ad34);
        #/
    #/
    var_47bf15e70ee220a = (var_35068b9b9dc4c73f << 16) + (activeteamcount << 8) + aliveplayercount;
    setomnvar("ui_br_match_stats", var_47bf15e70ee220a);
}

// Namespace namespace_2c3a8b16eb34bd6/namespace_eca7530e5715bb19
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c
// Size: 0x23
function function_6436c089f777048b(var_642470e1abc1bbf9) {
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        level thread function_479d3f9aaf4e3bf0();
    }
}

// Namespace namespace_2c3a8b16eb34bd6/namespace_eca7530e5715bb19
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x466
// Size: 0xde
function function_f5fd598a80445d04(player) {
    var_92247b35cd23dbec = level.players.size - level.var_a4dab5000eca4682;
    if (var_92247b35cd23dbec > 0) {
        var_e4762082ef346678 = level.var_8ed22c88753f7445 / getdvarint(@"hash_818c699a5caaee4f", 1);
    } else {
        var_e4762082ef346678 = 0;
    }
    if (var_e4762082ef346678 <= 0) {
        return;
    }
    totalplayers = level.players.size;
    var_f5439adc07558e92 = level.var_8ed22c88753f7445 + totalplayers;
    for (i = 0; i < var_e4762082ef346678; i++) {
        level.var_be6c4a2a3ea18574 = min(var_f5439adc07558e92, level.var_be6c4a2a3ea18574 + 1);
        namespace_d20f8ef223912e12::updateplayerandteamcountui();
        if (level.var_8ed22c88753f7445 <= 0) {
            return;
        }
    }
    namespace_d20f8ef223912e12::updateplayerandteamcountui();
}

// Namespace namespace_2c3a8b16eb34bd6/namespace_eca7530e5715bb19
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54b
// Size: 0x2f
function function_98b1fbbdd7377898(player) {
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        level thread function_479d3f9aaf4e3bf0();
        return;
    }
    level thread function_479d3f9aaf4e3bf0(1);
}

// Namespace namespace_2c3a8b16eb34bd6/namespace_eca7530e5715bb19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x581
// Size: 0x1b
function function_397f011c8120ea71() {
    self setclientomnvar("ui_br_player_position", level.var_373b806b04381d6f + 1);
}

// Namespace namespace_2c3a8b16eb34bd6/namespace_eca7530e5715bb19
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a3
// Size: 0x73
function watchprematchdone() {
    namespace_d20f8ef223912e12::updateplayerandteamcountui();
    level waittill("prematch_over");
    level.var_e4762082ef346678 = undefined;
    level.var_be6c4a2a3ea18574 = undefined;
    var_43b93f9cb6d3a779 = level.players.size - level.var_a4dab5000eca4682;
    if (var_43b93f9cb6d3a779 > 0) {
        level.var_aefac0c879f41d97 = level.var_8ed22c88753f7445 / var_43b93f9cb6d3a779;
    } else {
        level.var_8ed22c88753f7445 = 0;
    }
    namespace_d20f8ef223912e12::updateplayerandteamcountui();
}

// Namespace namespace_2c3a8b16eb34bd6/namespace_eca7530e5715bb19
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61d
// Size: 0xa5
function function_479d3f9aaf4e3bf0(bimmediate) {
    if (level.var_8ed22c88753f7445 <= 0) {
        return;
    }
    var_92e1f1e24bf5febd = namespace_3c37cb17ade254d::ter_op(namespace_4b0406965e556711::gameflag("prematch_done"), level.var_aefac0c879f41d97, level.var_e4762082ef346678);
    if (!isdefined(var_92e1f1e24bf5febd)) {
        return;
    }
    for (i = 0; i < var_92e1f1e24bf5febd; i++) {
        if (!istrue(bimmediate)) {
            wait(randomfloat(5));
        }
        level.var_8ed22c88753f7445 = max(0, level.var_8ed22c88753f7445 - 1);
        namespace_d20f8ef223912e12::updateplayerandteamcountui();
        if (level.var_8ed22c88753f7445 <= 0) {
            return;
        }
    }
}

// Namespace namespace_2c3a8b16eb34bd6/namespace_eca7530e5715bb19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c9
// Size: 0x81
function getalivecount() {
    totalplayers = level.players.size;
    aliveplayercount = 0;
    for (i = 0; i < totalplayers; i++) {
        player = level.players[i];
        if (player namespace_d20f8ef223912e12::function_7dbb8165d792b06c()) {
            continue;
        }
        if (!istrue(player.br_iseliminated)) {
            if (!istrue(player.iszombie)) {
                aliveplayercount++;
            }
        }
    }
    return aliveplayercount;
}

