// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_7c79573f6d201a19;
#using script_26ccbfe3954cacf4;
#using script_58be75c518bf0d40;

#namespace wander;

// Namespace wander/namespace_ea0055094e5fd26a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c
// Size: 0x16
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, &createaction, 2000);
}

// Namespace wander/namespace_ea0055094e5fd26a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a
// Size: 0x102
function function_e0844a2b7f904b14(bot) {
    var_72bb89e60d3674df = self.constants.basescore;
    if (isdefined(level.mind.callbacks.var_bca4b4bdab5b2718)) {
        return var_72bb89e60d3674df;
    }
    master = bot function_2810b62e37a684f9();
    if (isdefined(master) && master != bot) {
        if (self.constants.var_bf4b19a689dba773 > 0) {
            self.var_df9d35d9b4bee654 = function_f51749cef5c1eec(master);
            var_90c7ba59a2555b5d = function_9d1ab012058221bb(distance(bot.origin, master.origin), self.constants.var_b248e7805fbaf822, self.constants.var_375a77fd02b3fcc);
            var_90c7ba59a2555b5d = var_90c7ba59a2555b5d * self.constants.var_bf4b19a689dba773;
            var_72bb89e60d3674df = var_72bb89e60d3674df + var_90c7ba59a2555b5d;
        }
    }
    return var_72bb89e60d3674df;
}

// Namespace wander/namespace_ea0055094e5fd26a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244
// Size: 0x13
function createaction(bot) {
    return function_f51749cef5c1eec(undefined);
}

// Namespace wander/namespace_ea0055094e5fd26a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25f
// Size: 0x28
function function_f51749cef5c1eec(var_de5ad618378dca3) {
    return function_ff35a4d756374ede("wander", var_de5ad618378dca3, "main", "", &function_35671b7b1a04bf58, self);
}

// Namespace wander/namespace_ea0055094e5fd26a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28f
// Size: 0x163
function function_35671b7b1a04bf58(bot) {
    pointonnavmesh = bot function_188de758cb607fa3(self.decision, self.var_ec02147fee952ce2);
    if (!isdefined(pointonnavmesh)) {
        return "No destination";
    }
    bot function_9e400058ef021b03(pointonnavmesh, self.decision.constants.var_a135e495fbf4cf96);
    result = bot waittill_any_in_array_or_timeout([0:"goal", 1:"bad_path", 2:"long_path"], 15);
    if (result == "goal") {
        if (namespace_cd0b2d039510b38d::getsubgametype() != "rumble_mgl") {
            /#
                function_f3cf203834e48c6d("<unknown string>");
            #/
            var_5f50d68561839648 = randomfloatrange(1, 3);
            wait(var_5f50d68561839648);
        }
    } else if (result == "bad_path" && isdefined(self.decision.var_288ca57e94982f37)) {
        var_8c9d8551140041f7 = bot.mind.var_f0a8822dcc782c9d.var_577f45571c039a54["Pickup"];
        if (isdefined(var_8c9d8551140041f7)) {
            var_8c9d8551140041f7 namespace_351e75b9d115392f::function_2d9fcd6970321ba(self.decision.var_288ca57e94982f37);
        }
    }
    bot notify("dormant_bot_suspending_chance");
    if (result != "goal" && result != "timeout") {
        return result;
    }
}

// Namespace wander/namespace_ea0055094e5fd26a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f9
// Size: 0xa4
function function_188de758cb607fa3(decision, var_de5ad618378dca3) {
    if (isdefined(level.mind.callbacks.var_bca4b4bdab5b2718)) {
        return self [[ level.mind.callbacks.var_bca4b4bdab5b2718 ]]();
    }
    var_288ca57e94982f37 = decision.var_288ca57e94982f37;
    decision.var_288ca57e94982f37 = undefined;
    if (isdefined(var_de5ad618378dca3)) {
        return function_75328d9af88f8b4e(var_de5ad618378dca3, decision);
    } else if (namespace_95d8d8ec67e3e074::function_d012729eac1e7053()) {
        return function_9e2f5dc882037389(decision, var_288ca57e94982f37);
    } else {
        return function_d635a657fa4ebf17();
    }
}

