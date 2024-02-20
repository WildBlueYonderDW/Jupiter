// mwiii decomp prototype
#namespace namespace_27a98b98aa61a370;

// Namespace namespace_27a98b98aa61a370/namespace_87e70a4c0468fd81
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b
// Size: 0x82
function init() {
    level.var_be6a42242be00b66 = isdefined(level.var_62f6f7640e4431e3) && istrue(level.var_62f6f7640e4431e3.var_53fc2c66905a7332);
    /#
        if (getdvarint(@"hash_e600610a3da3e873", 0) > 0) {
            level.var_be6a42242be00b66 = 0;
        }
    #/
    if (istrue(level.var_be6a42242be00b66) && !function_950c8234f03299d4()) {
        /#
            function_5013853947770621(#"hash_b3573b60d92756b9");
        #/
        level.var_be6a42242be00b66 = 0;
        return;
    }
}

// Namespace namespace_27a98b98aa61a370/namespace_87e70a4c0468fd81
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e4
// Size: 0x170
function function_4a2ecb33b6adeb85(damagedata, var_e913079a5ffda56d) {
    if (!level.var_be6a42242be00b66) {
        return 0;
    }
    objweapon = damagedata.objweapon;
    meansofdeath = damagedata.meansofdeath;
    var_b66e269a387db351 = var_e913079a5ffda56d.var_b66e269a387db351;
    if (!isdefined(var_b66e269a387db351)) {
        /#
            assertmsg("Must provide disablesToKill.");
        #/
        return;
    }
    if (isstring(meansofdeath)) {
        meansofdeath = function_1823ff50bb28148d(meansofdeath);
    }
    var_8062dd0b066fce8b = weaponclass(objweapon);
    if (isstring(var_8062dd0b066fce8b)) {
        var_8062dd0b066fce8b = function_1823ff50bb28148d(var_8062dd0b066fce8b);
    }
    foreach (var_e1e1bfdd0ed6864f in var_b66e269a387db351) {
        if (isdefined(var_e1e1bfdd0ed6864f.weaponclass) && var_e1e1bfdd0ed6864f.weaponclass != var_8062dd0b066fce8b) {
            continue;
        }
        if (isdefined(var_e1e1bfdd0ed6864f.meansofdeath) && var_e1e1bfdd0ed6864f.meansofdeath != meansofdeath) {
            continue;
        }
        if (isdefined(var_e1e1bfdd0ed6864f.var_390a3a649f749f38) && var_e1e1bfdd0ed6864f.var_390a3a649f749f38 != var_e1e1bfdd0ed6864f.var_390a3a649f749f38) {
            continue;
        }
        return var_e1e1bfdd0ed6864f.var_b66e269a387db351;
    }
}

// Namespace namespace_27a98b98aa61a370/namespace_87e70a4c0468fd81
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b
// Size: 0x2cd
function function_c204e7f8a2ab087f(attacker, objweapon, mod, amount, maxhealth, var_27a98b98aa61a370) {
    var_85dce75bab934da3 = var_27a98b98aa61a370.var_c826d3b6bb850;
    hitstokill = var_27a98b98aa61a370.var_aaf772ef14275e0b;
    if (!isdefined(var_85dce75bab934da3)) {
        /#
            assertmsg("Must provide multipliers when calculating modified anti-killstreak damage.");
        #/
        return amount;
    }
    if (!isdefined(hitstokill)) {
        /#
            assertmsg("Must provide hits to kill matrix when calculating modified anti-killstreak damage.");
        #/
        return amount;
    }
    if (isstring(mod)) {
        mod = function_1823ff50bb28148d(mod);
    }
    var_8062dd0b066fce8b = weaponclass(objweapon);
    if (isstring(var_8062dd0b066fce8b)) {
        var_8062dd0b066fce8b = function_1823ff50bb28148d(var_8062dd0b066fce8b);
    }
    damageamount = amount;
    foreach (var_a5c813dce206559b in hitstokill) {
        if (isdefined(var_a5c813dce206559b.weaponclass) && var_a5c813dce206559b.weaponclass != var_8062dd0b066fce8b) {
            continue;
        }
        if (isdefined(var_a5c813dce206559b.meansofdeath) && var_a5c813dce206559b.meansofdeath != mod) {
            continue;
        }
        if (isdefined(var_a5c813dce206559b.var_390a3a649f749f38) && var_a5c813dce206559b.var_390a3a649f749f38 != objweapon.var_390a3a649f749f38) {
            continue;
        }
        var_b41d21142ce58d82 = var_a5c813dce206559b.hitstokill;
        if (var_b41d21142ce58d82 <= 0) {
            /#
                assertmsg("Cannot have " + var_b41d21142ce58d82 + " hits to kill. Must use a positive number.");
            #/
        } else {
            damageamount = int(ceil(float(self.maxhealth) / var_b41d21142ce58d82));
            return damageamount;
        }
    }
    foreach (var_5da114c79116631 in var_85dce75bab934da3) {
        if (isdefined(var_5da114c79116631.weaponclass) && var_5da114c79116631.weaponclass != var_8062dd0b066fce8b) {
            continue;
        }
        if (isdefined(var_5da114c79116631.meansofdeath) && var_5da114c79116631.meansofdeath != mod) {
            continue;
        }
        if (isdefined(var_5da114c79116631.var_390a3a649f749f38) && var_5da114c79116631.var_390a3a649f749f38 != objweapon.var_390a3a649f749f38) {
            continue;
        }
        var_b2646ba6b5716a4e = var_5da114c79116631.multiplier;
        damageamount = int(ceil(var_b2646ba6b5716a4e * amount));
        return damageamount;
    }
    return int(damageamount);
}

// Namespace namespace_27a98b98aa61a370/namespace_87e70a4c0468fd81
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x630
// Size: 0x36
function function_60d871193bd11dba(var_e913079a5ffda56d, maxhealth) {
    if (!istrue(level.var_be6a42242be00b66)) {
        return;
    }
    self.var_e913079a5ffda56d = var_e913079a5ffda56d;
    self.maxhealth = maxhealth;
}

