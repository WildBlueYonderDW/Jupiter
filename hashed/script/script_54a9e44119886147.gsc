// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace combat_action;

// Namespace combat_action/namespace_41cf72abc6042f25
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101
// Size: 0x57
function createaction(target) {
    /#
        assert(isent(target));
    #/
    targetname = function_ee72e3f03e5196b7(target);
    return function_ff35a4d756374ede("combat", target, "main", targetname + "/" + target getentitynumber(), &function_35671b7b1a04bf58, self, &function_f4caae7e8af9d32c);
}

// Namespace combat_action/namespace_41cf72abc6042f25
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160
// Size: 0x258
function function_35671b7b1a04bf58(bot) {
    /#
        assert(isplayer(self.var_ec02147fee952ce2) || isagent(self.var_ec02147fee952ce2));
    #/
    target = self.var_ec02147fee952ce2;
    target endon("death_or_disconnect");
    meleechargedist = bot botgetdifficultysetting("meleeChargeDist");
    var_7e28dd052f7b8a2c = meleechargedist * meleechargedist;
    var_a8340bae5a5e4ffc = 0;
    function_bdf249b5a9979371(bot);
    while (1) {
        if (!bot function_42266a7fd7932c50(target)) {
            return "Invalid target";
        }
        bot function_2c2b5b435027f895(target);
        bot botclearscriptgoal();
        var_33c1b9eb98af9e77 = distancesquared(bot.origin, target.origin) <= var_7e28dd052f7b8a2c;
        if (var_a8340bae5a5e4ffc != var_33c1b9eb98af9e77) {
            var_a8340bae5a5e4ffc = var_33c1b9eb98af9e77;
            var_20158eb686f4b21b = var_33c1b9eb98af9e77 && randomfloat(1) < 0.5 && bot botcanseeentity(target);
            bot botsetflag("prefer_melee", var_20158eb686f4b21b);
        }
        msg = bot waittill_any_in_array_or_timeout([0:"bad_path", 1:"long_path"], 0.1);
        if (!bot function_42266a7fd7932c50(target)) {
            return "Invalid target";
        }
        if (!bot botcanseeentity(target)) {
            if (msg == "bad_path") {
                bot function_2c2b5b435027f895(undefined);
                /#
                    function_f3cf203834e48c6d("<unknown string>");
                #/
                point = namespace_c5622898120e827f::getrandompointincircle(bot.origin, 200, 0.5, 1, 1, 1);
                var_3863887fed6f155 = bot getclosestreachablepointonnavmesh(point);
                bot function_9e400058ef021b03(var_3863887fed6f155, 32);
                bot waittill_any_in_array_or_timeout([0:"goal", 1:"bad_path"], 2);
                if (!bot function_42266a7fd7932c50(target)) {
                    return "Invalid target";
                }
                /#
                    function_f3cf203834e48c6d("<unknown string>");
                #/
            } else if (msg == "long_path") {
                return msg;
            }
        }
        if (istrue(self.var_a0185a724941f02f.constants.var_c1f6d75f14545b1f)) {
            bot function_cf1a9e98122e3931(target);
        }
    }
}

// Namespace combat_action/namespace_41cf72abc6042f25
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bf
// Size: 0x89
function function_bdf249b5a9979371(bot) {
    var_3b00f93932aa61c4 = self.var_a0185a724941f02f.constants.var_386520f2d17685d5;
    if (isdefined(var_3b00f93932aa61c4) && var_3b00f93932aa61c4 != 0 && !isbot(self.var_ec02147fee952ce2)) {
        self.var_98a8d73ff5329a01 = bot botgetdifficultysetting("hitInaccuracyScale");
        var_5fc09d1bc4492fc6 = self.var_98a8d73ff5329a01 * var_3b00f93932aa61c4;
        bot botsetdifficultysetting("hitInaccuracyScale", var_5fc09d1bc4492fc6);
    }
}

// Namespace combat_action/namespace_41cf72abc6042f25
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f
// Size: 0x53
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        self botsetflag("prefer_melee", 0);
    }
    if (isdefined(action.var_98a8d73ff5329a01)) {
        self botsetdifficultysetting("hitInaccuracyScale", action.var_98a8d73ff5329a01);
        action.var_98a8d73ff5329a01 = undefined;
    }
}

