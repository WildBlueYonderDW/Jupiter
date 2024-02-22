// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_25b55d37e1b51db1;
#using script_26ccbfe3954cacf4;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_16f9f52c2f9a19db;

// Namespace namespace_16f9f52c2f9a19db/namespace_1580a10821910b9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126
// Size: 0xe
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14);
}

// Namespace namespace_16f9f52c2f9a19db/namespace_1580a10821910b9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c
// Size: 0x4b7
function function_e0844a2b7f904b14(bot) {
    /#
        if (getdvar(@"hash_e39c6d129db1722") == "<unknown string>") {
            return 0;
        }
    #/
    var_7bf6ee12b10ec682 = gettime();
    var_4fef774bc5a2767d = [];
    soundevents = bot namespace_3df563b7c04eb8eb::function_7e7ddfa33eff2c11();
    foreach (event in soundevents) {
        if (!isvalidplayer(event.owner)) {
            continue;
        }
        /#
            if (!isai(event.owner) && getdvar(@"hash_e39c6d129db1722") == "<unknown string>") {
                goto LOC_00000325;
            }
        #/
        if (event.owner namespace_95d8d8ec67e3e074::isuibot()) {
            continue;
        }
        if (bot botcanseeentity(event.owner)) {
            continue;
        }
        var_ebf0bcd780e61d5 = event.owner getentitynumber();
        var_cdde5078f529b40e = var_4fef774bc5a2767d[var_ebf0bcd780e61d5];
        if (!isdefined(var_cdde5078f529b40e)) {
            var_cdde5078f529b40e = spawnstruct();
            var_cdde5078f529b40e.var_58375251f390de07 = 0;
            var_4fef774bc5a2767d[var_ebf0bcd780e61d5] = var_cdde5078f529b40e;
        }
        var_cdde5078f529b40e.var_58375251f390de07++;
        var_29728d2a6ecae1c7 = self.constants.var_5e9293cac9317139[event.type];
        dist = distance(event.pos, bot.origin);
        if (event.type == "footstep" || event.type == "footstep_walk" || event.type == "footstep_sprint") {
            var_29728d2a6ecae1c7 = var_29728d2a6ecae1c7 + function_9d1ab012058221bb(dist, self.constants.var_1c1e326edfaee326, self.constants.var_b17cbf80b52df82f);
        } else {
            var_29728d2a6ecae1c7 = var_29728d2a6ecae1c7 + function_9d1ab012058221bb(dist, self.constants.var_436444ebcb6bf7b3, self.constants.var_e8de868e20882c8a);
        }
        time = (var_7bf6ee12b10ec682 - event.time) / 1000;
        var_29728d2a6ecae1c7 = var_29728d2a6ecae1c7 + function_9d1ab012058221bb(time, self.constants.var_50cf5a797d61ae47, self.constants.var_f65cad93a3671678);
        if (!isdefined(var_cdde5078f529b40e.maxscore) || var_29728d2a6ecae1c7 > var_cdde5078f529b40e.maxscore) {
            var_cdde5078f529b40e.maxscore = var_29728d2a6ecae1c7;
            var_cdde5078f529b40e.event = event;
        LOC_00000325:
        }
    LOC_00000325:
    }
    var_72bb89e60d3674df = 0;
    var_2a38f6e57d09b111 = undefined;
    foreach (potentialtarget in var_4fef774bc5a2767d) {
        if (potentialtarget.event.type == "can_see" || potentialtarget.event.type == "bullet_whizby" || potentialtarget.event.type == "projectile_impact" || potentialtarget.event.type == "radar") {
            score = potentialtarget.maxscore;
        } else {
            score = potentialtarget.maxscore + function_9d1ab012058221bb(potentialtarget.var_58375251f390de07 - 1, self.constants.var_931b4359890cef33, self.constants.var_188ae31c05e38b7c);
        }
        if (score <= 0) {
            continue;
        }
        if (score > var_72bb89e60d3674df) {
            var_72bb89e60d3674df = score;
            var_2a38f6e57d09b111 = potentialtarget;
        }
    }
    if (!isdefined(var_2a38f6e57d09b111)) {
        return 0;
    }
    var_67cce4b1942e19e5 = var_2a38f6e57d09b111.event.pos;
    var_e4b8c3d6e82a814b = var_2a38f6e57d09b111.event.owner getentitynumber();
    self.var_df9d35d9b4bee654 = function_ff35a4d756374ede("Search Threat Plus", var_67cce4b1942e19e5, "main", "$e" + var_e4b8c3d6e82a814b, &function_35671b7b1a04bf58, self);
    return var_72bb89e60d3674df;
}

// Namespace namespace_16f9f52c2f9a19db/namespace_1580a10821910b9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fb
// Size: 0xca
function function_35671b7b1a04bf58(bot) {
    pos = self.var_ec02147fee952ce2;
    /#
        assert(isdefined(pos));
    #/
    targetpos = namespace_c5622898120e827f::getrandompointincircle(pos, 48, undefined, undefined, 0, 1);
    bot function_9e400058ef021b03(targetpos, 48);
    result = bot waittill_any_in_array_return([0:"bad_path", 1:"goal"]);
    if (result == "goal") {
        return;
    } else if (result == "bad_path") {
        /#
            println("<unknown string>" + self.decision.name + "<unknown string>" + targetpos + "<unknown string>" + bot.origin);
        #/
        return result;
    }
}

