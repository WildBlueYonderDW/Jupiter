// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_37d9a569491ff1e0;
#using scripts\mp\killstreaks\killstreaks.gsc;

#namespace killstreak_uav;

// Namespace killstreak_uav/namespace_c8150390fc0bf61e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe
// Size: 0x16
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, &createaction, 2000);
}

// Namespace killstreak_uav/namespace_c8150390fc0bf61e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc
// Size: 0xf3
function function_e0844a2b7f904b14(bot) {
    if (!bot function_81b00a2ba10c143a("uav_bigmap")) {
        return 0;
    }
    var_fdf6f26abee82b42 = bot namespace_5524884c16a95af2::function_7e7ddfa33eff2c11();
    var_fdf6f26abee82b42 namespace_5524884c16a95af2::function_8500e6ae452b1e19(self.constants.var_df15d9eff00563be);
    var_b16f718206f54b7b = 0;
    foreach (player in var_fdf6f26abee82b42.result) {
        if (function_40034c2faf09a87b(player)) {
            var_b16f718206f54b7b++;
        }
    }
    return self.constants.basescore + function_9d1ab012058221bb(var_b16f718206f54b7b, self.constants.var_e8b4534f27490bc4, self.constants.var_ffd2b6629c92a80d);
}

// Namespace killstreak_uav/namespace_c8150390fc0bf61e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7
// Size: 0x28
function createaction(bot) {
    return function_ff35a4d756374ede("Killstreak UAV", undefined, "upper body", "", &function_35671b7b1a04bf58, self);
}

// Namespace killstreak_uav/namespace_c8150390fc0bf61e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x207
// Size: 0x37
function function_35671b7b1a04bf58(bot) {
    bot namespace_58a74e7d54b56e8d::dokillstreakaction(undefined, 1);
    /#
        logstring("<unknown string>" + bot.name + "<unknown string>");
    #/
}

