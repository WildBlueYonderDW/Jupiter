// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using script_22594d942a4f2fa9;

#namespace namespace_fe1ab99277acb8c2;

// Namespace namespace_fe1ab99277acb8c2/namespace_f579db4f1fdf0250
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4
// Size: 0xe
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14);
}

// Namespace namespace_fe1ab99277acb8c2/namespace_f579db4f1fdf0250
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda
// Size: 0x1d4
function function_e0844a2b7f904b14(bot) {
    var_72bb89e60d3674df = -100;
    target = undefined;
    var_3a689e7b1e721c9d = bot namespace_e3ef90d32ac66277::function_7e7ddfa33eff2c11();
    foreach (entnum, var_855eb1686e661658 in var_3a689e7b1e721c9d) {
        if (!var_855eb1686e661658.valid) {
            continue;
        }
        if (!namespace_a36a697bb5de283b::ispointincurrentcircle(var_855eb1686e661658.origin)) {
            continue;
        }
        /#
            if (getdvar(@"hash_e39c6d129db1722") == "<unknown string>") {
                targetplayer = getentbynum(entnum);
                if (function_40034c2faf09a87b(targetplayer)) {
                    goto LOC_00000183;
                }
            }
        #/
        dist = distance(var_855eb1686e661658.origin, bot.origin);
        score = function_9d1ab012058221bb(dist, self.constants.var_96af88c97db9ed21, self.constants.var_7d7f72df5616d9e8);
        time = gettime() - var_855eb1686e661658.time;
        score = score + function_9d1ab012058221bb(time, self.constants.var_d114ba8784fcab24, self.constants.var_bf755758ae9ab4ed);
        if (score > var_72bb89e60d3674df) {
            target = var_855eb1686e661658;
            var_72bb89e60d3674df = score;
        LOC_00000183:
        }
    LOC_00000183:
    }
    if (!isdefined(target)) {
        return var_72bb89e60d3674df;
    }
    self.var_df9d35d9b4bee654 = function_ff35a4d756374ede("Search Threat", target, "main", "$e" + target.entnum, &function_35671b7b1a04bf58, self);
    return var_72bb89e60d3674df;
}

// Namespace namespace_fe1ab99277acb8c2/namespace_f579db4f1fdf0250
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b6
// Size: 0xff
function function_35671b7b1a04bf58(bot) {
    target = self.var_ec02147fee952ce2;
    /#
        assert(isdefined(target));
    #/
    while (1) {
        targetpos = function_f8350ab882cc2439(target.origin);
        bot function_9e400058ef021b03(targetpos, 64);
        result = bot waittill_any_in_array_or_timeout([0:"goal", 1:"bad_path"], 1);
        if (result == "goal") {
            bot namespace_e3ef90d32ac66277::function_6ecf7023ef123ba0(target.entnum);
            break;
        } else if (result == "bad_path") {
            /#
                println("<unknown string>" + self.var_a0185a724941f02f.name + "<unknown string>" + targetpos + "<unknown string>" + bot.origin);
            #/
            bot namespace_e3ef90d32ac66277::function_6ecf7023ef123ba0(target.entnum);
            return result;
        }
    }
}

