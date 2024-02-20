// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_37d9a569491ff1e0;
#using scripts\mp\killstreaks\killstreaks.gsc;

#namespace namespace_619d5f568d2b0d6a;

// Namespace namespace_619d5f568d2b0d6a/namespace_afdc3db19e194d5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7
// Size: 0xe
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14);
}

// Namespace namespace_619d5f568d2b0d6a/namespace_afdc3db19e194d5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd
// Size: 0x242
function function_e0844a2b7f904b14(bot) {
    var_d9f03ce835ee985b = "toma_strike";
    if (!bot function_81b00a2ba10c143a(var_d9f03ce835ee985b)) {
        var_d9f03ce835ee985b = "precision_airstrike";
        if (!bot function_81b00a2ba10c143a(var_d9f03ce835ee985b)) {
            return 0;
        }
    }
    maxscore = 0;
    target = undefined;
    var_fdf6f26abee82b42 = bot namespace_5524884c16a95af2::function_7e7ddfa33eff2c11();
    var_fdf6f26abee82b42 namespace_5524884c16a95af2::function_2f1735d1cb737a0c(bot);
    var_fdf6f26abee82b42 namespace_5524884c16a95af2::function_8500e6ae452b1e19(self.constants.var_6b536e17b179b18c);
    foreach (player in var_fdf6f26abee82b42.result) {
        if (isdefined(self.constants.var_39e02a8a79b6ba4c)) {
            switch (self.constants.var_39e02a8a79b6ba4c) {
            case #"hash_2138836c1b32895e":
                if (!isbot(player)) {
                    goto LOC_000001c2;
                }
                break;
            case #"hash_207629acc9a1e5a":
                if (isbot(player)) {
                    goto LOC_000001c2;
                }
                break;
            default:
                break;
            }
        }
        if (player function_f3b2bb1e37a0abae() && bot botcanseeentity(player)) {
            distancetoplayer = distance(bot.origin, player.origin);
            var_54e0ab2472351543 = function_9d1ab012058221bb(distancetoplayer, self.constants.var_ca44fa65dc21651a, self.constants.var_e6f117499091fd02);
            if (var_54e0ab2472351543 > maxscore) {
                maxscore = var_54e0ab2472351543;
                target = player;
            LOC_000001c2:
            }
        LOC_000001c2:
        }
    LOC_000001c2:
    }
    if (isdefined(target)) {
        /#
            line(bot.origin, target.origin, (1, 0, 0), 1, 0, 600);
        #/
        self.var_df9d35d9b4bee654 = createaction(target.origin, var_d9f03ce835ee985b);
        return (self.constants.basescore + maxscore);
    }
    return 0;
}

// Namespace namespace_619d5f568d2b0d6a/namespace_afdc3db19e194d5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x347
// Size: 0x89
function function_f3b2bb1e37a0abae() {
    var_c7d42b381ba6869c = 20;
    if (!isdefined(self.var_3c6ae4971df01a1f) || gettime() >= self.var_3c6ae4971df01a1f + var_c7d42b381ba6869c) {
        self.var_3c6ae4971df01a1f = gettime();
        self.var_5eb7151348570383 = self sightconetrace((self.origin[0], self.origin[1], 6000)) > 0;
    }
    /#
        assert(isdefined(self.var_5eb7151348570383));
    #/
    return self.var_5eb7151348570383;
}

// Namespace namespace_619d5f568d2b0d6a/namespace_afdc3db19e194d5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d8
// Size: 0x4c
function createaction(targetpos, var_ebfc9454321cb5c3) {
    return function_ff35a4d756374ede("Killstreak air_strike", targetpos, "upper body", var_ebfc9454321cb5c3 + ":" + targetpos[0] + "," + targetpos[1] + "," + targetpos[2], &function_35671b7b1a04bf58, self);
}

// Namespace namespace_619d5f568d2b0d6a/namespace_afdc3db19e194d5c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42c
// Size: 0xa1
function function_35671b7b1a04bf58(bot) {
    if (bot function_81b00a2ba10c143a("precision_airstrike")) {
        var_ba0a9212a8d8504f = randomintrange(200, 420);
        var_b2c06d4a5f630779 = (var_ba0a9212a8d8504f * random([0:-1, 1:1]), var_ba0a9212a8d8504f * random([0:-1, 1:1]), 0);
        bot.kstargetlocation = self.var_ec02147fee952ce2 + var_b2c06d4a5f630779;
    } else {
        bot.kstargetlocation = self.var_ec02147fee952ce2;
    }
    bot namespace_58a74e7d54b56e8d::dokillstreakaction(undefined, 1);
}

