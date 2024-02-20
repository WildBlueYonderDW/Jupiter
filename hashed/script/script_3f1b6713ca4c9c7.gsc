// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace cash;

// Namespace cash/namespace_14f37777effc564d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8
// Size: 0x179
function playersetplunderomnvar(value) {
    /#
        assert(isdefined(value));
    #/
    if (!isdefined(value)) {
        return;
    }
    squadmemberindex = self.var_3f78c6a0862f9e25;
    if (!isdefined(squadmemberindex) || !isdefined(self.team) || istrue(self.isdisconnecting) || isdefined(level.maxsquadsize) && squadmemberindex >= level.maxsquadsize) {
        return;
    }
    if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
        self setclientomnvar("ui_cash_squad_index_" + squadmemberindex, value);
    } else {
        var_607da387f3617ed1 = level.teamdata[self.team]["players"];
        if (isdefined(level.squaddata) && isdefined(level.squaddata[self.team]) && isdefined(level.squaddata[self.team][self.var_ff97225579de16a])) {
            var_607da387f3617ed1 = level.squaddata[self.team][self.var_ff97225579de16a].players;
        }
        foreach (player in var_607da387f3617ed1) {
            if (isdefined(player)) {
                player setclientomnvar("ui_cash_squad_index_" + squadmemberindex, value);
            }
        }
    }
}

// Namespace cash/namespace_14f37777effc564d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238
// Size: 0x1eb
function function_52bea99a5c38fbe5(value, var_10aaaaa566515888) {
    if (!isdefined(var_10aaaaa566515888)) {
        var_10aaaaa566515888 = 0;
    }
    /#
        assert(isdefined(value));
    #/
    if (!isdefined(value)) {
        return;
    }
    if (!var_10aaaaa566515888 && isdefined(self.var_d62416826f295c0b) && self.var_d62416826f295c0b == value) {
        return;
    }
    squadmemberindex = self.var_3f78c6a0862f9e25;
    if (!isdefined(squadmemberindex) || !isdefined(self.team) || istrue(self.isdisconnecting)) {
        return;
    }
    if (isdefined(level.var_5f92f1f4d7faf5a0) && squadmemberindex >= level.var_5f92f1f4d7faf5a0) {
        return;
    }
    if (!isdefined(level.var_5f92f1f4d7faf5a0) && isdefined(level.maxsquadsize) && squadmemberindex >= level.maxsquadsize) {
        return;
    }
    if (squadmemberindex < 0) {
        return;
    }
    if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
        self setclientomnvar("ui_zm_essence_squad_index_" + squadmemberindex, value);
    } else {
        var_607da387f3617ed1 = level.teamdata[self.team]["players"];
        if (isdefined(level.squaddata) && isdefined(level.squaddata[self.team]) && isdefined(level.squaddata[self.team][self.var_ff97225579de16a])) {
            var_607da387f3617ed1 = level.squaddata[self.team][self.var_ff97225579de16a].players;
        }
        foreach (player in var_607da387f3617ed1) {
            player setclientomnvar("ui_zm_essence_squad_index_" + squadmemberindex, value);
        }
    }
    self.var_d62416826f295c0b = value;
}

// Namespace cash/namespace_14f37777effc564d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42a
// Size: 0x17b
function function_6da8b65579348d0b() {
    if (!isdefined(self.plundercount)) {
        self.plundercount = 0;
    }
    if (isdefined(self.team) && !namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
        var_607da387f3617ed1 = level.teamdata[self.team]["players"];
        if (isdefined(level.squaddata) && isdefined(level.squaddata[self.team]) && isdefined(level.squaddata[self.team][self.var_ff97225579de16a])) {
            var_607da387f3617ed1 = level.squaddata[self.team][self.var_ff97225579de16a].players;
        }
        foreach (player in var_607da387f3617ed1) {
            squadmemberindex = player.var_3f78c6a0862f9e25;
            if (self != player && isdefined(squadmemberindex)) {
                value = player getclientomnvar("ui_cash_squad_index_" + squadmemberindex);
                self setclientomnvar("ui_cash_squad_index_" + squadmemberindex, value);
                var_6214ba0b9e2c422e = player getclientomnvar("ui_zm_essence_squad_index_" + squadmemberindex);
                self setclientomnvar("ui_zm_essence_squad_index_" + squadmemberindex, var_6214ba0b9e2c422e);
            }
        }
    }
}

