// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_1076881dd9127338;

#namespace go_to_camp_position;

// Namespace go_to_camp_position/namespace_a3991156b838ed2d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150
// Size: 0x12
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, undefined, 2000);
}

// Namespace go_to_camp_position/namespace_a3991156b838ed2d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a
// Size: 0x76
function function_e0844a2b7f904b14(bot) {
    var_8b2a3b0e3f1cd3cf = function_2a5852c404d2236e(bot);
    if (!isdefined(var_8b2a3b0e3f1cd3cf)) {
        return 0;
    }
    var_200c8f755e8f626b = var_8b2a3b0e3f1cd3cf.target;
    self.var_df9d35d9b4bee654 = function_ff35a4d756374ede("go_to_camp_position", var_200c8f755e8f626b, "main", var_200c8f755e8f626b.target, &function_35671b7b1a04bf58, self, &function_f4caae7e8af9d32c);
    return var_8b2a3b0e3f1cd3cf.score;
}

// Namespace go_to_camp_position/namespace_a3991156b838ed2d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8
// Size: 0xfd
function function_2a5852c404d2236e(bot) {
    var_49fffc1ce970e26d = isdefined(bot.primaryweaponobj) && bot function_813a1a6f2c5abddb(bot.primaryweaponobj, self.constants.var_d0708c53f9aedbbe);
    if (!var_49fffc1ce970e26d) {
        return undefined;
    }
    var_b01971ef554bac8 = bot namespace_1bebff3a2e9afaca::function_7e7ddfa33eff2c11();
    var_8b2a3b0e3f1cd3cf = bot function_8a0fa223b19e44f4(var_b01971ef554bac8, self.constants.var_96af88c97db9ed21, self.constants.var_49e2976ca0c853ef, 1);
    if (!isdefined(var_8b2a3b0e3f1cd3cf)) {
        return undefined;
    }
    var_9073e5955eaebe2c = function_9d1ab012058221bb(function_1c51f7c46a848ddd(), self.constants.var_e23500dbd314bae2, self.constants.var_e58a5e1efeb78937);
    var_8b2a3b0e3f1cd3cf.score = var_8b2a3b0e3f1cd3cf.score + var_9073e5955eaebe2c;
    return var_8b2a3b0e3f1cd3cf;
}

// Namespace go_to_camp_position/namespace_a3991156b838ed2d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ed
// Size: 0x1b0
function function_35671b7b1a04bf58(bot) {
    var_200c8f755e8f626b = self.var_ec02147fee952ce2;
    /#
        assert(isdefined(var_200c8f755e8f626b), "Only go to camp position when having a valid camp group");
    #/
    bot namespace_1bebff3a2e9afaca::function_7dbe596500a2e27c(var_200c8f755e8f626b);
    var_5be401736b4d21b8 = var_200c8f755e8f626b get_target_array();
    while (1) {
        var_cff075b05a95577b = random(var_5be401736b4d21b8);
        pointonnavmesh = getclosestpointonnavmesh(var_cff075b05a95577b.origin);
        if (!isdefined(pointonnavmesh)) {
            return ("No point on navmesh around " + var_cff075b05a95577b.origin);
        }
        bot function_9e400058ef021b03(pointonnavmesh, 4);
        result = bot waittill_any_in_array_return([0:"goal", 1:"bad_path"]);
        if (result == "goal") {
            var_5f50d68561839648 = randomfloatrange(3, 8);
            forwardvec = anglestoforward(var_cff075b05a95577b.angles) * 100;
            bot botlookatpoint(bot geteye() + forwardvec, var_5f50d68561839648, "script_forced");
            stance = var_cff075b05a95577b.script_parameters;
            if (!isdefined(stance)) {
                stance = "crouch";
            }
            /#
                assertex(stance == "stand" || stance == "crouch" || stance == "prone", "stance [" + stance + "] invalid in " + var_cff075b05a95577b.targetname);
            #/
            bot botsetstance(stance);
            /#
                function_f3cf203834e48c6d("<unknown string>");
            #/
            wait(var_5f50d68561839648);
            /#
                function_f3cf203834e48c6d("<unknown string>");
            #/
        } else {
            return result;
        }
    }
}

// Namespace go_to_camp_position/namespace_a3991156b838ed2d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a4
// Size: 0x3b
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        self botlookatpoint(undefined);
        self botsetstance("none");
        namespace_1bebff3a2e9afaca::function_5f6e68b080316fcf(action.var_ec02147fee952ce2);
    }
}

