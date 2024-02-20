// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using script_37d9a569491ff1e0;
#using script_54a9e44119886147;

#namespace combat;

// Namespace combat/namespace_784dc078726182cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90
// Size: 0xe
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14);
}

// Namespace combat/namespace_784dc078726182cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6
// Size: 0x21b
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
    foreach (player in var_fdf6f26abee82b42.result) {
        /#
            if (!isai(player) && getdvar(@"hash_e39c6d129db1722") == "<unknown string>") {
                goto LOC_000001ee;
            }
        #/
        distancetoplayer = distance(bot.origin, player.origin);
        if (distancetoplayer <= 1) {
            continue;
        }
        score = 0;
        basescore = function_9d1ab012058221bb(distancetoplayer, self.constants.var_96af88c97db9ed21, self.constants.var_49e2976ca0c853ef);
        if (bot function_3569a4bec8b9af17(player)) {
            score = basescore + self.constants.var_ed9b346626f27a7f;
        } else if (bot botcanseeentity(player)) {
            score = basescore;
        } else if (distancetoplayer < self.constants.var_5dcbc5ccec64f7de) {
            var_c2c14ddfada133f3 = function_9d1ab012058221bb(distancetoplayer, self.constants.var_e3d1cf896f26ee33, self.constants.var_85a0650f30c0b0b9);
            score = basescore + var_c2c14ddfada133f3;
        }
        if (score > var_72bb89e60d3674df) {
            var_72bb89e60d3674df = score;
            target = player;
        LOC_000001ee:
        }
    LOC_000001ee:
    }
    if (isdefined(target)) {
        self.var_df9d35d9b4bee654 = namespace_41cf72abc6042f25::createaction(target);
    }
    return var_72bb89e60d3674df;
}

