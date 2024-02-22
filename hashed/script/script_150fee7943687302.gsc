// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_3fcc27c3656c46dc;
#using script_9963540126262c0;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;

#namespace namespace_f1a8383ecf43bcbc;

// Namespace namespace_f1a8383ecf43bcbc/namespace_30e7da3797ac6a02
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc
// Size: 0xe
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14);
}

// Namespace namespace_f1a8383ecf43bcbc/namespace_30e7da3797ac6a02
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2
// Size: 0x72
function function_e0844a2b7f904b14(bot) {
    if (!level.br_armory_kiosk_enabled) {
        return -100;
    }
    var_14f8998b9e6f6bba = function_5b0291aeab99561b(bot);
    if (!isdefined(var_14f8998b9e6f6bba)) {
        return -100;
    }
    var_72bb89e60d3674df = var_14f8998b9e6f6bba.score;
    target = var_14f8998b9e6f6bba.target;
    self.var_df9d35d9b4bee654 = namespace_ca8eb8c7f624c164::createaction(target);
    return var_72bb89e60d3674df;
}

// Namespace namespace_f1a8383ecf43bcbc/namespace_30e7da3797ac6a02
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c
// Size: 0x37d
function function_5b0291aeab99561b(bot) {
    var_b252afb1c6d8213c = bot namespace_bfa2898056f8354::function_7e7ddfa33eff2c11();
    if (var_b252afb1c6d8213c.size == 0) {
        return undefined;
    }
    target = spawnstruct();
    var_ad2f80c3d8d4e44e = -100;
    var_efabc1f8231cc4f9 = undefined;
    var_343466bbc23688c9 = level.var_6be7b375ec4a629c[0];
    /#
        assert(isdefined(var_343466bbc23688c9) && isdefined(var_343466bbc23688c9["items"]));
    #/
    foreach (var_cb325ddb4a764623, cost in var_343466bbc23688c9["items"]) {
        if (cost["cost"] <= 0 || bot.plundercount < cost["cost"]) {
            continue;
        }
        var_17bec417681d2af0 = function_400a728b86054272(bot, var_cb325ddb4a764623);
        if (!isdefined(var_17bec417681d2af0)) {
            continue;
        }
        if (var_17bec417681d2af0 > var_ad2f80c3d8d4e44e) {
            var_ad2f80c3d8d4e44e = var_17bec417681d2af0;
            var_efabc1f8231cc4f9 = var_cb325ddb4a764623;
        }
    }
    if (!isdefined(var_efabc1f8231cc4f9)) {
        return undefined;
    }
    target.var_1657e74c9190d2a2 = namespace_a4b43c1cf86c6fe5::function_fe176342ed52b44f(var_efabc1f8231cc4f9);
    target.channel = "br_item_purchase";
    target.itemname = var_efabc1f8231cc4f9;
    var_ff4b6d39036010b = bot function_8a0fa223b19e44f4(var_b252afb1c6d8213c, self.constants.var_ea186a77c016a88d, self.constants.var_9551c1a2c6f5863, 0, self.constants.var_93bcc2b99d24433f, self.constants.var_5107f0b927dad2b);
    if (!isdefined(var_ff4b6d39036010b) || function_f7df7edcfce4b1f2(var_ff4b6d39036010b.target, bot)) {
        return undefined;
    }
    var_9073e5955eaebe2c = function_9d1ab012058221bb(function_1c51f7c46a848ddd(), self.constants.var_e23500dbd314bae2, self.constants.var_e58a5e1efeb78937);
    var_8aee78bd838ba612 = function_9d1ab012058221bb(bot.plundercount, self.constants.var_8e95bda6c02d6964, self.constants.var_2a7a0c76f330e72d);
    var_ff4b6d39036010b.score = var_ff4b6d39036010b.score + var_9073e5955eaebe2c;
    var_ff4b6d39036010b.score = var_ff4b6d39036010b.score + var_8aee78bd838ba612;
    circle = bot function_e5b4b5992cddb221();
    var_79eef5a8e34ac410 = circle.radius - distance(var_ff4b6d39036010b.target.origin, circle.origin);
    var_e2d41d6be5320861 = function_9d1ab012058221bb(var_79eef5a8e34ac410, self.constants.var_79eef5a8e34ac410, self.constants.var_ca580a719e470379);
    var_ff4b6d39036010b.score = var_ff4b6d39036010b.score + var_e2d41d6be5320861;
    target.buystation = var_ff4b6d39036010b.target;
    result = spawnstruct();
    result.target = target;
    result.score = var_ad2f80c3d8d4e44e + var_ff4b6d39036010b.score;
    return result;
}

// Namespace namespace_f1a8383ecf43bcbc/namespace_30e7da3797ac6a02
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d1
// Size: 0x60
function function_400a728b86054272(bot, var_bf09a57af008acd6) {
    var_a1093166de09e6b8 = self.constants.var_e34f223c4f415ed0[var_bf09a57af008acd6];
    if (isdefined(var_a1093166de09e6b8) && bot function_bbc2d6967287dc7(var_a1093166de09e6b8)) {
        return self.constants.var_7d0fd6ff10edefd6[var_bf09a57af008acd6];
    } else {
        return undefined;
    }
}

// Namespace namespace_f1a8383ecf43bcbc/namespace_30e7da3797ac6a02
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x538
// Size: 0x83
function function_f7df7edcfce4b1f2(buystation, bot) {
    if (!isdefined(buystation.var_19c6f51451310013)) {
        return 0;
    }
    var_3f6f0f4c8e8d9b4c = 15000;
    var_ecc808e906f27f3 = buystation.var_19c6f51451310013[bot.entity_number];
    if (!isdefined(var_ecc808e906f27f3) || gettime() > var_ecc808e906f27f3 + var_3f6f0f4c8e8d9b4c) {
        buystation.var_19c6f51451310013[bot.entity_number] = undefined;
        return 0;
    }
    return 1;
}

