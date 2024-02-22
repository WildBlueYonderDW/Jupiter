// mwiii decomp prototype
#using script_7956d56c4922bd1;
#using script_64351208cb856df9;
#using script_2590b7a7de3dfc79;

#namespace namespace_bd7428f3122be80f;

// Namespace namespace_bd7428f3122be80f/namespace_40713433c91dd86c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8
// Size: 0x1c8
function function_c402ecda1e84ba27(players, var_130df19468a5a1df, difficulty_region, var_13bed845afa66167) {
    if (!isdefined(players)) {
        return;
    }
    var_2a29b237dcc66fe5 = [];
    if (!isarray(players) && isplayer(players)) {
        var_2a29b237dcc66fe5[0] = players;
    } else {
        var_2a29b237dcc66fe5 = players;
    }
    var_5ae81c709e07dbf7 = "difficulty_easy";
    if (isdefined(difficulty_region)) {
        var_5ae81c709e07dbf7 = difficulty_region;
    } else if (isdefined(var_13bed845afa66167) && isdefined(level.var_fac39a693f085779)) {
        var_5ae81c709e07dbf7 = [[ level.var_fac39a693f085779 ]](var_13bed845afa66167);
    }
    var_7b60c91792761e4f = #"ob_minor_activity_complete_green";
    switch (var_5ae81c709e07dbf7) {
    case #"hash_7bb2cd766703d463":
        if (istrue(var_130df19468a5a1df)) {
            var_7b60c91792761e4f = #"ob_major_activity_complete_green";
        } else {
            var_7b60c91792761e4f = #"ob_minor_activity_complete_green";
        }
        break;
    case #"hash_af83e47edfa8900a":
        if (istrue(var_130df19468a5a1df)) {
            var_7b60c91792761e4f = #"ob_major_activity_complete_yellow";
        } else {
            var_7b60c91792761e4f = #"ob_minor_activity_complete_yellow";
        }
        break;
    case #"hash_5343b465e56ec9a4":
        if (istrue(var_130df19468a5a1df)) {
            var_7b60c91792761e4f = #"ob_major_activity_complete_orange";
        } else {
            var_7b60c91792761e4f = #"ob_minor_activity_complete_orange";
        }
        break;
    case #"hash_651f76c0ad6741ec":
        if (istrue(var_130df19468a5a1df)) {
            var_7b60c91792761e4f = #"ob_major_activity_complete_red";
        } else {
            var_7b60c91792761e4f = #"ob_minor_activity_complete_red";
        }
        break;
    }
    foreach (player in var_2a29b237dcc66fe5) {
        player namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(var_7b60c91792761e4f, undefined, 0, #"hash_e4190edf8f5e7356");
    }
}

