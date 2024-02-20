// mwiii decomp prototype
#using script_5605739161b1abe1;
#using script_7f9409b703dad400;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_f2d7643150dc97c5;

// Namespace namespace_f2d7643150dc97c5/namespace_6c57c664b4288f88
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7
// Size: 0x1ca
function function_93c8f90c3bd798c6(player, time_limit, var_4ea4be40a64ebe92) {
    level.var_5a107145d8e88c36 = namespace_24428050bb4409f8::register();
    if (!isdefined(time_limit)) {
        time_limit = 60;
    }
    if (isdefined(var_4ea4be40a64ebe92)) {
        /#
            assert(isfunction(var_4ea4be40a64ebe92));
        #/
    }
    timer = namespace_26c5a699d7cb84a2::function_3eec8a169e8a0936(time_limit);
    player function_37a354eaca18f977();
    waitframe();
    var_8aee502858e9f86d = 0;
    var_3292a1fe7c25743d = 0;
    while (isdefined(player) && timer.var_84ceb983b1ef5f11 != 1) {
        n_time_remaining = int(timer.var_621cb2c0d9b1cdae);
        var_26d5115774db834b = namespace_54d20dd0dd79277f::getSquadmates(player.team, player.var_ff97225579de16a, 1);
        foreach (var_3851e2de41e0caa9 in var_26d5115774db834b) {
            level.var_5a107145d8e88c36 namespace_24428050bb4409f8::function_1ef9fa70a14ba51b(var_3851e2de41e0caa9, n_time_remaining);
        }
        player function_71f5ca5c18a5f049();
        if (player function_5c26462346bcd200()) {
            var_8aee502858e9f86d = player function_5d49e814d8224111();
            if (var_8aee502858e9f86d) {
                level.var_5a107145d8e88c36 namespace_24428050bb4409f8::function_ac275402bbe52c1b(player, 2);
                player thread function_8ce14e667ba9642d(5);
                var_3292a1fe7c25743d = 1;
                if (isdefined(var_4ea4be40a64ebe92)) {
                    self [[ var_4ea4be40a64ebe92 ]](player);
                }
            } else {
                level.var_5a107145d8e88c36 namespace_24428050bb4409f8::function_ac275402bbe52c1b(player, 3);
            }
            break;
        }
        wait(0.5);
    }
    timer.var_84ceb983b1ef5f11 = 1;
    if (!var_3292a1fe7c25743d) {
        player thread function_8ce14e667ba9642d(0);
    }
    return var_8aee502858e9f86d;
}

// Namespace namespace_f2d7643150dc97c5/namespace_6c57c664b4288f88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a9
// Size: 0x55
function function_daaf62a5c884f34d(var_aa3a3c9a338ea9bc) {
    if (isdefined(var_aa3a3c9a338ea9bc.vote)) {
        newcount = var_aa3a3c9a338ea9bc.vote.var_886c13c5570d7163 + 1;
        var_aa3a3c9a338ea9bc.vote.var_886c13c5570d7163 = newcount;
    }
}

// Namespace namespace_f2d7643150dc97c5/namespace_6c57c664b4288f88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x305
// Size: 0x55
function function_89edd64ed9997ba7(var_aa3a3c9a338ea9bc) {
    if (isdefined(var_aa3a3c9a338ea9bc.vote)) {
        newcount = var_aa3a3c9a338ea9bc.vote.var_4eefc9bbadaeddf5 + 1;
        var_aa3a3c9a338ea9bc.vote.var_4eefc9bbadaeddf5 = newcount;
    }
}

// Namespace namespace_f2d7643150dc97c5/namespace_6c57c664b4288f88
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x361
// Size: 0x9c
function function_5dffe49ad4961546(playercount, var_89fa914f93f1284) {
    player = self;
    if (!isdefined(player.vote)) {
        player.vote = spawnstruct();
    }
    player.vote.var_886c13c5570d7163 = 0;
    player.vote.var_4eefc9bbadaeddf5 = 0;
    player.vote.playercount = playercount;
    player.vote.var_89fa914f93f1284 = var_89fa914f93f1284;
}

// Namespace namespace_f2d7643150dc97c5/namespace_6c57c664b4288f88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x404
// Size: 0xb1
function function_5c26462346bcd200() {
    player = self;
    var_faa232f024c0838e = 0;
    if (isdefined(player.vote)) {
        var_d324c1705a394d66 = player.vote.var_886c13c5570d7163 + player.vote.var_4eefc9bbadaeddf5;
        if (var_d324c1705a394d66 >= player.vote.playercount) {
            var_faa232f024c0838e = 1;
        }
        if (player.vote.var_886c13c5570d7163 >= player.vote.var_89fa914f93f1284) {
            var_faa232f024c0838e = 1;
        }
    }
    return var_faa232f024c0838e;
}

