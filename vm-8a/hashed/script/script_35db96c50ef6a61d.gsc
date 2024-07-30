#using script_d74ae0b4aa21186;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_1076881dd9127338;

#namespace go_to_camp_position;

// Namespace go_to_camp_position / namespace_a3991156b838ed2d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150
// Size: 0x11
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&evaluatescore, undefined, 2000);
}

// Namespace go_to_camp_position / namespace_a3991156b838ed2d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a
// Size: 0x75
function evaluatescore(bot) {
    var_8b2a3b0e3f1cd3cf = function_2a5852c404d2236e(bot);
    if (!isdefined(var_8b2a3b0e3f1cd3cf)) {
        return 0;
    }
    campgroup = var_8b2a3b0e3f1cd3cf.target;
    self.var_df9d35d9b4bee654 = createactionbase("go_to_camp_position", campgroup, "main", campgroup.target, &actionprocess, self, &function_f4caae7e8af9d32c);
    return var_8b2a3b0e3f1cd3cf.score;
}

// Namespace go_to_camp_position / namespace_a3991156b838ed2d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8
// Size: 0xfc
function function_2a5852c404d2236e(bot) {
    var_49fffc1ce970e26d = isdefined(bot.primaryweaponobj) && bot isammoenough(bot.primaryweaponobj, self.constants.var_d0708c53f9aedbbe);
    if (!var_49fffc1ce970e26d) {
        return undefined;
    }
    var_b01971ef554bac8 = bot namespace_1bebff3a2e9afaca::getevent();
    var_8b2a3b0e3f1cd3cf = bot nearestplace(var_b01971ef554bac8, self.constants.var_96af88c97db9ed21, self.constants.var_49e2976ca0c853ef, 1);
    if (!isdefined(var_8b2a3b0e3f1cd3cf)) {
        return undefined;
    }
    var_9073e5955eaebe2c = function_9d1ab012058221bb(function_1c51f7c46a848ddd(), self.constants.var_e23500dbd314bae2, self.constants.var_e58a5e1efeb78937);
    var_8b2a3b0e3f1cd3cf.score += var_9073e5955eaebe2c;
    return var_8b2a3b0e3f1cd3cf;
}

// Namespace go_to_camp_position / namespace_a3991156b838ed2d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ed
// Size: 0x1af
function actionprocess(bot) {
    campgroup = self.argument;
    assert(isdefined(campgroup), "Only go to camp position when having a valid camp group");
    bot namespace_1bebff3a2e9afaca::function_7dbe596500a2e27c(campgroup);
    var_5be401736b4d21b8 = campgroup get_target_array();
    while (true) {
        targetposstruct = random(var_5be401736b4d21b8);
        pointonnavmesh = getclosestpointonnavmesh(targetposstruct.origin);
        if (!isdefined(pointonnavmesh)) {
            return ("No point on navmesh around " + targetposstruct.origin);
        }
        bot function_9e400058ef021b03(pointonnavmesh, 4);
        result = bot waittill_any_in_array_return(["goal", "bad_path"]);
        if (result == "goal") {
            restseconds = randomfloatrange(3, 8);
            forwardvec = anglestoforward(targetposstruct.angles) * 100;
            bot botlookatpoint(bot geteye() + forwardvec, restseconds, "script_forced");
            stance = targetposstruct.script_parameters;
            if (!isdefined(stance)) {
                stance = "crouch";
            }
            assertex(stance == "stand" || stance == "crouch" || stance == "prone", "stance [" + stance + "] invalid in " + targetposstruct.targetname);
            bot botsetstance(stance);
            /#
                function_f3cf203834e48c6d("<dev string:x1c>");
            #/
            wait restseconds;
            /#
                function_f3cf203834e48c6d("<dev string:x21>");
            #/
            continue;
        }
        return result;
    }
}

// Namespace go_to_camp_position / namespace_a3991156b838ed2d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a4
// Size: 0x3a
function function_f4caae7e8af9d32c(action) {
    if (function_d57dd414963503d1()) {
        self botlookatpoint(undefined);
        self botsetstance("none");
        namespace_1bebff3a2e9afaca::function_5f6e68b080316fcf(action.argument);
    }
}

