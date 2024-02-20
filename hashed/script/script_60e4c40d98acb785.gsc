// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_8efd0fb119d9dfb5;

// Namespace namespace_8efd0fb119d9dfb5/namespace_f36e2473a69e9caf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd
// Size: 0x12
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, undefined, 2000);
}

// Namespace namespace_8efd0fb119d9dfb5/namespace_f36e2473a69e9caf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7
// Size: 0x200
function function_e0844a2b7f904b14(bot) {
    activequests = namespace_4bc0ead8d2af3d84::getallactivequestsforteam(bot.team);
    var_1f94c0cca708de02 = undefined;
    if (isdefined(activequests) && activequests.size > 0) {
        foreach (quest in activequests) {
            if (quest.instance.questcategory == "domination") {
                var_1f94c0cca708de02 = quest;
                break;
            }
        }
    }
    if (!isdefined(var_1f94c0cca708de02)) {
        return 0;
    }
    /#
        assert(isdefined(var_1f94c0cca708de02.instance) && isdefined(var_1f94c0cca708de02.instance.subscribedlocale) && isdefined(var_1f94c0cca708de02.instance.subscribedlocale.radius));
    #/
    var_2828a4fe12d2eb06 = spawnstruct();
    var_2828a4fe12d2eb06.var_ddf4dd8ad690d592 = var_1f94c0cca708de02.origin;
    var_2828a4fe12d2eb06.radius = var_1f94c0cca708de02.instance.subscribedlocale.radius;
    self.var_df9d35d9b4bee654 = function_ff35a4d756374ede("Perform Recon Contract", var_2828a4fe12d2eb06, "main", var_1f94c0cca708de02.instance.id, &function_35671b7b1a04bf58, self, &function_f4caae7e8af9d32c);
    var_46227231153bdf50 = istrue(self.var_b32868a9471d2caa) || distance(bot.origin, var_1f94c0cca708de02.origin) <= var_2828a4fe12d2eb06.radius;
    return ter_op(var_46227231153bdf50, self.constants.var_cf22d0ed88800557, self.constants.basescore);
}

// Namespace namespace_8efd0fb119d9dfb5/namespace_f36e2473a69e9caf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0xfa
function function_35671b7b1a04bf58(bot) {
    target = self.var_ec02147fee952ce2;
    /#
        assert(isdefined(target));
    #/
    self.var_a0185a724941f02f.var_b32868a9471d2caa = 1;
    var_c9e915e56c1b6170 = namespace_c5622898120e827f::getrandompointincircle(target.var_ddf4dd8ad690d592, target.radius);
    if (var_c9e915e56c1b6170[2] - target.var_ddf4dd8ad690d592[2] > 70) {
        var_c9e915e56c1b6170 = namespace_c5622898120e827f::getrandompointincircle(target.var_ddf4dd8ad690d592, target.radius, undefined, undefined, 0, 1);
    }
    while (1) {
        bot function_9e400058ef021b03(var_c9e915e56c1b6170, 32);
        result = bot waittill_any_in_array_or_timeout([0:"goal", 1:"bad_path"], 15);
        if (result == "goal") {
            break;
        } else if (result != "timeout") {
            return result;
        }
    }
}

// Namespace namespace_8efd0fb119d9dfb5/namespace_f36e2473a69e9caf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f0
// Size: 0x21
function function_f4caae7e8af9d32c(action) {
    action.var_a0185a724941f02f.var_b32868a9471d2caa = undefined;
}

