// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_40e63dd222434655;
#using scripts\mp\utility\player.gsc;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using script_4f76bee355450e6d;
#using script_7fc58c95ee47d870;
#using script_ca34b05781dbece;
#using script_64acb6ce534155b7;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;

#namespace pickup;

// Namespace pickup/namespace_351e75b9d115392f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd
// Size: 0x29
function function_eda57308516bfc5f() {
    decision = function_bffb5b682a4ef6a2(&function_e0844a2b7f904b14, undefined, undefined, &function_b97e27a7552f6031);
    decision function_7fe87b5456bf27b8();
    return decision;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30e
// Size: 0x2b
function function_b97e27a7552f6031(var_9dbfe859b2119409, var_9dbfe559b2118d70) {
    return var_9dbfe859b2119409.entity == var_9dbfe559b2118d70.entity;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x341
// Size: 0x249
function function_e0844a2b7f904b14(bot) {
    result = spawnstruct();
    result.var_72bb89e60d3674df = 0;
    result.var_2828a4fe12d2eb06 = undefined;
    var_32028db58afc5fa9 = bot namespace_10ca308be68952f::function_7e7ddfa33eff2c11();
    var_e58460405b36b647 = bot namespace_a88fd88e39d4308::function_7e7ddfa33eff2c11();
    var_ec10c084410e83fc = bot namespace_9d48dceb90164d92::function_7e7ddfa33eff2c11();
    function_cec7c34920151fa();
    function_6a902180ebd8f336(bot, var_32028db58afc5fa9, result);
    function_6a902180ebd8f336(bot, var_e58460405b36b647, result);
    function_6a902180ebd8f336(bot, var_ec10c084410e83fc, result);
    if (bot function_9612d351d714efb1()) {
        result.var_72bb89e60d3674df = result.var_72bb89e60d3674df + self.constants.var_65789424b6d020cc;
    }
    if (isdefined(self.var_8ff05874bbb1ac7c) && self.var_8ff05874bbb1ac7c.score > result.var_72bb89e60d3674df) {
        self.var_df9d35d9b4bee654 = self.var_8ff05874bbb1ac7c;
        return self.var_8ff05874bbb1ac7c.score;
    }
    if (isdefined(result.var_2828a4fe12d2eb06) && isdefined(result.var_2828a4fe12d2eb06.entity)) {
        targetentity = result.var_2828a4fe12d2eb06.entity;
        var_86d7abc82c67ce1c = targetentity.origin;
        var_564aa5b5974905d9 = function_f8350ab882cc2439(var_86d7abc82c67ce1c);
        distsq = distancesquared(var_86d7abc82c67ce1c, var_564aa5b5974905d9);
        if (distsq > self.constants.var_aeaac16f3357bcae) {
            targetentity.var_2a6f82a735950253 = 1;
            return 0;
        }
        self.var_df9d35d9b4bee654 = function_ff35a4d756374ede("pickup", result.var_2828a4fe12d2eb06, "main", "id:" + targetentity.index + " location:" + var_86d7abc82c67ce1c, &function_35671b7b1a04bf58, self, &function_f4caae7e8af9d32c, self.constants.var_57228f75b014a7b8, self.constants.var_daec6fd98c7cee50);
    }
    return result.var_72bb89e60d3674df;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x592
// Size: 0x24b
function function_6a902180ebd8f336(bot, entarray, result) {
    /#
        assert(isdefined(result.var_72bb89e60d3674df));
    #/
    var_e09327b44385b3ce = undefined;
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        var_e09327b44385b3ce = array_contains(level.questinfo.teamsonquests, bot.team);
    } else {
        var_e09327b44385b3ce = namespace_1eb3c4e0e28fac71::function_7094c7010c5e3827(bot.team);
    }
    var_a1eb8777f2132a97 = function_1c51f7c46a848ddd();
    var_9073e5955eaebe2c = function_9d1ab012058221bb(var_a1eb8777f2132a97, self.constants.var_e23500dbd314bae2, self.constants.var_e58a5e1efeb78937);
    foreach (ent in entarray) {
        if (ent.type == "") {
            continue;
        }
        if (function_d4454868dbb4e0ab(ent)) {
            continue;
        }
        if (ent.type == "tablet") {
            if (var_e09327b44385b3ce) {
                continue;
            }
            var_17bec417681d2af0 = function_60067bf70f45d4dd(bot, ent, var_a1eb8777f2132a97);
        } else if (ent.type == "airdrop_loadout") {
            var_17bec417681d2af0 = function_4d09767d744e71e(bot, ent, var_9073e5955eaebe2c);
        } else {
            var_17bec417681d2af0 = function_dc1a77b6a8234cd(bot, ent, var_9073e5955eaebe2c);
        }
        if (!isdefined(var_17bec417681d2af0)) {
            continue;
        }
        var_7d9a6d00a336393b = namespace_bbc79db4c3949a5c::gettimetilldangerforpoint(ent.entity.origin);
        if (var_7d9a6d00a336393b >= 0) {
            var_40f4b7920a0ca8a0 = function_9d1ab012058221bb(var_7d9a6d00a336393b, self.constants.var_93bcc2b99d24433f, self.constants.var_5107f0b927dad2b);
            var_17bec417681d2af0 = var_17bec417681d2af0 + var_40f4b7920a0ca8a0;
        }
        var_17bec417681d2af0 = var_17bec417681d2af0 + function_4e58bf49977d1bfd(ent);
        if (var_17bec417681d2af0 > result.var_72bb89e60d3674df) {
            result.var_2828a4fe12d2eb06 = ent;
            result.var_72bb89e60d3674df = var_17bec417681d2af0;
        }
    }
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e4
// Size: 0x240
function function_dc1a77b6a8234cd(bot, loot, var_9073e5955eaebe2c) {
    var_17bec417681d2af0 = 0;
    var_5732ae178f7310e6 = distance(loot.entity.origin, bot.origin);
    if (var_5732ae178f7310e6 > self.constants.var_65a3f0d7a3f96f0f) {
        return var_17bec417681d2af0;
    }
    var_2f96c6a3fad9912 = self.constants.var_2f96c6a3fad9912;
    var_76dabee05a567f15 = bot function_bbc2d6967287dc7(loot.entity.type, var_2f96c6a3fad9912);
    var_98ac27fd131b6faf = 0;
    if (!istrue(var_76dabee05a567f15)) {
        return undefined;
    }
    var_98ac27fd131b6faf = ter_op(isdefined(var_2f96c6a3fad9912.var_1987d8b5d11dfd90[loot.entity.type]), var_2f96c6a3fad9912.var_1987d8b5d11dfd90[loot.entity.type], var_2f96c6a3fad9912.var_3a436bd812a2b86[function_1823ff50bb28148d(loot.type)]);
    if (bot function_bcb0778bb33e86de(loot.entity.origin) && var_98ac27fd131b6faf > 0) {
        if (loot.type == "cache" || loot.type == "ammo_restock") {
            var_9122f7a6b88609ed = ter_op(function_f6be8129663916fd(loot.entity), 0, var_5732ae178f7310e6);
            var_17bec417681d2af0 = function_9d1ab012058221bb(var_9122f7a6b88609ed, self.constants.var_6c134b04a6e15e0f, self.constants.var_eea720f577a76b0b) + var_9073e5955eaebe2c;
        } else if (var_5732ae178f7310e6 < self.constants.var_5dcbc5ccec64f7de) {
            var_17bec417681d2af0 = var_98ac27fd131b6faf + var_9073e5955eaebe2c;
        } else if (var_5732ae178f7310e6 < self.constants.var_576f233d91cc27ff) {
            var_17bec417681d2af0 = ter_op(bot function_2f201ca20292ad12(loot.entity.origin), var_98ac27fd131b6faf + var_9073e5955eaebe2c, 0);
        }
    }
    return var_17bec417681d2af0;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2c
// Size: 0x21e
function function_60067bf70f45d4dd(bot, contract, var_a1eb8777f2132a97) {
    var_17bec417681d2af0 = 0;
    if (bot function_bcb0778bb33e86de(contract.entity.origin)) {
        type = undefined;
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            type = contract.entity.tablettype;
        } else {
            type = contract.entity.tablettype.ref;
        }
        switch (type) {
        case #"hash_96e641d7fe5b1cf1":
            var_61ef9eafd8abb6be = self.constants.var_b516486de7d13311;
            break;
        case #"hash_1cc92bad632fbc15":
            var_61ef9eafd8abb6be = self.constants.var_de1c985391b99a2b;
            break;
        case #"hash_5c57b61aa79410db":
            var_61ef9eafd8abb6be = self.constants.var_e749e36fec025a10;
            break;
        case #"hash_7b0c576c4a7e4890":
            var_61ef9eafd8abb6be = self.constants.var_3f74fc9a89bd6f1e;
            break;
        case #"hash_d0eb63c46c25ef55":
            var_61ef9eafd8abb6be = self.constants.var_2ecab98395f8d2f8;
            break;
        default:
            return 0;
            break;
        }
        var_17bec417681d2af0 = function_9d1ab012058221bb(var_a1eb8777f2132a97, self.constants.var_2e392955e7388247, var_61ef9eafd8abb6be);
        if (var_17bec417681d2af0 > 0) {
            var_5732ae178f7310e6 = distance(contract.entity.origin, bot.origin);
            var_9122f7a6b88609ed = ter_op(function_f6be8129663916fd(contract.entity), 0, var_5732ae178f7310e6);
            var_17bec417681d2af0 = var_17bec417681d2af0 + function_9d1ab012058221bb(var_9122f7a6b88609ed, self.constants.var_7604b66fc0bf7887, self.constants.var_9ba7c398de3ab6b8);
        }
    }
    return var_17bec417681d2af0;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc52
// Size: 0xc5
function function_4d09767d744e71e(bot, airdrop, var_9073e5955eaebe2c) {
    var_17bec417681d2af0 = self.constants.var_c0c5b5dd018dc8cf;
    var_5732ae178f7310e6 = distance(airdrop.entity.origin, bot.origin);
    var_9122f7a6b88609ed = ter_op(function_f6be8129663916fd(airdrop.entity), 0, var_5732ae178f7310e6);
    var_17bec417681d2af0 = var_17bec417681d2af0 + function_9d1ab012058221bb(var_9122f7a6b88609ed, self.constants.var_18143b1f14cc381d, self.constants.var_c82fa9468a010a2);
    var_17bec417681d2af0 = var_17bec417681d2af0 + var_9073e5955eaebe2c;
    return var_17bec417681d2af0;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1f
// Size: 0x30
function function_f6be8129663916fd(entity) {
    if (isdefined(self.var_16bd053d665e8c13)) {
        return (self.var_16bd053d665e8c13.entity == entity);
    }
    return 0;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd57
// Size: 0x46
function function_2f201ca20292ad12(point) {
    var_ccbd7e93d84d42e8 = self botpredictseepoint(point);
    var_e1b57ec944a64540 = 40;
    if (isvector(var_ccbd7e93d84d42e8)) {
        return (abs(var_ccbd7e93d84d42e8[2] - point[2]) < var_e1b57ec944a64540);
    }
    return 0;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda5
// Size: 0x4c9
function function_35671b7b1a04bf58(bot) {
    /#
        assert(isdefined(self.var_ec02147fee952ce2) && isdefined(self.var_ec02147fee952ce2.entity));
    #/
    target = self.var_ec02147fee952ce2;
    self.decision.var_16bd053d665e8c13 = target;
    var_ee2eea100343d059 = target.type == "cache";
    var_60df4d40bba49d3c = target.type == "ammo_restock";
    var_54addd2a9a7ccdf2 = target.type == "airdrop_loadout";
    var_fe2e596fd1c7fa49 = !var_ee2eea100343d059 && !var_60df4d40bba49d3c && !var_54addd2a9a7ccdf2;
    var_e6a27152696418bd = 0;
    var_a02b95b69b3e316 = 0;
    var_883446d683094420 = 56;
    targetpos = undefined;
    if (var_60df4d40bba49d3c || var_54addd2a9a7ccdf2) {
        targetpos = function_f8350ab882cc2439(target.entity.origin);
    } else if (var_ee2eea100343d059) {
        var_883446d683094420 = 24;
        var_90a93951e4c15e03 = 45;
        pos = target.entity.origin + anglestoleft(target.entity.angles) * var_90a93951e4c15e03;
        targetpos = function_f8350ab882cc2439(pos);
    } else {
        targetpos = target.entity.origin;
    }
    bot function_9e400058ef021b03(targetpos, var_883446d683094420);
    while (1) {
        result = bot waittill_any_in_array_or_timeout([0:"goal", 1:"bad_path"], 1);
        if (result == "goal") {
            bot function_8b201bccc0aa3695(targetpos, 0.5);
            if (var_ee2eea100343d059) {
                if (!bot function_d75cf6c7882b3bc4(target.entity)) {
                    bot botpressbutton("use", 0.25);
                }
                function_f519820317d400ea();
                var_be48ed4e05efe5cf = 45;
                var_60c1a9bc1584ef28 = 1.5;
                bot function_d1acad1ee42b2b2f(target.entity, var_60c1a9bc1584ef28, var_be48ed4e05efe5cf);
            } else if (var_60df4d40bba49d3c) {
                bot botpressbutton("use", 0.25);
                self.decision function_2d9fcd6970321ba(target);
            } else if (var_54addd2a9a7ccdf2) {
                if (!isdefined(target.entity)) {
                    return "airdrop has been consumed";
                } else if (target.entity.inuse) {
                    return "airdrop is in use";
                }
                /#
                    function_f3cf203834e48c6d("<unknown string>");
                #/
                wait(1.5);
                target.entity namespace_d20f8ef223912e12::br_givedropbagloadout(bot);
                self.decision function_2d9fcd6970321ba(target);
            } else {
                if (var_a02b95b69b3e316 || function_a8b0c59fb4582264(target.entity)) {
                    return "Target missed";
                }
                var_12e7d95b6cc9cc78 = namespace_cb965d2f71fefddc::lootused(target.entity, undefined, "visible", bot, 0);
                if (!isdefined(var_12e7d95b6cc9cc78)) {
                    return "Target missed";
                } else if (!var_12e7d95b6cc9cc78) {
                    if (isdefined(target.entity)) {
                        self.decision function_2d9fcd6970321ba(target);
                        return ("Can't pick up " + target.entity.type);
                    } else {
                        return ("Can't pick up missed " + target.type);
                    }
                }
                if (isdefined(target.entity.lootsource) && target.entity.lootsource == "cache") {
                    function_f519820317d400ea();
                }
            }
            break;
        } else if (result == "bad_path") {
            self.decision function_2d9fcd6970321ba(target);
            return result;
        } else if (result == "timeout") {
            if (var_ee2eea100343d059) {
                if (!var_e6a27152696418bd) {
                    var_e6a27152696418bd = function_a12ee73ed183cb4f(target.entity);
                }
                if (var_e6a27152696418bd && bot function_106adf4429e0902(targetpos, self.decision.constants.var_576f233d91cc27ff)) {
                    return "Cache is open";
                }
            } else if (var_fe2e596fd1c7fa49) {
                if (!var_a02b95b69b3e316) {
                    var_a02b95b69b3e316 = function_a8b0c59fb4582264(target.entity);
                }
                if (var_a02b95b69b3e316 && bot function_106adf4429e0902(targetpos, self.decision.constants.var_576f233d91cc27ff)) {
                    return "Can't see target";
                }
            }
        }
    }
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1275
// Size: 0xc3
function function_d75cf6c7882b3bc4(var_36b81911e31bb387) {
    currentstate = var_36b81911e31bb387 getscriptablepartstate("body", 1);
    if (!isdefined(currentstate)) {
        return 0;
    }
    switch (currentstate) {
    case #"hash_6508078488d5273a":
    case #"hash_80a322219de080cb":
    case #"hash_c8b4e464ad01036b":
        namespace_1b7e64f50cca9321::lootcacheused(var_36b81911e31bb387, "body", currentstate, self);
        return 1;
    case #"hash_33d00c02a93d1b5e":
    case #"hash_7381879eb9689156":
    case #"hash_7c3dfb169613e676":
    case #"hash_985b75d07cfeddbf":
    case #"hash_ca3f53e474155975":
    case #"hash_f31862086b1bb0a8":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133f
// Size: 0x4d
function function_f519820317d400ea() {
    if (randomfloat(1) < 0.5) {
        /#
            function_f3cf203834e48c6d("<unknown string>");
        #/
        var_9b9ffcd51fca002a = randomfloatrange(2.5, 5);
        wait(var_9b9ffcd51fca002a);
        /#
            function_f3cf203834e48c6d("<unknown string>");
        #/
    }
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1393
// Size: 0x47
function function_a12ee73ed183cb4f(var_36b81911e31bb387) {
    currentstate = var_36b81911e31bb387 getscriptablepartstate("body", 1);
    return isdefined(currentstate) && (currentstate == "fully_opening_unusable" || currentstate == "fully_open_unusable" || currentstate == "closed_to_fully_open_unusable");
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e2
// Size: 0x4b
function function_a8b0c59fb4582264(entity) {
    if (!isdefined(entity)) {
        return 1;
    }
    var_cf94f6893f81b1af = "hidden";
    currentstate = entity getscriptablepartstate(entity.type, 1);
    return isdefined(currentstate) && currentstate == var_cf94f6893f81b1af;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1435
// Size: 0x41
function function_106adf4429e0902(targetpos, var_576f233d91cc27ff) {
    var_cc838cbb6f1a700b = distancesquared(targetpos, self.origin) < squared(var_576f233d91cc27ff);
    return var_cc838cbb6f1a700b && function_2f201ca20292ad12(targetpos);
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x147e
// Size: 0x21
function function_f4caae7e8af9d32c(action) {
    action.decision.var_16bd053d665e8c13 = undefined;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a6
// Size: 0xd
function function_7fe87b5456bf27b8() {
    self.var_ceb0aaf169ddc698 = [];
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ba
// Size: 0x3d
function function_2d9fcd6970321ba(loot) {
    if (isdefined(loot.entity) && function_d4454868dbb4e0ab(loot)) {
        return;
    }
    self.var_ceb0aaf169ddc698[self.var_ceb0aaf169ddc698.size] = loot;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fe
// Size: 0x8b
function function_d4454868dbb4e0ab(loot) {
    foreach (item in self.var_ceb0aaf169ddc698) {
        if (loot.entity.index == item.entity.index) {
            return 1;
        }
    }
    return 0;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1591
// Size: 0x8b
function function_cec7c34920151fa() {
    if (self.var_ceb0aaf169ddc698.size == 0) {
        return;
    }
    var_e5dab4f107f3a279 = [];
    foreach (item in self.var_ceb0aaf169ddc698) {
        if (isdefined(item.entity)) {
            var_e5dab4f107f3a279[var_e5dab4f107f3a279.size] = item;
        }
    }
    self.var_ceb0aaf169ddc698 = var_e5dab4f107f3a279;
}

// Namespace pickup/namespace_351e75b9d115392f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1623
// Size: 0xfd
function function_54f633f649764ea9(bot, var_40182794c7966d47) {
    function_cec7c34920151fa();
    var_b039fb43c7e9fd4a = undefined;
    if (isdefined(var_40182794c7966d47) && isdefined(var_40182794c7966d47.entity)) {
        var_b039fb43c7e9fd4a = var_40182794c7966d47.entity;
    }
    var_a8d1793197306629 = bot namespace_10ca308be68952f::function_7e7ddfa33eff2c11();
    var_a8d1793197306629 = array_randomize(var_a8d1793197306629);
    foreach (loot in var_a8d1793197306629) {
        var_5cb43410b9cd63ef = bot function_bcb0778bb33e86de(loot.entity.origin) && (!isdefined(var_b039fb43c7e9fd4a) || var_b039fb43c7e9fd4a != loot.entity) && !function_d4454868dbb4e0ab(loot);
        if (var_5cb43410b9cd63ef) {
            return loot;
        }
    }
    return undefined;
}

