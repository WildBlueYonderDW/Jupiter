// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_7845ba34dcf9b77b;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace control_fob;

// Namespace control_fob/namespace_3c545500807c3c91
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3
// Size: 0xe
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14);
}

// Namespace control_fob/namespace_3c545500807c3c91
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9
// Size: 0x219
function function_e0844a2b7f904b14(bot) {
    var_72bb89e60d3674df = 0;
    target = undefined;
    var_47a3b799c2843055 = bot namespace_ba8cfebbc70bb00b::function_7e7ddfa33eff2c11();
    foreach (fob in var_47a3b799c2843055) {
        var_f4f69da7307e230d = fob.trigger.gameobject;
        var_53f1776107072c70 = distance(var_f4f69da7307e230d.origin, bot.origin);
        basescore = function_9d1ab012058221bb(var_53f1776107072c70, self.constants.var_96af88c97db9ed21, self.constants.var_49e2976ca0c853ef);
        var_f5576fb178af593e = var_f4f69da7307e230d namespace_19b4203b51d56488::getcaptureprogress();
        if (bot.team != var_f4f69da7307e230d namespace_19b4203b51d56488::getownerteam()) {
            var_4864afbc9d83ea7d = function_9d1ab012058221bb(var_f5576fb178af593e, self.constants.var_ec6070e1ebb11843, self.constants.var_7fef69cec64a3cf4);
        } else {
            var_4864afbc9d83ea7d = function_9d1ab012058221bb(var_f5576fb178af593e, self.constants.var_ec6070e1ebb11843, self.constants.var_2348961fb298f28);
        }
        score = basescore * var_4864afbc9d83ea7d;
        score = score + function_4e58bf49977d1bfd(fob.name);
        if (score > var_72bb89e60d3674df) {
            var_72bb89e60d3674df = score;
            target = fob.name;
        }
    }
    if (isdefined(target)) {
        self.var_df9d35d9b4bee654 = function_ff35a4d756374ede("control_fob", target, "main", target, &function_35671b7b1a04bf58, self, undefined, self.constants.var_57228f75b014a7b8, self.constants.var_daec6fd98c7cee50);
    }
    return var_72bb89e60d3674df;
}

// Namespace control_fob/namespace_3c545500807c3c91
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30a
// Size: 0x109
function function_35671b7b1a04bf58(bot) {
    var_27a1a1e9bd5f40f0 = self.var_ec02147fee952ce2;
    destination = function_7a2aaa4a09a4d250(namespace_36f464722d326bbe::getlocalestructarray(var_27a1a1e9bd5f40f0 + "_bot"));
    randompoint = namespace_c5622898120e827f::getrandompointincircle(destination.origin, destination.radius, undefined, undefined, 1, 1, undefined, undefined);
    bot function_9e400058ef021b03(randompoint, 32);
    result = undefined;
    timeout = gettime() + 20000;
    while (gettime() < timeout) {
        bot botpressbutton("sprint", 1);
        result = bot waittill_any_in_array_or_timeout([0:"goal", 1:"bad_path"], 1);
        if (result == "goal") {
            /#
                function_f3cf203834e48c6d("<unknown string>");
            #/
            wait(randomfloatrange(1, 2.5));
            break;
        } else if (result != "timeout") {
            return result;
        }
    }
}

