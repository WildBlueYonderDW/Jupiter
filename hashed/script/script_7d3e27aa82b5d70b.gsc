// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_22b8ba12655bf3f2;

// Namespace namespace_22b8ba12655bf3f2/namespace_16f8c7ac384283cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae
// Size: 0x36
function function_40eca5c2157229bc(var_641ab1823a1b7739) {
    level.starting_health = [];
    level.var_42ae29d27de070cb = var_641ab1823a1b7739;
    registersharedfunc("zombie", "health_scaling_get_starting_health", &function_cf858e0766110297);
}

// Namespace namespace_22b8ba12655bf3f2/namespace_16f8c7ac384283cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb
// Size: 0x25b
function function_cf858e0766110297(var_b9125cd792d6e378, current_round) {
    if (!isdefined(level.starting_health[var_b9125cd792d6e378])) {
        level.starting_health[var_b9125cd792d6e378] = [];
    }
    if (!isdefined(level.starting_health[var_b9125cd792d6e378][current_round])) {
        var_d7edf55d81f7f944 = getscriptbundle("healthscalinground:" + var_b9125cd792d6e378);
        /#
            assert(isdefined(var_d7edf55d81f7f944));
        #/
        if (isdefined(var_d7edf55d81f7f944.basehealth)) {
            self.basehealth = var_d7edf55d81f7f944.basehealth;
        }
        var_fe0aad7efc61fcae = var_d7edf55d81f7f944.var_5fa2f1ef669d2826;
        base = function_53c4c53197386572(self.basehealth, 100);
        max = function_53c4c53197386572(var_d7edf55d81f7f944.maxhealth, base);
        var_3edf6b4eb93f6f0d = var_d7edf55d81f7f944.var_de69a4842af7b496;
        var_557ce280ab90d427 = base;
        if (current_round > 1 && isdefined(var_fe0aad7efc61fcae)) {
            for (i = 0; i < var_fe0aad7efc61fcae.size; i++) {
                if (current_round >= var_fe0aad7efc61fcae[i].startround) {
                    var_817124607074ae8c = var_fe0aad7efc61fcae[i].var_d9a25092bed9b107;
                    if (isdefined(var_fe0aad7efc61fcae[i + 1]) && current_round >= var_fe0aad7efc61fcae[i + 1].startround) {
                        var_e3b958e195d72415 = var_fe0aad7efc61fcae[i + 1].startround - var_fe0aad7efc61fcae[i].startround;
                    } else {
                        var_e3b958e195d72415 = current_round - var_fe0aad7efc61fcae[i].startround;
                    }
                    var_557ce280ab90d427 = var_557ce280ab90d427 + var_817124607074ae8c * var_e3b958e195d72415;
                } else {
                    break;
                }
            }
        }
        if (var_557ce280ab90d427 > max) {
            var_557ce280ab90d427 = max;
        }
        num_players = function_53c4c53197386572(level.var_42ae29d27de070cb, level.players.size);
        if (isdefined(var_3edf6b4eb93f6f0d) && num_players > 1) {
            var_557ce280ab90d427 = var_557ce280ab90d427 + var_557ce280ab90d427 * (num_players - 1) * var_3edf6b4eb93f6f0d;
        }
        var_4f78eba89f55a51e = 10;
        if (level.starting_health[var_b9125cd792d6e378].size >= var_4f78eba89f55a51e) {
            level.starting_health[var_b9125cd792d6e378] = [];
        }
        level.starting_health[var_b9125cd792d6e378][current_round] = int(var_557ce280ab90d427);
    }
    return level.starting_health[var_b9125cd792d6e378][current_round];
}

// Namespace namespace_22b8ba12655bf3f2/namespace_16f8c7ac384283cd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x34e
// Size: 0x1c4
function function_9102c548055a3813(var_b9125cd792d6e378, n_round) {
    var_d7edf55d81f7f944 = getscriptbundle("healthscalinground:" + var_b9125cd792d6e378);
    /#
        assert(isdefined(var_d7edf55d81f7f944));
    #/
    var_fe0aad7efc61fcae = var_d7edf55d81f7f944.var_5fa2f1ef669d2826;
    base = function_53c4c53197386572(self.basehealth, 100);
    max = function_53c4c53197386572(var_d7edf55d81f7f944.maxhealth, base);
    var_3edf6b4eb93f6f0d = var_d7edf55d81f7f944.var_de69a4842af7b496;
    var_557ce280ab90d427 = base;
    var_30d177f7b4f9f195 = 1;
    n_index = 0;
    while (var_30d177f7b4f9f195 < n_round) {
        if (isdefined(var_fe0aad7efc61fcae[n_index + 1].startround) && var_30d177f7b4f9f195 >= var_fe0aad7efc61fcae[n_index + 1].startround) {
            n_index++;
        }
        if (isdefined(var_fe0aad7efc61fcae[n_index].var_d9a25092bed9b107)) {
            var_557ce280ab90d427 = var_557ce280ab90d427 + var_fe0aad7efc61fcae[n_index].var_d9a25092bed9b107;
        }
        var_30d177f7b4f9f195++;
    }
    if (isdefined(max) && var_557ce280ab90d427 > max) {
        var_557ce280ab90d427 = max;
    }
    num_players = isdefined(level.var_42ae29d27de070cb) ? level.players.size : level.var_42ae29d27de070cb;
    if (isdefined(level.var_385ecf1850057d71)) {
        if ([[ level.var_385ecf1850057d71 ]](self)) {
            num_players = level.players.size;
        } else {
            num_players = isdefined(level.var_42ae29d27de070cb) ? 1 : level.var_42ae29d27de070cb;
        }
    }
    if (isdefined(var_3edf6b4eb93f6f0d) && num_players > 1) {
        var_557ce280ab90d427 = var_557ce280ab90d427 + var_557ce280ab90d427 * (num_players - 1) * var_3edf6b4eb93f6f0d;
    }
    return int(var_557ce280ab90d427);
}

// Namespace namespace_22b8ba12655bf3f2/namespace_16f8c7ac384283cd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51a
// Size: 0xd
function function_b7b826409f989600() {
    level.var_42ae29d27de070cb = undefined;
}

// Namespace namespace_22b8ba12655bf3f2/namespace_16f8c7ac384283cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52e
// Size: 0x16
function function_d589c49c4b9b50a0(func) {
    level.var_385ecf1850057d71 = func;
}