// Namespace namespace_f2d7643150dc97c5/namespace_6c57c664b4288f88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bd
// Size: 0x135
function function_71f5ca5c18a5f049() {
    player = self;
    if (isdefined(player) && isdefined(player.vote)) {
        var_9b0dd04874627a99 = namespace_54d20dd0dd79277f::getSquadmates(player.team, player.var_ff97225579de16a, 1);
        var_3cfd3771899bec37 = player.vote.var_89fa914f93f1284 - player.vote.var_886c13c5570d7163;
        if (var_3cfd3771899bec37 > 0) {
            foreach (member in var_9b0dd04874627a99) {
                level.var_5a107145d8e88c36 namespace_24428050bb4409f8::function_ab84ca85d11789c7(member, var_3cfd3771899bec37);
            }
        } else {
            foreach (member in var_9b0dd04874627a99) {
                level.var_5a107145d8e88c36 namespace_24428050bb4409f8::function_ac275402bbe52c1b(member, 2);
            }
        }
    }
}

// Namespace namespace_f2d7643150dc97c5/namespace_6c57c664b4288f88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f9
// Size: 0x3a
function function_5d49e814d8224111() {
    player = self;
    return player.vote.var_886c13c5570d7163 >= player.vote.var_89fa914f93f1284;
}

// Namespace namespace_f2d7643150dc97c5/namespace_6c57c664b4288f88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63b
// Size: 0xbf
function function_829515bd62609e2c(var_aa3a3c9a338ea9bc) {
    player = self;
    player notify("zm_vote_ended");
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("zm_vote_submitted");
    player endon("zm_vote_ended");
    while (1) {
        value = channel = player waittill("luinotifyserver");
        if (channel == "zm_vote") {
            var_b434100cc238d90f = 0;
            if (value == 1) {
                function_daaf62a5c884f34d(var_aa3a3c9a338ea9bc);
                var_b434100cc238d90f = 1;
            } else if (value == 2) {
                function_89edd64ed9997ba7(var_aa3a3c9a338ea9bc);
                var_b434100cc238d90f = 1;
            }
            if (var_b434100cc238d90f) {
                level.var_5a107145d8e88c36 namespace_24428050bb4409f8::function_314fcf75686668fe(player, value);
                player notify("zm_vote_submitted");
            }
        }
    }
}

// Namespace namespace_f2d7643150dc97c5/namespace_6c57c664b4288f88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x701
// Size: 0xf2
function function_3e2db14d74da95e7(a_players) {
    player = self;
    playercount = a_players.size;
    var_89fa914f93f1284 = floor(playercount / 2) + 1;
    player function_5dffe49ad4961546(playercount, var_89fa914f93f1284);
    foreach (var_21f3ac6299122ba7 in a_players) {
        if (!level.var_5a107145d8e88c36 namespace_24428050bb4409f8::is_open(var_21f3ac6299122ba7)) {
            var_21f3ac6299122ba7 thread function_829515bd62609e2c(player);
            level.var_5a107145d8e88c36 namespace_24428050bb4409f8::open(var_21f3ac6299122ba7);
            level.var_5a107145d8e88c36 namespace_24428050bb4409f8::function_ab84ca85d11789c7(var_21f3ac6299122ba7, var_89fa914f93f1284);
            level.var_5a107145d8e88c36 namespace_24428050bb4409f8::function_ac275402bbe52c1b(var_21f3ac6299122ba7, 1);
            level.var_5a107145d8e88c36 namespace_24428050bb4409f8::function_314fcf75686668fe(var_21f3ac6299122ba7, 0);
        }
    }
}

// Namespace namespace_f2d7643150dc97c5/namespace_6c57c664b4288f88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fa
// Size: 0x45
function function_37a354eaca18f977() {
    player = self;
    if (isdefined(player)) {
        var_9b0dd04874627a99 = namespace_54d20dd0dd79277f::getSquadmates(player.team, player.var_ff97225579de16a, 1);
        function_3e2db14d74da95e7(var_9b0dd04874627a99);
    }
}

// Namespace namespace_f2d7643150dc97c5/namespace_6c57c664b4288f88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x846
// Size: 0x8f
function function_47f6a44a599fa91d(a_players) {
    foreach (player in a_players) {
        if (level.var_5a107145d8e88c36 namespace_24428050bb4409f8::is_open(player)) {
            level.var_5a107145d8e88c36 namespace_24428050bb4409f8::function_ac275402bbe52c1b(player, 0);
            level.var_5a107145d8e88c36 namespace_24428050bb4409f8::close(player);
            player notify("zm_vote_ended");
        }
    }
}

// Namespace namespace_f2d7643150dc97c5/namespace_6c57c664b4288f88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dc
// Size: 0x50
function function_8ce14e667ba9642d(delay) {
    wait(delay);
    player = self;
    if (isdefined(player)) {
        var_9b0dd04874627a99 = namespace_54d20dd0dd79277f::getSquadmates(player.team, player.var_ff97225579de16a, 1);
        function_47f6a44a599fa91d(var_9b0dd04874627a99);
    }
}