// Namespace wander/namespace_ea0055094e5fd26a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a4
// Size: 0x7c
function function_75328d9af88f8b4e(master, decision) {
    center = undefined;
    if (isbot(master) && master bothasscriptgoal()) {
        center = master botgetscriptgoal();
    } else {
        center = master.origin;
    }
    return function_94df2aa132008fcc(center, decision.constants.var_cc9b7ef91fc151b, decision.constants.var_3145d7adafc61293);
}

// Namespace wander/namespace_ea0055094e5fd26a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x528
// Size: 0xad
function function_9e2f5dc882037389(decision, var_288ca57e94982f37) {
    var_8f60e685e9ada1d8 = 0.5;
    if (randomfloat(1) < var_8f60e685e9ada1d8) {
        var_8c9d8551140041f7 = self.mind.var_f0a8822dcc782c9d.var_577f45571c039a54["Pickup"];
        if (isdefined(var_8c9d8551140041f7)) {
            decision.var_288ca57e94982f37 = var_8c9d8551140041f7 namespace_351e75b9d115392f::function_54f633f649764ea9(self, var_288ca57e94982f37);
            if (isdefined(decision.var_288ca57e94982f37)) {
                return decision.var_288ca57e94982f37.entity.origin;
            }
        }
    }
    return function_d635a657fa4ebf17();
}

// Namespace wander/namespace_ea0055094e5fd26a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dd
// Size: 0x23
function function_d635a657fa4ebf17() {
    var_58a4f0b1d349d24e = 2500;
    return function_94df2aa132008fcc(self.origin, var_58a4f0b1d349d24e, 5);
}

// Namespace wander/namespace_ea0055094e5fd26a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x608
// Size: 0x110
function function_2810b62e37a684f9() {
    if (!namespace_ca7b90256548aa40::issquadmode()) {
        return undefined;
    }
    squad = level.squaddata[self.team][self.var_ff97225579de16a];
    var_8b0bfb7310ce9582 = function_87102f4ad2cc5188(self, squad.squadleader);
    if (var_8b0bfb7310ce9582 && !isai(squad.squadleader)) {
        return squad.squadleader;
    }
    var_a5f822b72ce13f72 = undefined;
    for (i = 0; i < squad.players.size; i++) {
        player = squad.players[i];
        if (isdefined(squad.squadleader) && squad.squadleader == player) {
            continue;
        }
        if (function_87102f4ad2cc5188(self, player)) {
            if (!isai(player)) {
                return player;
            }
            if (!isdefined(var_a5f822b72ce13f72)) {
                var_a5f822b72ce13f72 = player;
            }
        }
    }
    if (var_8b0bfb7310ce9582) {
        return squad.squadleader;
    }
    return var_a5f822b72ce13f72;
}

// Namespace wander/namespace_ea0055094e5fd26a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x720
// Size: 0x5d
function function_87102f4ad2cc5188(follower, target) {
    /#
        assert(!isdefined(target) || follower.team == target.team && follower.var_ff97225579de16a == target.var_ff97225579de16a);
    #/
    return function_56fb6eea7e566a2(target);
}

// Namespace wander/namespace_ea0055094e5fd26a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x785
// Size: 0x8d
function function_94df2aa132008fcc(center, distance, seconds) {
    if (!isdefined(distance)) {
        distance = 750;
    }
    timeout = gettime() + 1000 * seconds;
    while (gettime() < timeout) {
        point = function_fcc75af6225b896b(center, distance, 0.6, 1);
        var_3863887fed6f155 = function_207ba502560fa1d2(point);
        if (function_bcb0778bb33e86de(var_3863887fed6f155)) {
            return var_3863887fed6f155;
        }
        wait(0.05);
    }
    return function_c42a53b48c0a683e();
}

// Namespace wander/namespace_ea0055094e5fd26a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x81a
// Size: 0x2b
function function_e08ee6939ebfdb4d(func) {
    level.mind.callbacks.var_bca4b4bdab5b2718 = func;
}

