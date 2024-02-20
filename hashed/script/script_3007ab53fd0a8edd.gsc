// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_3fcc27c3656c46dc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using script_26ccbfe3954cacf4;
#using scripts\mp\utility\teams.gsc;
#using script_9963540126262c0;
#using script_150fee7943687302;

#namespace namespace_9dad6814012e55d1;

// Namespace namespace_9dad6814012e55d1/namespace_81bf0a6af1cb8b9b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1
// Size: 0xe
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14);
}

// Namespace namespace_9dad6814012e55d1/namespace_81bf0a6af1cb8b9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7
// Size: 0x7a
function function_e0844a2b7f904b14(bot) {
    if (!level.br_armory_kiosk_enabled) {
        return -100;
    }
    var_c065d1ca4804ea3a = function_1b5842b9b6465162(bot);
    if (!isdefined(var_c065d1ca4804ea3a)) {
        return -100;
    }
    self.var_df9d35d9b4bee654 = namespace_ca8eb8c7f624c164::createaction(var_c065d1ca4804ea3a.target);
    var_72bb89e60d3674df = var_c065d1ca4804ea3a.score * self.constants.var_2d40425ebda06605;
    return var_72bb89e60d3674df;
}

// Namespace namespace_9dad6814012e55d1/namespace_81bf0a6af1cb8b9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179
// Size: 0x314
function function_1b5842b9b6465162(bot) {
    var_69590e67f030f9aa = "teamReviver";
    var_b6736234a4ac9bd1 = isdefined(level.var_6be7b375ec4a629c[0]["items"][var_69590e67f030f9aa]);
    if (!var_b6736234a4ac9bd1) {
        return undefined;
    }
    var_2a70ae11efafea87 = bot.plundercount >= namespace_a4b43c1cf86c6fe5::function_517b8730ddec7f59(var_69590e67f030f9aa);
    if (!var_2a70ae11efafea87) {
        return undefined;
    }
    var_10a39f1a0b6d2aa2 = namespace_95d8d8ec67e3e074::function_a5786099ca387b00();
    teammates = namespace_54d20dd0dd79277f::getteamdata(bot.team, "players");
    var_38882a650f503344 = undefined;
    foreach (player in teammates) {
        if (!isdefined(player) || player == bot) {
            continue;
        }
        if (player function_a9cbf557dc66d201()) {
            if (!isai(player)) {
                var_38882a650f503344 = player;
                break;
            } else if (!isdefined(var_38882a650f503344) && var_10a39f1a0b6d2aa2) {
                var_38882a650f503344 = player;
            }
        }
    }
    if (!isdefined(var_38882a650f503344)) {
        return undefined;
    }
    var_b252afb1c6d8213c = bot namespace_bfa2898056f8354::function_7e7ddfa33eff2c11();
    if (var_b252afb1c6d8213c.size == 0) {
        return undefined;
    }
    var_ff4b6d39036010b = bot function_8a0fa223b19e44f4(var_b252afb1c6d8213c, self.constants.var_87f34cf0d41d251d, self.constants.var_38a8985512b3e7b3, 0, self.constants.var_93bcc2b99d24433f, self.constants.var_5107f0b927dad2b);
    if (!isdefined(var_ff4b6d39036010b) || namespace_30e7da3797ac6a02::function_f7df7edcfce4b1f2(var_ff4b6d39036010b.target, bot)) {
        return undefined;
    }
    circle = bot function_e5b4b5992cddb221();
    var_79eef5a8e34ac410 = circle.radius - distance(var_ff4b6d39036010b.target.origin, circle.origin);
    var_e2d41d6be5320861 = function_9d1ab012058221bb(var_79eef5a8e34ac410, self.constants.var_79eef5a8e34ac410, self.constants.var_ca580a719e470379);
    var_ff4b6d39036010b.score = var_ff4b6d39036010b.score + var_e2d41d6be5320861;
    target = spawnstruct();
    target.var_1657e74c9190d2a2 = var_38882a650f503344.var_3f78c6a0862f9e25 + 1;
    target.itemname = bot.name;
    target.channel = "br_team_revive";
    target.buystation = var_ff4b6d39036010b.target;
    result = spawnstruct();
    result.target = target;
    result.score = var_ff4b6d39036010b.score;
    return result;
}

