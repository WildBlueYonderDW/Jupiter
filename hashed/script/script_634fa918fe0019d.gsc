// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using script_40e63dd222434655;
#using scripts\engine\utility.gsc;
#using script_37d9a569491ff1e0;
#using scripts\mp\gamelogic.gsc;
#using script_4c9bd9a3bf3f8cf7;
#using script_54a9e44119886147;
#using scripts\mp\utility\teams.gsc;

#namespace combat;

// Namespace combat/namespace_9cdb9a9d76703787
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd
// Size: 0x12
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, undefined, 500);
}

// Namespace combat/namespace_9cdb9a9d76703787
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7
// Size: 0x4d8
function function_e0844a2b7f904b14(bot) {
    /#
        if (getdvar(@"hash_e39c6d129db1722") == "<unknown string>") {
            return 0;
        }
    #/
    var_72bb89e60d3674df = 0;
    target = undefined;
    var_fdf6f26abee82b42 = bot namespace_5524884c16a95af2::function_7e7ddfa33eff2c11();
    var_fdf6f26abee82b42 namespace_5524884c16a95af2::function_2f1735d1cb737a0c(bot);
    var_fdf6f26abee82b42 namespace_5524884c16a95af2::function_8500e6ae452b1e19(self.constants.var_93102c55f2858271);
    var_1147bbc93ea9b83c = namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c();
    var_66b33f71b3567ef3 = 0;
    if (var_fdf6f26abee82b42.result.size > 0) {
        var_4246ca4ed25d36ca = function_1c51f7c46a848ddd();
        var_66b33f71b3567ef3 = function_9d1ab012058221bb(var_4246ca4ed25d36ca, self.constants.var_e23500dbd314bae2, self.constants.var_58e441d166562d6e);
    }
    foreach (player in var_fdf6f26abee82b42.result) {
        /#
            if (!isai(player) && getdvar(@"hash_e39c6d129db1722") == "<unknown string>") {
                goto LOC_000004ab;
            }
        #/
        if (distance(bot.origin, player.origin) <= 1) {
            continue;
        }
        if (!bot function_42266a7fd7932c50(player)) {
            continue;
        }
        score = 0;
        distancetoplayer = distance(bot.origin, player.origin);
        basescore = function_9d1ab012058221bb(distancetoplayer, self.constants.var_96af88c97db9ed21, self.constants.var_49e2976ca0c853ef);
        var_fa059f2b79794081 = bot function_3569a4bec8b9af17(player);
        if (var_fa059f2b79794081) {
            basescore = basescore + function_9d1ab012058221bb(distancetoplayer, self.constants.var_96af88c97db9ed21, self.constants.var_e3f6d868f3c297b2);
        }
        if (var_1147bbc93ea9b83c) {
            score = basescore;
        } else if (var_fa059f2b79794081 || bot botcanseeentity(player)) {
            score = basescore + var_66b33f71b3567ef3;
        } else if (isai(player) && distancetoplayer < self.constants.var_dfdfb13389358aee && !player namespace_c50b30148766aa59::function_6f6c5cb39cd095b0()) {
            var_c2c14ddfada133f3 = function_9d1ab012058221bb(distancetoplayer, self.constants.var_e3d1cf896f26ee33, self.constants.var_85a0650f30c0b0b9);
            score = basescore + var_66b33f71b3567ef3 + var_c2c14ddfada133f3;
        } else if (function_699bb9f5414b2149(bot, player)) {
            var_c2c14ddfada133f3 = function_9d1ab012058221bb(distancetoplayer, self.constants.var_e3d1cf896f26ee33, self.constants.var_85a0650f30c0b0b9);
            score = basescore + var_66b33f71b3567ef3 + var_c2c14ddfada133f3;
            score = score * self.constants.var_d066abbf0bc74501;
        } else if (!isai(player)) {
            if (istrue(player.var_e54cc9323d3dc44e) && isdefined(self.constants.var_891066f3bc70edcb)) {
                var_df2e5586f7d31f26 = function_9d1ab012058221bb(distancetoplayer, self.constants.var_891066f3bc70edcb, self.constants.var_55bf1eec1bfddf31);
                score = basescore + var_df2e5586f7d31f26;
            }
            if (isdefined(level.br_circle) && isdefined(level.br_circle.var_5b8569581e64d55a) && !istrue(player.var_e54cc9323d3dc44e)) {
                var_f9c2d49eef2bd3e2 = (gettime() - level.br_circle.var_5b8569581e64d55a) / 1000;
                var_3c1eda8db07ec036 = function_9d1ab012058221bb(var_f9c2d49eef2bd3e2, self.constants.var_115b29b18485de3, self.constants.var_631e50e6ec9a24a8);
                if (player.kills < var_3c1eda8db07ec036) {
                    score = function_9d1ab012058221bb(distancetoplayer, self.constants.var_36d2e5e6b1e19a3, self.constants.var_f1ff9682c42f2749);
                }
            }
        }
        if (istrue(player.inlaststand)) {
            score = score + self.constants.var_a05aca4daa9a3d42;
        }
        if (score > var_72bb89e60d3674df) {
            var_72bb89e60d3674df = score;
            target = player;
        LOC_000004ab:
        }
    LOC_000004ab:
    }
    if (isdefined(target)) {
        self.var_df9d35d9b4bee654 = namespace_41cf72abc6042f25::createaction(target);
    }
    return var_72bb89e60d3674df;
}

// Namespace combat/namespace_9cdb9a9d76703787
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b7
// Size: 0xb2
function function_699bb9f5414b2149(bot, player) {
    bots = namespace_54d20dd0dd79277f::getteamdata(bot.team, "alivePlayers");
    foreach (teammate in bots) {
        if (teammate == bot || !isvalidplayer(teammate)) {
            continue;
        }
        if (isdefined(teammate.scriptenemy) && teammate.scriptenemy == player) {
            return 1;
        }
    }
    return 0;
}

