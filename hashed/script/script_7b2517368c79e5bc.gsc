// mwiii decomp prototype
#using scripts\engine\scriptable.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_5032ed8da1128621;
#using scripts\common\utility.gsc;
#using script_43971bbeefd98f05;
#using script_3e2f8cc477d57433;
#using script_32dd4b86977d430c;
#using script_600b944a95c3a7bf;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_6a11212698833ae9;
#using script_14e5d6cbb6a32c41;
#using script_1de396bd08617dd4;
#using script_cbdac3b4a48bb8f;
#using script_53758641d3c1870c;
#using script_670b6177abb05234;
#using script_6f74c67411fcab41;
#using script_443d99fe707f1d9f;
#using script_14183f3fced4ee2b;
#using script_64457324b9cce77;
#using script_3282f33bea60a32;
#using script_12a101fb4d4cb63e;
#using script_54be039c89fddc12;
#using script_3af0e35fc47898ae;
#using script_3cb11ad6dcd981;
#using scripts\cp_mp\calloutmarkerping.gsc;

#namespace namespace_49e179ec476603d6;

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc96
// Size: 0x2ee
function function_c7c12eafa3215cfe() {
    utility::registersharedfunc("game", "isCommonItemEnabled", &function_e2c0d0db030bd925);
    if (!function_e2c0d0db030bd925()) {
        return;
    }
    namespace_7c5bb630aad381e::function_200bd098377a8674("common_items", 500, 10);
    level.var_986acb83cc29ed77 = spawnstruct();
    level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda = [];
    function_a621885d4088d15f();
    level utility::flag_init("common_items_init");
    loot::init();
    thread namespace_94efe9b48c602c39::function_628ac163573e544e();
    thread namespace_41242478a801e045::function_f2c483126e453846();
    thread namespace_f9e8a327d793c098::function_b60c68caa2f279ab();
    thread namespace_f808ba0ae0debcf5::function_1a53aa54f5e85b78();
    thread namespace_7a0486ab8e12b1a::function_265288d8625410c7();
    thread namespace_fe6cb1145ab372e6::function_618664c61d5fc27b();
    thread namespace_de169b8ad93c38b5::function_e1a78f7ca6c76a52();
    thread namespace_736197e4d378b91b::function_cbd6a7a14d9bb07b();
    thread namespace_ab72fb42cd326323::function_4113bac1fcc24f04();
    thread namespace_77804604a7f8a031::function_e365b9e0c732498c();
    thread namespace_2bf4cd4dfd211422::function_2c48f8f076e75751();
    thread namespace_fcd9a54e8b7f9724::function_ef5eba565dd3356d();
    thread namespace_6236231ba2ba2d74::function_db1254dca5eaf211();
    thread namespace_6a37cb2f602c62bc::function_fc61ac927e47d181();
    thread namespace_9b83895815d12835::function_41430df99d53560a();
    thread namespace_59a9ea269513a828::function_62aa9a67eff644db();
    thread namespace_426352158e3bb03b::function_2f94630a18a17ba2();
    function_fd0060992e35b410();
    namespace_fe9526a81c458d8f::inventory_init();
    scriptable::scriptable_addusedcallback(&function_ccb2889218715cb1);
    scriptable::scriptable_addautousecallback(&function_ccb2889218715cb1);
    utility::registersharedfunc("game", "spawnPickupFromList", &function_cd45408bd44fab07);
    utility::registersharedfunc("game", "getScriptableFromLootID", &function_2f759e70c6189ff0);
    utility::registersharedfunc("game", "getBundleNameFromLootID", &function_fc925a153c7fd55c);
    utility::registersharedfunc("game", "getBundleNameFromScriptable", &function_2cdc55ba39d97d70);
    utility::registersharedfunc("game", "obtainItemEquip", &function_de489fa2ffdb7f2d);
    utility::registersharedfunc("game", "getItemBundleNameFromRef", &function_61d960957fcf3ca0);
    utility::registersharedfunc("game", "spawnNewItemFromScriptable", &function_119bf86e1d774c3);
    utility::registersharedfunc("game", "showStockLootFeed", &function_61b68d989b016af3);
    utility::registersharedfunc("game", "getLootIDFromRef", &function_2c836ad05e5f634c);
    level utility::flag_set("common_items_init");
    level.var_3e5d2a63c1d15191 = getdvarfloat(@"hash_3d0c37a1b0da97b3", 0.8);
    level.var_1dfefe3988a59ae5 = getdvarint(@"hash_d7613094ea4ba91f", 0);
    level.var_cb89daf3a1d3e761 = getdvarint(@"hash_f621128b1ee62123", 1);
    level.var_a0b1f76228d242e1 = getdvarint(@"hash_1761d693d5c4ded5", 5);
    level.var_b08a4f5480f5801d = getdvarfloat(@"hash_e2cadd2e657c0c27", 0.5);
    level.var_3a94e816b6c1f549 = getdvarfloat(@"hash_f877f79616e047c7", 0.85);
    level.var_77551c1821d16927 = getdvarfloat(@"hash_290c05a9320b623d", 50);
    level.var_f4a8313dc2ced539 = getdvarint(@"hash_3ca29b429f678228", 1);
    level.var_bb7795c61887fc81 = getdvarfloat(@"hash_b91d6bc7e0694ac", 2000);
    /#
        level thread function_b270e989412a5f67();
    #/
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8b
// Size: 0x34
function function_e2c0d0db030bd925() {
    if (!isdefined(level.var_62f6f7640e4431e3)) {
        /#
            assertmsg("CommonItemERROR: level.gameTypeBundle not yet defined while using the item system");
        #/
        return 0;
    }
    return istrue(level.var_62f6f7640e4431e3.var_d651598a91f20ae3);
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc7
// Size: 0xf8
function function_900f562c61c6a5d6(itemtype, usefunc, var_381daafc5fc31b7f, var_86af96fe008c96ee, var_df9b308efe82294a, var_bd286dd0c1f53098, var_e0992538cf18c35) {
    if (isdefined(level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda[itemtype])) {
        /#
            assertmsg("CommonItemERROR: Callbacks already registered for item type: " + itemtype);
        #/
        return;
    }
    /#
        assert(isdefined(usefunc));
    #/
    callbacks = spawnstruct();
    callbacks.usefunc = usefunc;
    callbacks.var_381daafc5fc31b7f = var_381daafc5fc31b7f;
    callbacks.var_86af96fe008c96ee = var_86af96fe008c96ee;
    callbacks.var_df9b308efe82294a = var_df9b308efe82294a;
    callbacks.var_bd286dd0c1f53098 = var_bd286dd0c1f53098;
    callbacks.var_e0992538cf18c35 = var_e0992538cf18c35;
    callbacks.funcs = [];
    level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda[itemtype] = callbacks;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c6
// Size: 0xde
function function_5958815b72ad58a0(itemtype, var_aa1252cceaef87a8, var_d3094b9eeab44a9b) {
    if (!isdefined(level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda)) {
        level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda = [];
    }
    if (!isdefined(level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda[itemtype])) {
        level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda[itemtype] = <error pop>;
    }
    if (!isdefined(level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda[itemtype].funcs)) {
        level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda[itemtype].funcs = [];
    }
    level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda[itemtype].funcs[var_aa1252cceaef87a8] = var_d3094b9eeab44a9b;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ab
// Size: 0x68
function function_4651d0094e0bd59d(itemtype, var_aa1252cceaef87a8) {
    if (isdefined(level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda) && isdefined(level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda[itemtype])) {
        return level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda[itemtype].funcs[var_aa1252cceaef87a8];
    }
    return undefined;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121b
// Size: 0x2f3
function function_576728d3d4486bd6(item, var_b2635db617b09abd, var_7819673a9bd72341, var_95484d8d503de3b8) {
    scriptablename = item.type;
    if (function_f0c15201c9f7e1db(scriptablename)) {
        var_fbe755f0978c0369 = function_2cdc55ba39d97d70(scriptablename);
        var_9ec3e3e77fa5f56c = "itemspawnentry:" + var_fbe755f0978c0369;
        if (function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
            return 0;
        }
        itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
        lootid = function_6d15e119c2779a93(itembundle);
        callbacks = function_cca8bbe88a39ad41(itembundle.type);
        itemcount = item.count;
        if (!isdefined(callbacks)) {
            /#
                assertmsg("CommonItemERROR: No callbacks registered for item type [" + itembundle.type + "]");
            #/
            return 0;
        }
        canuse = 1;
        if (var_b2635db617b09abd) {
            if (isdefined(callbacks.var_381daafc5fc31b7f)) {
                canuse = self [[ callbacks.var_381daafc5fc31b7f ]](itembundle, item, var_b2635db617b09abd, 0);
            }
        } else if (isdefined(callbacks.var_86af96fe008c96ee)) {
            canuse = self [[ callbacks.var_86af96fe008c96ee ]](itembundle, item, var_b2635db617b09abd, 0);
        }
        if (namespace_fe9526a81c458d8f::function_a50a7be98d81e4fd()) {
            if (canuse) {
                var_84ab4c28dc11052d = function_de489fa2ffdb7f2d(item, var_b2635db617b09abd, 1);
                if (istrue(var_84ab4c28dc11052d)) {
                    if (!istrue(var_95484d8d503de3b8)) {
                        function_fbfd7096a2dbc7e7(itembundle, 1);
                    }
                    return 1;
                }
            } else if (var_b2635db617b09abd && !istrue(itembundle.var_bbae53787b1abf3e)) {
                return 0;
            }
            if (!function_b343caad692916aa(itembundle)) {
                if (!var_b2635db617b09abd && !istrue(var_95484d8d503de3b8)) {
                    function_fbfd7096a2dbc7e7(itembundle, 0);
                }
                return 0;
            }
            if (!var_b2635db617b09abd && namespace_fe9526a81c458d8f::function_4f73be3d1273e86b() && !namespace_fe9526a81c458d8f::function_3298f1ad0b756cbd(itembundle, function_b8bfea9514c89a77(item.count))) {
                if (!istrue(var_7819673a9bd72341)) {
                    namespace_fe9526a81c458d8f::function_354e083223035de2(item, lootid);
                } else if (!istrue(var_95484d8d503de3b8)) {
                    function_fbfd7096a2dbc7e7(itembundle, 0);
                }
                return 0;
            }
            var_c3051697735d1320 = item.var_4f74f0aef2b2a8bf;
            remainder = namespace_fe9526a81c458d8f::function_f64964e50cc34c47(var_fbe755f0978c0369, itembundle, item, var_b2635db617b09abd);
            var_dadb14c9ec5baea0 = item.count - remainder;
            if (remainder) {
                item.count = remainder;
                itemcount = remainder;
            } else {
                item.count = 0;
                itemcount = 0;
                function_c14962ea14e58968(item);
            }
            if (var_dadb14c9ec5baea0 > 0) {
                function_61e26b275dfa50e0(itembundle, var_dadb14c9ec5baea0, var_c3051697735d1320, 1, item, var_95484d8d503de3b8);
                return 1;
            }
            if (!var_b2635db617b09abd && !istrue(var_95484d8d503de3b8)) {
                function_fbfd7096a2dbc7e7(itembundle, 0);
            }
            return 0;
        } else {
            if (canuse) {
                var_84ab4c28dc11052d = function_de489fa2ffdb7f2d(item, var_b2635db617b09abd);
                if (istrue(var_84ab4c28dc11052d)) {
                    return 1;
                }
            }
            return 0;
        }
    }
    return 0;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1516
// Size: 0x2c0
function function_de489fa2ffdb7f2d(item, var_b2635db617b09abd, var_95484d8d503de3b8) {
    scriptablename = item.type;
    if (function_f0c15201c9f7e1db(scriptablename)) {
        var_5c8082e48f1a6bfd = function_2cdc55ba39d97d70(scriptablename);
        var_a8856d1c2cbf78f6 = "itemspawnentry:" + var_5c8082e48f1a6bfd;
        if (function_633f07e180b6ec8f(var_a8856d1c2cbf78f6)) {
            return 0;
        }
        var_ffe2f7bc3157d1de = getscriptbundle(var_a8856d1c2cbf78f6);
        callbacks = function_cca8bbe88a39ad41(var_ffe2f7bc3157d1de.type);
        if (!isdefined(callbacks)) {
            /#
                assertmsg("CommonItemERROR: No callbacks registered for item type [" + var_ffe2f7bc3157d1de.type + "]");
            #/
            return 0;
        }
        if (var_b2635db617b09abd) {
            var_1489a088d7cc25cd = 1;
            if (isdefined(callbacks.var_381daafc5fc31b7f)) {
                var_1489a088d7cc25cd = self [[ callbacks.var_381daafc5fc31b7f ]](var_ffe2f7bc3157d1de, item, var_b2635db617b09abd, 0);
            }
            if (var_1489a088d7cc25cd) {
                var_c3051697735d1320 = item.var_4f74f0aef2b2a8bf;
                var_89a5b9e168c41981 = function_bb2e10bb5f7e813f(item, var_5c8082e48f1a6bfd, var_ffe2f7bc3157d1de);
                if (var_89a5b9e168c41981 > 0) {
                    function_61e26b275dfa50e0(var_ffe2f7bc3157d1de, var_89a5b9e168c41981, var_c3051697735d1320, 0, item, var_95484d8d503de3b8);
                    return 1;
                }
            }
        } else {
            if (isdefined(callbacks.var_86af96fe008c96ee)) {
                canuse = self [[ callbacks.var_86af96fe008c96ee ]](var_ffe2f7bc3157d1de, item, var_b2635db617b09abd, 0);
                /#
                    assertex(isdefined(canuse), "Items canUseFunc returned undefined [" + function_f28fd66285fa2c9(scriptablename) + "] Should be true or false");
                #/
            }
            canuse = function_53c4c53197386572(canuse, 1);
            if (istrue(canuse)) {
                var_57accdc40b2f50e = [0:undefined, 1:0];
                var_64009c8d010b1490 = var_57accdc40b2f50e[1];
                var_2814cca693e6ef2d = var_57accdc40b2f50e[0];
                if (isdefined(callbacks.var_df9b308efe82294a)) {
                    var_57acddc40b2f741 = self [[ callbacks.var_df9b308efe82294a ]]();
                    var_64009c8d010b1490 = var_57acddc40b2f741[1];
                    var_2814cca693e6ef2d = var_57acddc40b2f741[0];
                }
                if (isstruct(var_2814cca693e6ef2d) && isdefined(var_2814cca693e6ef2d.ref) && (var_2814cca693e6ef2d.ref != var_ffe2f7bc3157d1de.ref || istrue(var_ffe2f7bc3157d1de.var_6fdd94841e93829f)) && var_64009c8d010b1490 > 0 && var_2814cca693e6ef2d.inventorytype != "Pooled") {
                    function_a2560fe66d697e02(var_2814cca693e6ef2d, var_64009c8d010b1490);
                }
                var_c3051697735d1320 = item.var_4f74f0aef2b2a8bf;
                var_89a5b9e168c41981 = function_bb2e10bb5f7e813f(item, var_5c8082e48f1a6bfd, var_ffe2f7bc3157d1de);
                if (var_89a5b9e168c41981 > 0) {
                    function_61e26b275dfa50e0(var_ffe2f7bc3157d1de, var_89a5b9e168c41981, var_c3051697735d1320, 0, item, var_95484d8d503de3b8);
                    return 1;
                }
            }
            if (!istrue(var_95484d8d503de3b8)) {
                function_fbfd7096a2dbc7e7(var_ffe2f7bc3157d1de, 0);
            }
        }
    }
    return 0;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17de
// Size: 0x50
function function_1a95cb90efa117b8(itembundle, var_4887bb4c8348dddc) {
    item = spawnstruct();
    item.type = itembundle.scriptable;
    item.count = var_4887bb4c8348dddc;
    return function_7f6f62ba8dfd0da0(itembundle, item);
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1836
// Size: 0xc5
function function_7f6f62ba8dfd0da0(itembundle, item) {
    callbacks = function_cca8bbe88a39ad41(itembundle.type);
    /#
        assertex(isdefined(callbacks), "CommonItemERROR: No callbacks registered for item type [" + itembundle.type + "]");
    #/
    /#
        assertex(isdefined(callbacks.usefunc), "CommonItemERROR: No equip func registered for item type [" + itembundle.type + "]");
    #/
    params = spawnstruct();
    params.item = item;
    params.itembundle = itembundle;
    callback::callback("player_used_item", params);
    return self [[ callbacks.usefunc ]](itembundle, item);
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1903
// Size: 0x95
function function_a703a4241f091edc(item, time) {
    if (!isplayer(self)) {
        return;
    }
    if (!isdefined(item.var_b82e5f82c73104ff)) {
        item.var_b82e5f82c73104ff = [];
    }
    playernum = self function_d85aa3c6cfd398cf();
    endtime = gettime() + time * 1000;
    if (isdefined(item.var_b82e5f82c73104ff[playernum]) && item.var_b82e5f82c73104ff[playernum] > endtime) {
        return;
    }
    item.var_b82e5f82c73104ff[playernum] = endtime;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199f
// Size: 0x2d0
function function_a2560fe66d697e02(itembundle, count, dropstruct) {
    if (!isdefined(itembundle)) {
        /#
            assertmsg("CommonItemERROR: Cannot drop an UNDEFINED item");
        #/
        return undefined;
    }
    if (!isdefined(count) || count <= 0) {
        /#
            assertmsg("CommonItemERROR: Cannot drop an INVALID count of item = " + utility::ter_op(isdefined(itembundle.ref), itembundle.ref, "undefined"));
        #/
        return undefined;
    }
    var_fbe755f0978c0369 = function_61d960957fcf3ca0(itembundle.ref);
    var_9ec3e3e77fa5f56c = "itemspawnentry:" + var_fbe755f0978c0369;
    if (function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
        return undefined;
    }
    lootid = function_6d15e119c2779a93(itembundle);
    self dlog_recordplayerevent("dlog_event_player_common_item", [0:"dropped", 1:lootid, 2:"stowed", 3:0, 4:"equipped", 5:0, 6:"bought", 7:0, 8:"sold", 9:0, 10:"type", 11:itembundle.type, 12:"from_cache", 13:0, 14:"from_rift_reward", 15:0]);
    if (!isdefined(dropstruct)) {
        dropstruct = function_59a2e61d79065dca();
        dropstruct.var_8ee5ee589d379b1 = -30;
        dropstruct.var_91170e589f9e8ff = 30;
        dropstruct.var_82839e7264d5d15e = -30;
        dropstruct.var_8260b07264afb13c = 30;
    }
    var_cb4fad49263e20c4 = function_49b86047c8a8b228(dropstruct, self.origin, self.angles, self);
    var_c43af6f7502b943a = function_cca8bbe88a39ad41(itembundle.type);
    if (isdefined(var_c43af6f7502b943a.var_e0992538cf18c35)) {
        return self [[ var_c43af6f7502b943a.var_e0992538cf18c35 ]](itembundle, count, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles);
    }
    var_befe30ad29a799c6 = [0:#"hash_5f9c433bdcfb4e14", 1:self getentitynumber()];
    item = function_d59d110ccf0f5b8b(itembundle, count, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles, 0, 0, var_befe30ad29a799c6, var_cb4fad49263e20c4.payload);
    function_a703a4241f091edc(item, 300);
    params = spawnstruct();
    params.item = item;
    params.itembundle = itembundle;
    params.var_fbe755f0978c0369 = var_fbe755f0978c0369;
    params.payload = var_befe30ad29a799c6;
    callback::callback("player_item_drop", params);
    return item;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1c77
// Size: 0x148
function function_105c431a9b8cac6b(ref, count, dropstruct) {
    var_fbe755f0978c0369 = function_61d960957fcf3ca0(ref);
    var_9ec3e3e77fa5f56c = "itemspawnentry:" + var_fbe755f0978c0369;
    if (function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
        return undefined;
    }
    if (!isdefined(dropstruct)) {
        dropstruct = function_59a2e61d79065dca();
    }
    var_cb4fad49263e20c4 = function_49b86047c8a8b228(dropstruct, self.origin, self.angles, self);
    itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
    var_c43af6f7502b943a = function_cca8bbe88a39ad41(itembundle.type);
    if (isdefined(var_c43af6f7502b943a.var_e0992538cf18c35)) {
        return self [[ var_c43af6f7502b943a.var_e0992538cf18c35 ]](itembundle, count, dropstruct.origin, dropstruct.angles);
    }
    item = function_d59d110ccf0f5b8b(itembundle, count, dropstruct.origin, dropstruct.angles);
    params = spawnstruct();
    params.item = item;
    params.var_fbe755f0978c0369 = var_fbe755f0978c0369;
    callback::callback("player_item_drop", params);
    return item;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc7
// Size: 0x1bc
function function_23a72b496d4206c9(var_b7e583d90618fed3) {
    var_a23a9d12025e9230 = getlootscriptablearrayinradius(undefined, undefined, self.origin, 100);
    if (var_a23a9d12025e9230.size < 1) {
        return;
    }
    items = [];
    foreach (scriptable in var_a23a9d12025e9230) {
        var_fbe755f0978c0369 = function_2cdc55ba39d97d70(scriptable.type);
        if (!isdefined(var_fbe755f0978c0369)) {
            continue;
        }
        itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
        if (!isdefined(itembundle.ref)) {
            continue;
        }
        lootid = function_6d15e119c2779a93(itembundle);
        if (isdefined(lootid) && var_b7e583d90618fed3 == lootid) {
            items[items.size] = scriptable;
        }
    }
    if (items.size == 1) {
        return items[0];
    }
    var_5d9d8662fc4251b8 = undefined;
    var_21002afca9133f02 = 0;
    playerforward = anglestoforward(self getplayerangles());
    foreach (scriptable in items) {
        var_cac6b8b7efddb0e4 = vectornormalize(scriptable.origin - self.origin);
        dot = vectordot(playerforward, var_cac6b8b7efddb0e4);
        if (dot > var_21002afca9133f02) {
            var_21002afca9133f02 = dot;
            var_5d9d8662fc4251b8 = scriptable;
        }
    }
    return var_5d9d8662fc4251b8;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f8b
// Size: 0xb6
function function_7ccc263b372af2bc(item) {
    if (!isdefined(item.origin)) {
        return 0;
    }
    var_4b2d501a4d31124f = (self geteye()[2] + item.origin[2]) / 2;
    var_b5e0ad6a13b55e67 = (item.origin[0], item.origin[1], var_4b2d501a4d31124f);
    var_1a9f42b9e9b1545c = vectornormalize(var_b5e0ad6a13b55e67 - self geteye());
    playerangles = self getplayerangles();
    playerforward = anglestoforward(playerangles);
    return vectordot(var_1a9f42b9e9b1545c, playerforward) > level.var_3e5d2a63c1d15191;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2049
// Size: 0x1d
function function_fb9af6e6b3526dc6() {
    self setclientomnvar("ui_loot_splash_item_quantity", 0);
    self setclientomnvar("ui_loot_splash_item_id", 0);
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x206d
// Size: 0x141
function function_fce713259eb405d8(itembundle, itemcount, var_c3051697735d1320) {
    self notify("updateLootSplash");
    self endon("disconnect");
    waitframe();
    if (istrue(itembundle.var_3b43fe792f56dea7) && isdefined(var_c3051697735d1320) && isdefined(var_c3051697735d1320.var_fbe755f0978c0369)) {
        itembundle = getscriptbundle("itemspawnentry:" + var_c3051697735d1320.var_fbe755f0978c0369);
    }
    quantity = 0;
    var_c21291cd8d120c4a = (isdefined(itembundle.maxcount) && itembundle.maxcount > 0 || itembundle.type == "currency") && !istrue(itembundle.var_ff1750b480636dc9);
    if (var_c21291cd8d120c4a && isdefined(itemcount)) {
        quantity = itemcount;
    }
    lootid = function_6d15e119c2779a93(itembundle);
    if (isdefined(lootid)) {
        self setclientomnvar("ui_loot_splash_item_quantity", quantity);
        self setclientomnvar("ui_loot_splash_item_id", lootid);
    } else {
        var_fbe755f0978c0369 = function_2cdc55ba39d97d70(itembundle.scriptable);
        if (isdefined(var_fbe755f0978c0369)) {
            logstring("ui_loot_splash_item_id LootID: undefined    item bundle: " + var_fbe755f0978c0369);
        }
    }
    self endon("updateLootSplash");
    waitframe();
    function_fb9af6e6b3526dc6();
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b5
// Size: 0x13c
function function_61b68d989b016af3(player, var_a0115a87500b34b) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    count = 0;
    foreach (item in var_a0115a87500b34b) {
        count++;
        waittime = 0.1;
        if (count % 3 == 0) {
            waittime = 1.5;
        }
        if (!isdefined(item.count) || item.count <= 0) {
            continue;
        }
        if (!isdefined(item.ref) || item.ref == "") {
            continue;
        }
        lootid = function_2c836ad05e5f634c(item.ref);
        itembundle = function_f4a303d532b044a7(lootid);
        if (!isdefined(itembundle.ref)) {
            continue;
        }
        player function_fce713259eb405d8(itembundle, item.count);
        wait(waittime);
    }
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f8
// Size: 0x7e
function function_1a5ef09ec005ebf(origin, var_faa66d6f4c6c9e1d) {
    if (utility::issharedfuncdefined("game", "getZoneDefForOrigin")) {
        bundlename = utility::function_f3bb4f4911a1beb2("game", "getZoneDefForOrigin", origin);
        if (isdefined(var_faa66d6f4c6c9e1d)) {
            var_e62511cd09a9b71f = function_50f8a8f765bad85e("itemspawnzonedef:" + bundlename, var_faa66d6f4c6c9e1d);
            return var_e62511cd09a9b71f;
        } else {
            var_a91353c4805838d2 = getscriptbundle("itemspawnzonedef:" + bundlename);
            return var_a91353c4805838d2;
        }
    }
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237d
// Size: 0x25
function function_b8bfea9514c89a77(var_4887bb4c8348dddc) {
    if (!isdefined(var_4887bb4c8348dddc)) {
        return 0;
    }
    var_4887bb4c8348dddc = int(var_4887bb4c8348dddc);
    return var_4887bb4c8348dddc >> 0 & 2048 - 1;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23aa
// Size: 0x26
function function_9f9adbfb9db3d2ab(var_4887bb4c8348dddc) {
    if (!isdefined(var_4887bb4c8348dddc)) {
        return 0;
    }
    var_4887bb4c8348dddc = int(var_4887bb4c8348dddc);
    return var_4887bb4c8348dddc >> 11 & 2048 - 1;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d8
// Size: 0x25
function function_8fd389f931f45c66(var_4887bb4c8348dddc) {
    if (!isdefined(var_4887bb4c8348dddc)) {
        return 0;
    }
    var_4887bb4c8348dddc = int(var_4887bb4c8348dddc);
    return var_4887bb4c8348dddc >> 22 & 64 - 1;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2405
// Size: 0xd6
function function_7209c8cd4b2e3afd(itemcount, var_59bd51afc73df2cd, var_dab81ead77442a10, var_62f46bd2a9d9949e) {
    if (!isdefined(itemcount)) {
        return 0;
    }
    count = 0;
    itemcount = int(itemcount);
    /#
        assert(itemcount < 2048);
    #/
    count = count | (itemcount & 2048 - 1) << 0;
    if (isdefined(var_59bd51afc73df2cd)) {
        var_59bd51afc73df2cd = int(var_59bd51afc73df2cd);
        /#
            assert(var_59bd51afc73df2cd < 2048);
        #/
        count = count | (var_59bd51afc73df2cd & 2048 - 1) << 11;
    }
    if (isdefined(var_dab81ead77442a10)) {
        var_dab81ead77442a10 = int(var_dab81ead77442a10);
        /#
            assert(var_dab81ead77442a10 < 64);
        #/
        count = count | (var_dab81ead77442a10 & 64 - 1) << 22;
    }
    if (isdefined(var_62f46bd2a9d9949e)) {
        var_62f46bd2a9d9949e = int(var_62f46bd2a9d9949e);
        /#
            assert(var_62f46bd2a9d9949e < 8);
        #/
        count = count | (var_62f46bd2a9d9949e & 8 - 1) << 28;
    }
    return count;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e3
// Size: 0x10f
function function_cd45408bd44fab07(var_54d72291621fb09e, count, origin, angles, var_14c85b39207719b8, var_57266f5ca6feebd7) {
    var_6f0d08c8a9f06ab5 = function_bc2f4857c90f5344(var_54d72291621fb09e, count);
    var_1d441103e7105cff = [];
    dropstruct = function_59a2e61d79065dca(var_6f0d08c8a9f06ab5.size, undefined, undefined, undefined, undefined, undefined, 27, 13);
    for (i = 0; i < var_6f0d08c8a9f06ab5.size; i++) {
        var_8df7f401dd287a5c = var_6f0d08c8a9f06ab5[i];
        if (!isdefined(var_8df7f401dd287a5c)) {
            continue;
        }
        itembundle = getscriptbundle("itemspawnentry:" + var_8df7f401dd287a5c);
        /#
            assertex(isdefined(itembundle), "CommonItemERROR: attempted to spawn invalid item [" + var_8df7f401dd287a5c + "] from item list [" + var_54d72291621fb09e + "]");
        #/
        if (!isdefined(itembundle)) {
            continue;
        }
        item = function_c465d27f3f6066b4(itembundle, origin, angles, var_14c85b39207719b8, var_57266f5ca6feebd7, undefined, dropstruct);
        var_1d441103e7105cff = utility::array_add(var_1d441103e7105cff, item);
    }
    return var_1d441103e7105cff;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25fa
// Size: 0x21
function function_bc2f4857c90f5344(var_54d72291621fb09e, count) {
    return function_6b35ded8b1d89ce8("itemspawnlist:" + var_54d72291621fb09e, count);
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2623
// Size: 0x170
function function_c465d27f3f6066b4(itembundle, var_6a1457b04b003ec, var_d4cd0e83c63f36ee, var_14c85b39207719b8, var_57266f5ca6feebd7, payload, dropstruct) {
    if (!isdefined(itembundle)) {
        /#
            /#
                assertmsg("equipped");
            #/
        #/
        return undefined;
    }
    var_cb4fad49263e20c4 = function_250558a79c78739e(var_6a1457b04b003ec, var_d4cd0e83c63f36ee);
    if (!istrue(var_14c85b39207719b8)) {
        if (!isdefined(dropstruct)) {
            dropstruct = function_59a2e61d79065dca(1, undefined, undefined, undefined, undefined, undefined, 27, 13);
        }
        var_cb4fad49263e20c4 = function_49b86047c8a8b228(dropstruct, var_6a1457b04b003ec, var_d4cd0e83c63f36ee);
    }
    droporigin = var_cb4fad49263e20c4.origin;
    dropangles = isdefined(var_d4cd0e83c63f36ee) ? var_cb4fad49263e20c4.angles : var_d4cd0e83c63f36ee;
    dropangles = isdefined(dropangles) ? (0, 0, 0) : dropangles;
    if (itembundle.type == "weapon") {
        return namespace_736197e4d378b91b::function_c069cffb4cbd1707(itembundle, droporigin, dropangles, undefined, undefined, var_14c85b39207719b8, var_57266f5ca6feebd7, payload, var_cb4fad49263e20c4.payload);
    }
    dropcount = 1;
    if (isdefined(itembundle.spawncount) && itembundle.spawncount > 0) {
        dropcount = itembundle.spawncount;
    }
    return function_d59d110ccf0f5b8b(itembundle, dropcount, droporigin, dropangles, var_14c85b39207719b8, var_57266f5ca6feebd7, payload, var_cb4fad49263e20c4.payload);
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x279b
// Size: 0x6c
function function_119bf86e1d774c3(scriptablename, var_6a1457b04b003ec, var_d4cd0e83c63f36ee, itemindex, var_ad1bd9331817cf11, var_14c85b39207719b8, var_57266f5ca6feebd7, payload) {
    itembundle = function_1749413ee00b69f(scriptablename);
    if (!isdefined(itembundle)) {
        return undefined;
    }
    return function_c465d27f3f6066b4(itembundle, var_6a1457b04b003ec, var_d4cd0e83c63f36ee, var_14c85b39207719b8, var_57266f5ca6feebd7, payload);
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x280f
// Size: 0x2d
function private function_4837e73f5e8c9129() {
    self endon("death");
    self endon("cleanup");
    while (1) {
        waitframe();
        if (self function_6954a8d7ba8cd9fb()) {
            break;
        }
    }
    function_68bb330b8e871f35();
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2843
// Size: 0x171
function function_d59d110ccf0f5b8b(var_c38189364d07e3d0, dropcount, droporigin, dropangles, var_14c85b39207719b8, var_57266f5ca6feebd7, var_d397bc63bc6b67b0, var_d397bf63bc6b6e49) {
    scriptablename = function_edbb604348696c44(var_c38189364d07e3d0.scriptable);
    /#
        if (!isscriptabledefined(scriptablename)) {
            /#
                assertmsg("<unknown string>" + var_c38189364d07e3d0.ref + "<unknown string>" + function_3c8848a3a11b2553(scriptablename) + "<unknown string>");
            #/
            return undefined;
        }
    #/
    item = spawnscriptable(scriptablename, droporigin, dropangles, undefined, var_d397bc63bc6b67b0, var_d397bf63bc6b6e49);
    item thread function_4837e73f5e8c9129();
    if (!istrue(var_14c85b39207719b8)) {
        item setscriptablepartstate(item.type, "dropped");
    }
    if (isdefined(dropcount)) {
        item.count = int(dropcount);
    }
    function_43272b9595268864(var_c38189364d07e3d0, droporigin);
    namespace_7c5bb630aad381e::function_476b3beecd82dcca("common_items", item);
    item callback::callback("scriptable_item_spawned", {angles:dropangles, origin:droporigin, itembundle:var_c38189364d07e3d0, item:item});
    if (!istrue(var_57266f5ca6feebd7)) {
        var_c33c1d1c46eaa040 = utility::function_53c4c53197386572(var_c38189364d07e3d0.lifetime, 90);
        item thread function_33ee459f817ccf86(var_c33c1d1c46eaa040);
    }
    return item;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x29bc
// Size: 0x50
function private function_43272b9595268864(itembundle, dropposition) {
    if (!isdefined(itembundle.var_8681642bfa3bff37)) {
        return;
    }
    if (isdefined(dropposition)) {
        playsoundatpos(dropposition, itembundle.var_8681642bfa3bff37);
    } else {
        self playsound(itembundle.var_8681642bfa3bff37);
    }
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a13
// Size: 0x2d
function function_a621885d4088d15f() {
    level.var_986acb83cc29ed77.var_30d780bdba4bc858 = [];
    level.var_986acb83cc29ed77.var_d58f96d6b0e99929 = [];
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a47
// Size: 0x2b
function function_901913fce1c734e2(scriptablename, var_702868f226e310ec) {
    level.var_986acb83cc29ed77.var_30d780bdba4bc858[scriptablename] = var_702868f226e310ec;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a79
// Size: 0x2b
function function_e88c7dbe0f396ccb(scriptablename, func) {
    level.var_986acb83cc29ed77.var_d58f96d6b0e99929[scriptablename] = func;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aab
// Size: 0x80
function function_edbb604348696c44(scriptablename) {
    if (isdefined(level.var_986acb83cc29ed77.var_30d780bdba4bc858[scriptablename])) {
        scriptablename = level.var_986acb83cc29ed77.var_30d780bdba4bc858[scriptablename];
    }
    if (isdefined(level.var_986acb83cc29ed77.var_d58f96d6b0e99929[scriptablename])) {
        var_4ec797d3b55e2dd8 = [[ level.var_986acb83cc29ed77.var_d58f96d6b0e99929[scriptablename] ]]();
        if (isdefined(var_4ec797d3b55e2dd8)) {
            scriptablename = var_4ec797d3b55e2dd8;
        }
    }
    return scriptablename;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b33
// Size: 0x274
function private function_fd0060992e35b410() {
    level.var_986acb83cc29ed77.var_b09fc2aeb718c263 = [];
    level.var_986acb83cc29ed77.var_ec08d293dcc1ea4f = [];
    level.var_986acb83cc29ed77.var_970a8dd2fe7c510b = [];
    if (!isdefined(level.var_62f6f7640e4431e3.var_328f56c2f24c4831)) {
        /#
            assertmsg("CommonItemERROR: No 'Common Item Data' (commonItemZoneList) defined in gametype bundle");
        #/
        return;
    }
    var_84820d26fa142bc3 = getscriptbundle("itemspawnzonelist:" + level.var_62f6f7640e4431e3.var_328f56c2f24c4831);
    if (!isdefined(var_84820d26fa142bc3)) {
        /#
            assertmsg("CommonItemERROR: Unable to load item data for gametype. '" + level.var_62f6f7640e4431e3.var_328f56c2f24c4831 + "' specified in gametype bundle, but not found.");
        #/
        return;
    }
    level.var_986acb83cc29ed77.var_9c1299ad2123c6a6 = [];
    level.var_986acb83cc29ed77.var_2b8c7f81dece4299 = [];
    if (isdefined(var_84820d26fa142bc3.var_d18a2813800b518b)) {
        function_754c0f10a7b580ad(var_84820d26fa142bc3.var_d18a2813800b518b);
    }
    if (!var_84820d26fa142bc3.var_94849edef45b71cb.size) {
        /#
            assertmsg("CommonItemERROR: Zone list '" + level.var_62f6f7640e4431e3.var_328f56c2f24c4831 + "' is empty.");
        #/
        return;
    }
    var_1ed6171d58c6afd6 = 0;
    foreach (var_c524899673052a7a in var_84820d26fa142bc3.var_94849edef45b71cb) {
        if (!isdefined(var_c524899673052a7a.var_c524899673052a7a)) {
            continue;
        }
        var_a91353c4805838d2 = getscriptbundle("itemspawnzonedef:" + var_c524899673052a7a.var_c524899673052a7a);
        if (isdefined(var_a91353c4805838d2) && isdefined(var_a91353c4805838d2.itemspawnlist)) {
            function_754c0f10a7b580ad(var_a91353c4805838d2.itemspawnlist);
            if (!var_1ed6171d58c6afd6 && isdefined(var_c524899673052a7a.zonename) && var_c524899673052a7a.zonename == "global") {
                var_1ed6171d58c6afd6 = 1;
            }
        }
    }
    /#
        assertex(var_1ed6171d58c6afd6, "CommonItemERROR: No valid 'global' zone def found within zone list [" + level.var_62f6f7640e4431e3.var_328f56c2f24c4831 + "]. A global zone is required for all item modes.");
    #/
    level.var_986acb83cc29ed77.var_9c1299ad2123c6a6 = undefined;
    level.var_986acb83cc29ed77.var_2b8c7f81dece4299 = undefined;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2dae
// Size: 0x223
function private function_754c0f10a7b580ad(var_54d72291621fb09e) {
    if (!isdefined(var_54d72291621fb09e) || var_54d72291621fb09e == "") {
        return 1;
    }
    if (utility::array_contains(level.var_986acb83cc29ed77.var_9c1299ad2123c6a6, var_54d72291621fb09e)) {
        return 0;
    }
    utility::array_add(level.var_986acb83cc29ed77.var_9c1299ad2123c6a6, var_54d72291621fb09e);
    var_942a8a17d8a96a46 = getscriptbundle("itemspawnlist:" + var_54d72291621fb09e);
    if (!isdefined(var_942a8a17d8a96a46)) {
        return 2;
    }
    foreach (var_74ddc601a0fcaaa2 in var_942a8a17d8a96a46.var_9fdd81c7fdbb8ed2) {
        error = function_a6275c9ae7ae1bda(var_74ddc601a0fcaaa2.itemspawnentry);
        if (error) {
            switch (error) {
            case 1:
                /#
                    println("<unknown string>" + var_54d72291621fb09e + "<unknown string>");
                #/
                break;
            case 2:
                /#
                    assertmsg("CommonItemERROR: Item list " + var_54d72291621fb09e + ".itemspawnlist specifies item " + var_74ddc601a0fcaaa2.itemspawnentry + ".itemspawnentry which could not be loaded");
                #/
                break;
            }
        }
    }
    foreach (var_4639abd00453b2de in var_942a8a17d8a96a46.var_32997c3e205661c6) {
        error = function_754c0f10a7b580ad(var_4639abd00453b2de.itemspawnlist);
        if (error) {
            switch (error) {
            case 1:
                /#
                    println("<unknown string>" + var_54d72291621fb09e + "<unknown string>");
                #/
                break;
            case 2:
                /#
                    assertmsg("CommonItemERROR: Item list " + var_54d72291621fb09e + ".itemspawnlist specifies item list " + var_4639abd00453b2de.itemspawnlist + ".itemspawnlist which could not be loaded");
                #/
                break;
            }
        }
    }
    return 0;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fd9
// Size: 0x364
function private function_a6275c9ae7ae1bda(var_fbe755f0978c0369) {
    if (!isdefined(var_fbe755f0978c0369) || var_fbe755f0978c0369 == "") {
        return 1;
    }
    if (utility::array_contains(level.var_986acb83cc29ed77.var_2b8c7f81dece4299, var_fbe755f0978c0369)) {
        return 0;
    } else {
        level.var_986acb83cc29ed77.var_2b8c7f81dece4299[level.var_986acb83cc29ed77.var_2b8c7f81dece4299.size] = var_fbe755f0978c0369;
    }
    itembundle = function_50f8a8f765bad85e("itemspawnentry:" + var_fbe755f0978c0369, [0:#"type", 1:#"hash_b9a3752dc7a3d626", 2:#"scriptable", 3:#"ref"]);
    if (!isdefined(itembundle)) {
        return 2;
    }
    /#
        if (isdefined(var_fbe755f0978c0369) && isdefined(itembundle)) {
            var_7dcefd3da204d43c = function_4651d0094e0bd59d(itembundle.type, #"hash_3483a973fd1fe5b8");
            if (isdefined(var_7dcefd3da204d43c)) {
                [[ var_7dcefd3da204d43c ]](var_fbe755f0978c0369);
            } else {
                function_112c64fc568b602f(var_fbe755f0978c0369);
            }
        }
    #/
    var_7dcefd3da204d43c = function_4651d0094e0bd59d(itembundle.type, #"hash_79cd484b40e882b");
    if (isdefined(var_7dcefd3da204d43c)) {
        [[ var_7dcefd3da204d43c ]](var_fbe755f0978c0369);
    }
    if (istrue(itembundle.var_5a5e50bc261c907a)) {
        return 0;
    }
    if (isdefined(itembundle.scriptable)) {
        if (!isdefined(level.var_986acb83cc29ed77.var_ec08d293dcc1ea4f[itembundle.scriptable])) {
            level.var_986acb83cc29ed77.var_ec08d293dcc1ea4f[itembundle.scriptable] = var_fbe755f0978c0369;
        } else {
            /#
                print("<unknown string>" + level.var_986acb83cc29ed77.var_ec08d293dcc1ea4f[itembundle.scriptable] + "<unknown string>" + var_fbe755f0978c0369 + "<unknown string>" + function_3c8848a3a11b2553(itembundle.scriptable) + "<unknown string>");
            #/
        }
    }
    if (isdefined(itembundle.ref)) {
        if (!isdefined(level.var_986acb83cc29ed77.var_970a8dd2fe7c510b[itembundle.ref])) {
            var_6fc01db500097fd9 = [0:" "];
            foreach (character in var_6fc01db500097fd9) {
                if (issubstr(itembundle.ref, character)) {
                    /#
                        assertmsg("CommonItemERROR: Item bundle [" + var_fbe755f0978c0369 + "]'s ref field contains a disallowed character "" + character + "".");
                    #/
                    return 0;
                }
            }
            level.var_986acb83cc29ed77.var_970a8dd2fe7c510b[itembundle.ref] = var_fbe755f0978c0369;
            lootid = function_2c836ad05e5f634c(itembundle.ref);
            if (isdefined(lootid)) {
                level.var_986acb83cc29ed77.var_b09fc2aeb718c263[lootid] = var_fbe755f0978c0369;
            }
        } else {
            /#
                print("<unknown string>" + level.var_986acb83cc29ed77.var_970a8dd2fe7c510b[itembundle.ref] + "<unknown string>" + var_fbe755f0978c0369 + "<unknown string>" + itembundle.ref + "<unknown string>");
            #/
        }
    }
    return 0;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3345
// Size: 0x81
function function_b343caad692916aa(itembundle) {
    if (isdefined(itembundle.inventorytype) && itembundle.inventorytype == "Pooled") {
        return 0;
    }
    if (isdefined(itembundle.inventorytype) && itembundle.inventorytype != "none") {
        return 1;
    }
    if (isdefined(itembundle.inventoryslot) && itembundle.inventoryslot != "none") {
        return 1;
    }
    return 0;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ce
// Size: 0x33
function function_f0c15201c9f7e1db(scriptablename) {
    if (isstring(scriptablename)) {
        scriptablename = function_40fd49171fad19d3(scriptablename);
    }
    return isdefined(level.var_986acb83cc29ed77.var_ec08d293dcc1ea4f[scriptablename]);
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3409
// Size: 0x21
function function_cca8bbe88a39ad41(itemtype) {
    return level.var_986acb83cc29ed77.var_f6b61ad6f51a3eda[itemtype];
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3432
// Size: 0x5d
function function_fc925a153c7fd55c(lootid) {
    var_d3eb0030de8df73e = loot::function_282cf83c9eeda744(lootid);
    if (isdefined(var_d3eb0030de8df73e)) {
        var_483f43f9665ef7b3 = function_4651d0094e0bd59d(var_d3eb0030de8df73e, #"hash_c94d2b323951a101");
        if (isdefined(var_483f43f9665ef7b3)) {
            return [[ var_483f43f9665ef7b3 ]](lootid);
        }
    }
    return level.var_986acb83cc29ed77.var_b09fc2aeb718c263[lootid];
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3497
// Size: 0x34
function function_2b10ba6fb19dccd9(lootid) {
    var_fbe755f0978c0369 = function_fc925a153c7fd55c(lootid);
    if (isdefined(var_fbe755f0978c0369)) {
        return function_2ef675c13ca1c4af(%"itemspawnentry:", var_fbe755f0978c0369);
    }
    return undefined;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34d3
// Size: 0x28
function function_b4dd67b39cbb2f31(lootid) {
    /#
        return function_3c8848a3a11b2553(function_fc925a153c7fd55c(lootid));
    #/
    return function_f28fd66285fa2c9(function_fc925a153c7fd55c(lootid));
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3503
// Size: 0x32
function function_2cdc55ba39d97d70(scriptablename) {
    if (isstring(scriptablename)) {
        scriptablename = function_40fd49171fad19d3(scriptablename);
    }
    return level.var_986acb83cc29ed77.var_ec08d293dcc1ea4f[scriptablename];
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x353d
// Size: 0x28
function function_8daeb22f16cf4ce9(scriptablename) {
    /#
        return function_3c8848a3a11b2553(function_2cdc55ba39d97d70(scriptablename));
    #/
    return function_f28fd66285fa2c9(function_2cdc55ba39d97d70(scriptablename));
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x356d
// Size: 0x21
function function_61d960957fcf3ca0(ref) {
    return level.var_986acb83cc29ed77.var_970a8dd2fe7c510b[ref];
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3596
// Size: 0x102
function function_1749413ee00b69f(scriptablename) {
    if (!isdefined(scriptablename) || !function_f0c15201c9f7e1db(scriptablename)) {
        /#
            if (!isdefined(scriptablename)) {
                /#
                    assertmsg("<unknown string>");
                #/
            } else if (isstring(scriptablename)) {
                /#
                    assertmsg("<unknown string>" + scriptablename + "<unknown string>");
                #/
            } else if (function_73e183e02834309d(scriptablename)) {
                /#
                    assertmsg("<unknown string>" + function_3c8848a3a11b2553(scriptablename) + "<unknown string>");
                #/
            } else {
                /#
                    assertmsg("<unknown string>");
                #/
            }
        #/
        return undefined;
    }
    scriptablename = function_edbb604348696c44(scriptablename);
    var_fbe755f0978c0369 = function_2cdc55ba39d97d70(scriptablename);
    if (!isdefined(var_fbe755f0978c0369)) {
        /#
            /#
                assertmsg("<unknown string>" + scriptablename + "<unknown string>");
            #/
        #/
        return undefined;
    }
    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
    if (!isdefined(itembundle)) {
        /#
            /#
                assertmsg("<unknown string>" + var_fbe755f0978c0369 + "<unknown string>");
            #/
        #/
        return undefined;
    }
    return itembundle;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36a0
// Size: 0x28
function function_467f0c241ad05cfb(ref) {
    /#
        return function_3c8848a3a11b2553(function_61d960957fcf3ca0(ref));
    #/
    return function_f28fd66285fa2c9(function_61d960957fcf3ca0(ref));
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36d0
// Size: 0x78
function function_2f759e70c6189ff0(lootid) {
    var_fbe755f0978c0369 = function_fc925a153c7fd55c(lootid);
    if (!isdefined(var_fbe755f0978c0369) || var_fbe755f0978c0369 == "") {
        /#
            assertmsg("CommonItemERROR: Could not find itemspawnentry for lootID " + lootid);
        #/
        return;
    }
    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
    if (!isdefined(itembundle)) {
        /#
            assertmsg("CommonItemERROR: Script bundle not found for itemspawnentry " + var_fbe755f0978c0369);
        #/
        return;
    }
    return itembundle.scriptable;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3750
// Size: 0x110
function function_f4a303d532b044a7(lootid) {
    if (!isint(lootid)) {
        /#
            /#
                assertmsg("<unknown string>" + (isdefined(lootid) ? lootid : "<unknown string>") + "<unknown string>");
            #/
        #/
        return undefined;
    }
    var_fbe755f0978c0369 = function_fc925a153c7fd55c(lootid);
    if (!isdefined(var_fbe755f0978c0369) || var_fbe755f0978c0369 == "") {
        var_60ce74182e7c83a7 = function_3475769c002400f7(lootid);
        if (isdefined(var_60ce74182e7c83a7) && isdefined(var_60ce74182e7c83a7.var_cb325ddb4a764623)) {
            /#
                assertmsg("CommonItemERROR: Failed to associate an itemspawnentry bundle to lootID [" + lootid + "]. Possible reasons:" + "
- There is no itemspawnentry with the reference: [" + var_60ce74182e7c83a7.var_cb325ddb4a764623 + "]" + "
- The itemspawnentry is not in the Item Include List (gametypebundle -> Common Item Data -> Item Include List)" + "
- The itemspawnentry does not specify an inventory type or slot");
            #/
        } else {
            /#
                assertmsg("CommonItemERROR: There is no valid item in the master loot table with item ID [" + lootid + "].");
            #/
        }
        return undefined;
    }
    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
    if (!isdefined(itembundle)) {
        /#
            assertmsg("CommonItemERROR: Script bundle not found for itemspawnentry [" + var_fbe755f0978c0369 + "]");
        #/
        return undefined;
    }
    return itembundle;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3868
// Size: 0x14
function function_1df1b532888e29ab(itemtype) {
    return isdefined(function_cca8bbe88a39ad41(itemtype));
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3884
// Size: 0x73
function function_1414925deba056bc(scriptablename, itemtype) {
    if (!isdefined(scriptablename) || !function_f0c15201c9f7e1db(scriptablename) || !isdefined(itemtype)) {
        return 0;
    }
    var_fbe755f0978c0369 = function_2cdc55ba39d97d70(scriptablename);
    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
    return isdefined(itembundle.type) && itembundle.type == itemtype;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38ff
// Size: 0x2a
function function_4ec04bdf7386d3d0(itembundle) {
    return isdefined(itembundle.maxcount) ? 0 : itembundle.maxcount;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3931
// Size: 0x5c
function function_c7171bcea41dd66f(itembundle) {
    if (istrue(itembundle.var_535a50184aa057f0)) {
        return (isdefined(itembundle.var_32c4755a90372a) ? 0 : itembundle.var_32c4755a90372a);
    } else {
        return (isdefined(itembundle.maxcount) ? 0 : itembundle.maxcount);
    }
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3994
// Size: 0x5c
function function_68789a2229990351(itembundle) {
    if (istrue(itembundle.var_535a50184aa057f0)) {
        return (isdefined(itembundle.var_a5f594a8f75b2992) ? 0 : itembundle.var_a5f594a8f75b2992);
    } else {
        return (isdefined(itembundle.maxcount) ? 0 : itembundle.maxcount);
    }
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39f7
// Size: 0x2e0
function function_ccb2889218715cb1(item, part, state, player, var_b2635db617b09abd, var_cc38472e36be1b61) {
    if (!isdefined(item.type) || !function_f0c15201c9f7e1db(item.type) || istrue(item.disable)) {
        return;
    }
    var_fbe755f0978c0369 = function_2cdc55ba39d97d70(item.type);
    if (!isdefined(var_fbe755f0978c0369) || var_fbe755f0978c0369 == "") {
        /#
            assertmsg("CommonItemERROR: Loot scriptable " + item.type + " does not have a registered itemspawnentry bundle");
        #/
        return;
    }
    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
    if (!isdefined(itembundle)) {
        /#
            assertmsg("CommonItemERROR: itemspawnentrybundle [" + var_fbe755f0978c0369 + "] could not be loaded for item scriptable [" + item.type + "]");
        #/
        return;
    }
    if (!function_1df1b532888e29ab(itembundle.type)) {
        if (itembundle.type != "cache" && itembundle.type != "kiosk" && itembundle.type != "restock") {
            /#
                assertmsg("CommonItemERROR: Item [" + var_fbe755f0978c0369 + "] is attempting to use unregistered item type [" + itembundle.type + "]");
            #/
        }
        return;
    }
    if (var_b2635db617b09abd) {
        if (!istrue(itembundle.var_13fc3679e0d849db)) {
            return;
        }
        time = gettime();
        if (isdefined(player.var_833d5b97f04819f3) && player.var_833d5b97f04819f3 > time) {
            return;
        }
        playernum = player function_d85aa3c6cfd398cf();
        if (isdefined(item.var_b82e5f82c73104ff) && isdefined(item.var_b82e5f82c73104ff[playernum]) && item.var_b82e5f82c73104ff[playernum] > time) {
            return;
        }
    }
    var_5dc9acd40a672a19 = player function_de489fa2ffdb7f2d(item, var_b2635db617b09abd, 1);
    var_4edf9373b84d50e = 0;
    if (!var_5dc9acd40a672a19 && (!var_b2635db617b09abd || istrue(itembundle.var_bbae53787b1abf3e)) && itembundle.type != "weapon") {
        var_4edf9373b84d50e = player namespace_fe9526a81c458d8f::function_10e55eeb4c15dd5a(item, var_b2635db617b09abd, 1);
    }
    if (var_5dc9acd40a672a19) {
        player.var_833d5b97f04819f3 = gettime() + utility::function_a5b14435e3229bed(0.1);
    }
    if (var_5dc9acd40a672a19 || var_4edf9373b84d50e) {
        player function_fbfd7096a2dbc7e7(itembundle, 1);
    } else if (!var_b2635db617b09abd && (!isdefined(player.var_2fa5b49969def47) || !istrue(player.var_2fa5b49969def47.var_978407de904a5fd1))) {
        player function_fbfd7096a2dbc7e7(itembundle, 0);
    }
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3cde
// Size: 0x110
function private function_bb2e10bb5f7e813f(item, var_fbe755f0978c0369, itembundle) {
    var_d73c8cbee5231169 = undefined;
    var_ecc179e5e9b62e99 = function_7f6f62ba8dfd0da0(itembundle, item);
    if (isarray(var_ecc179e5e9b62e99) && isint(var_ecc179e5e9b62e99[0])) {
        if (isint(var_ecc179e5e9b62e99[1])) {
            var_d73c8cbee5231169 = var_ecc179e5e9b62e99[1];
        }
        var_ecc179e5e9b62e99 = var_ecc179e5e9b62e99[0];
    }
    if (!isdefined(var_d73c8cbee5231169)) {
        var_d73c8cbee5231169 = item.count - var_ecc179e5e9b62e99;
    }
    if (var_d73c8cbee5231169 > 0 || var_ecc179e5e9b62e99 <= 0) {
        params = spawnstruct();
        params.item = item;
        params.var_fbe755f0978c0369 = var_fbe755f0978c0369;
        params.itembundle = itembundle;
        params.var_a64e5e1ee95c7b96 = 0;
        callback::callback("player_item_pickup", params);
        if (var_ecc179e5e9b62e99 > 0) {
            item.count = var_ecc179e5e9b62e99;
        } else {
            self notify("self_pickedupitem", function_40fd49171fad19d3(item.type));
            function_c14962ea14e58968(item);
        }
    }
    return var_d73c8cbee5231169;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3df6
// Size: 0x49
function function_33ee459f817ccf86(var_5188156bcf936801) {
    self endon("death");
    /#
        var_e36297ddeefc9f5a = getdvarint(@"hash_4fa90c2ce3766d92", 0);
        if (var_e36297ddeefc9f5a < 0) {
            return;
        }
        if (var_e36297ddeefc9f5a) {
            var_5188156bcf936801 = var_e36297ddeefc9f5a;
        }
    #/
    wait(var_5188156bcf936801);
    thread function_c14962ea14e58968(self);
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e46
// Size: 0xa6
function function_c14962ea14e58968(item) {
    if (istrue(item.var_a6293f3144240b99)) {
        item.count = 0;
        return;
    }
    if (isdefined(item.var_4a0145502132790a)) {
        namespace_7c5bb630aad381e::function_879ccb6a53e634f5("common_items", item);
    }
    if (isstruct(item)) {
        item notify("death");
    } else if (isent(item)) {
        item delete();
    } else {
        item namespace_ede58c1e66c2c280::function_6bc4f6b579285f79();
        item notify("death");
        if (item getscriptableisreserved()) {
            item freescriptable();
        } else {
            item setscriptablepartstate(item.type, "hidden");
        }
    }
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ef3
// Size: 0x157
function function_68bb330b8e871f35() {
    if (istrue(self.var_695427780354d0e5)) {
        return;
    }
    contents = trace::create_contents(0, 1, 0, 0, 0, 1, 1, 0, 0);
    ignorelist = [];
    caststart = self.origin + (0, 0, 50);
    castend = caststart + (0, 0, -200);
    traceresult = trace::ray_trace(caststart, castend, ignorelist, contents);
    if (isdefined(traceresult["entity"])) {
        groundent = traceresult["entity"];
        if (groundent ismovingplatform()) {
            var_902457d38a77a979 = traceresult["position"] + (0, 0, 4);
            var_ea3b9640a6ad3c8e = rotatevectorinverted(var_902457d38a77a979 - groundent.origin, groundent.angles);
            localangles = combineangles(invertangles(groundent.angles), self.angles);
            if (isdefined(self.var_bf8e5f003146af44)) {
                self.var_bf8e5f003146af44 linkto(groundent, "", var_ea3b9640a6ad3c8e, localangles);
            } else {
                utility::function_6e506f39f121ea8a(groundent, var_ea3b9640a6ad3c8e, localangles);
            }
        }
    }
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4051
// Size: 0x20e
function function_61e26b275dfa50e0(itembundle, itemcount, var_c3051697735d1320, var_d0f812b17627d064, item, var_95484d8d503de3b8) {
    if (!isdefined(var_d0f812b17627d064)) {
        var_d0f812b17627d064 = 0;
    }
    if (istrue(itembundle.var_3b43fe792f56dea7) && isdefined(var_c3051697735d1320) && isdefined(var_c3051697735d1320.var_fbe755f0978c0369)) {
        itembundle = getscriptbundle("itemspawnentry:" + var_c3051697735d1320.var_fbe755f0978c0369);
    }
    var_a6293f3144240b99 = 0;
    if (isdefined(item)) {
        var_a6293f3144240b99 = istrue(item.var_a6293f3144240b99);
    }
    var_d4a0b8261881af15 = 0;
    if (isdefined(item)) {
        var_d4a0b8261881af15 = istrue(item.var_d4a0b8261881af15);
    }
    lootid = function_6d15e119c2779a93(itembundle);
    if (var_d0f812b17627d064) {
        self dlog_recordplayerevent("dlog_event_player_common_item", [0:"dropped", 1:0, 2:"stowed", 3:lootid, 4:"equipped", 5:0, 6:"bought", 7:0, 8:"sold", 9:0, 10:"type", 11:itembundle.type, 12:"from_cache", 13:var_a6293f3144240b99, 14:"from_rift_reward", 15:var_d4a0b8261881af15]);
    } else {
        self dlog_recordplayerevent("dlog_event_player_common_item", [0:"dropped", 1:0, 2:"stowed", 3:0, 4:"equipped", 5:lootid, 6:"bought", 7:0, 8:"sold", 9:0, 10:"type", 11:itembundle.type, 12:"from_cache", 13:var_a6293f3144240b99, 14:"from_rift_reward", 15:var_d4a0b8261881af15]);
    }
    if (!istrue(var_95484d8d503de3b8)) {
        function_fbfd7096a2dbc7e7(itembundle, 1);
    }
    if (!istrue(itembundle.var_c03c4ef51659ba4c)) {
        thread function_fce713259eb405d8(itembundle, itemcount, var_c3051697735d1320);
    }
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4266
// Size: 0x63
function function_fbfd7096a2dbc7e7(itembundle, var_b10d66ed4bd40ddf) {
    if (!isdefined(itembundle)) {
        return;
    }
    if (var_b10d66ed4bd40ddf) {
        if (isdefined(itembundle.var_7c42466bc0339b10)) {
            self playsound(itembundle.var_7c42466bc0339b10);
        }
    } else if (isdefined(itembundle.var_b6da4d92ce77e489)) {
        self playsound(itembundle.var_b6da4d92ce77e489);
    }
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d0
// Size: 0x13b
function function_59a2e61d79065dca(var_e35351de85fe342d, var_8ee5ee589d379b1, var_91170e589f9e8ff, var_82839e7264d5d15e, var_8260b07264afb13c, var_13c9c27ba11aac1a, var_808de1e892fb0269, var_6353cc9d3791853a, var_8a600b6102da9f9b, var_f71d4f78d508da69, var_6fe2ff802d5192d4, var_d8cf705570b19696, var_69f3e94ac253c6ab) {
    dropstruct = spawnstruct();
    dropstruct.var_dfba5a2c3c6f0a07 = 0;
    dropstruct.var_e35351de85fe342d = var_e35351de85fe342d;
    dropstruct.var_8ee5ee589d379b1 = var_8ee5ee589d379b1;
    dropstruct.var_91170e589f9e8ff = var_91170e589f9e8ff;
    dropstruct.var_82839e7264d5d15e = var_82839e7264d5d15e;
    dropstruct.var_8260b07264afb13c = var_8260b07264afb13c;
    dropstruct.var_13c9c27ba11aac1a = var_13c9c27ba11aac1a;
    dropstruct.var_808de1e892fb0269 = var_808de1e892fb0269;
    dropstruct.var_6353cc9d3791853a = var_6353cc9d3791853a;
    dropstruct.var_8a600b6102da9f9b = var_8a600b6102da9f9b;
    dropstruct.var_f71d4f78d508da69 = var_f71d4f78d508da69;
    dropstruct.var_6fe2ff802d5192d4 = var_6fe2ff802d5192d4;
    dropstruct.var_d8cf705570b19696 = var_d8cf705570b19696;
    dropstruct.var_69f3e94ac253c6ab = var_69f3e94ac253c6ab;
    return dropstruct;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4413
// Size: 0x7b3
function function_49b86047c8a8b228(dropstruct, baseorigin, baseangles, ignoreent, var_3ace5ac9c7d6fa44, var_688e4da4cb16116d) {
    /#
        assert(!isdefined(ignoreent) || isent(ignoreent));
    #/
    if (!isdefined(dropstruct) || !isstruct(dropstruct) || !isdefined(dropstruct.var_dfba5a2c3c6f0a07)) {
        /#
            println("<unknown string>");
        #/
        return function_250558a79c78739e(baseorigin, baseangles);
    }
    var_c459fe3ec72a8224 = 6;
    if (isdefined(dropstruct.var_13c9c27ba11aac1a) && dropstruct.var_13c9c27ba11aac1a > 0) {
        var_c459fe3ec72a8224 = dropstruct.var_13c9c27ba11aac1a;
    }
    var_4af424534f675c4d = 3;
    var_3385f93167b49aa1 = 360 / var_c459fe3ec72a8224;
    var_551904951118b7b9 = level.var_1dfefe3988a59ae5;
    var_ab9f50e5b2c2e07e = ter_op(isdefined(dropstruct.var_8ee5ee589d379b1), dropstruct.var_8ee5ee589d379b1, -5);
    var_ab7c62e5b29cc05c = ter_op(isdefined(dropstruct.var_91170e589f9e8ff), dropstruct.var_91170e589f9e8ff, 5);
    var_b0bb91ad89d1aaed = ter_op(isdefined(dropstruct.var_82839e7264d5d15e), dropstruct.var_82839e7264d5d15e, -5);
    var_b0987bad89ab32d3 = ter_op(isdefined(dropstruct.var_8260b07264afb13c), dropstruct.var_8260b07264afb13c, 5);
    var_b57e08395cbe94d2 = 40;
    if (isdefined(ignoreent) && isent(ignoreent) && isplayer(ignoreent) && namespace_e47104b48662385b::isreallyalive(ignoreent)) {
        currentstance = ignoreent getstance();
        if (currentstance == "crouch") {
            var_b57e08395cbe94d2 = 20;
        } else if (currentstance == "prone") {
            var_b57e08395cbe94d2 = 10;
        }
    }
    var_adf4a147715daba0 = spawnstruct();
    var_adf4a147715daba0.var_c551ab221bac9779 = 0;
    var_adf4a147715daba0.payload = 0;
    var_adf4a147715daba0.groundentity = undefined;
    if (!isdefined(baseangles)) {
        baseangles = (0, 0, 0);
    }
    var_c79bb482424eb3a0 = 0;
    if (isdefined(dropstruct.var_6fe2ff802d5192d4)) {
        var_c79bb482424eb3a0 = dropstruct.var_6fe2ff802d5192d4;
    }
    var_d2052427afb83208 = dropstruct.var_dfba5a2c3c6f0a07;
    if (isdefined(dropstruct.var_e35351de85fe342d) && dropstruct.var_e35351de85fe342d > 0) {
        var_910a2201eb1324a9 = var_c459fe3ec72a8224 * var_4af424534f675c4d;
        if (var_910a2201eb1324a9 < dropstruct.var_e35351de85fe342d) {
            var_4af424534f675c4d = var_4af424534f675c4d + int((dropstruct.var_e35351de85fe342d - var_910a2201eb1324a9) / var_c459fe3ec72a8224) + 1;
            var_910a2201eb1324a9 = var_c459fe3ec72a8224 * var_4af424534f675c4d;
        }
        var_ffe1703d5d22415a = int(var_910a2201eb1324a9 / dropstruct.var_e35351de85fe342d);
        var_8bb31dc1b994cab5 = dropstruct.var_dfba5a2c3c6f0a07 * var_ffe1703d5d22415a;
        var_d40d2342f65ca3dd = 0;
        if (var_ffe1703d5d22415a > 1) {
            var_d40d2342f65ca3dd = randomintrange(0, var_ffe1703d5d22415a - 1);
        }
        var_d2052427afb83208 = var_8bb31dc1b994cab5 + var_d40d2342f65ca3dd;
    }
    var_57716496f9f490f = 75;
    if (isdefined(dropstruct.var_808de1e892fb0269)) {
        var_57716496f9f490f = dropstruct.var_808de1e892fb0269;
    }
    var_e0cc897878c28778 = 35;
    if (isdefined(dropstruct.var_6353cc9d3791853a)) {
        var_e0cc897878c28778 = dropstruct.var_6353cc9d3791853a;
    }
    var_adf4a147715daba0.ring = int(var_d2052427afb83208 / var_c459fe3ec72a8224);
    var_adf4a147715daba0.var_c824bfca29a82e9b = var_d2052427afb83208 - var_adf4a147715daba0.ring * var_c459fe3ec72a8224;
    var_adf4a147715daba0.yaw = baseangles[1] + var_adf4a147715daba0.var_c824bfca29a82e9b * var_3385f93167b49aa1 + var_adf4a147715daba0.ring * 30 + randomfloatrange(var_ab9f50e5b2c2e07e, var_ab7c62e5b29cc05c);
    var_adf4a147715daba0.dist = var_57716496f9f490f + var_adf4a147715daba0.ring * var_e0cc897878c28778 + randomfloatrange(var_b0bb91ad89d1aaed, var_b0987bad89ab32d3);
    if (isdefined(dropstruct.var_8a600b6102da9f9b)) {
        var_adf4a147715daba0.yaw = baseangles[1] + dropstruct.var_8a600b6102da9f9b;
    }
    if (isdefined(dropstruct.var_f71d4f78d508da69)) {
        var_adf4a147715daba0.dist = dropstruct.var_f71d4f78d508da69;
    }
    var_adf4a147715daba0.var_37fba60b9cb411eb = (0, var_adf4a147715daba0.yaw, 0);
    var_adf4a147715daba0.dir = anglestoforward(var_adf4a147715daba0.var_37fba60b9cb411eb);
    if (level.var_cb89daf3a1d3e761 && !isdefined(dropstruct.var_f71d4f78d508da69) && !isdefined(dropstruct.var_d8cf705570b19696) && !istrue(var_688e4da4cb16116d) && var_adf4a147715daba0.ring < 1) {
        function_1b451ac8cf14a6a4(var_adf4a147715daba0, dropstruct, baseorigin);
    }
    var_adf4a147715daba0.var_2be6462ff6be9915 = baseorigin + var_adf4a147715daba0.dir * var_adf4a147715daba0.dist;
    if (isdefined(dropstruct.var_d8cf705570b19696)) {
        var_adf4a147715daba0.var_2be6462ff6be9915 = dropstruct.var_d8cf705570b19696;
    }
    if (1) {
        /#
            if (var_551904951118b7b9) {
                println("<unknown string>" + dropstruct.var_dfba5a2c3c6f0a07 + "<unknown string>" + baseorigin + "<unknown string>" + var_adf4a147715daba0.var_2be6462ff6be9915 + "<unknown string>" + var_adf4a147715daba0.dist);
            }
        #/
        var_fbcabd62b8f66eb8 = trace::create_contents(0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1);
        traceresults = function_9b539449b8809a8(dropstruct, var_adf4a147715daba0, baseorigin, ignoreent, var_fbcabd62b8f66eb8, var_551904951118b7b9);
        var_45e7ad8e414c03f = level.var_a0b1f76228d242e1;
        var_daa047868cf7a01b = level.var_b08a4f5480f5801d;
        if (isdefined(traceresults) && traceresults["fraction"] < var_daa047868cf7a01b && var_45e7ad8e414c03f > 0 && !isdefined(dropstruct.var_8a600b6102da9f9b) && !isdefined(dropstruct.var_f71d4f78d508da69) && !isdefined(dropstruct.var_d8cf705570b19696)) {
            function_37e7de90990a9b95(dropstruct, var_adf4a147715daba0, baseorigin, baseangles, ignoreent, var_fbcabd62b8f66eb8, var_45e7ad8e414c03f, var_daa047868cf7a01b, var_551904951118b7b9);
        }
        function_1bf026a5b9fdae23(dropstruct, var_adf4a147715daba0, ignoreent, var_fbcabd62b8f66eb8, var_551904951118b7b9);
        function_2b84f1379888e314(dropstruct, var_adf4a147715daba0, ignoreent, var_fbcabd62b8f66eb8, var_c79bb482424eb3a0, dropstruct.var_69f3e94ac253c6ab, var_551904951118b7b9);
    } else {
        var_adf4a147715daba0.var_2be6462ff6be9915 = var_adf4a147715daba0.var_2be6462ff6be9915 + (0, 0, var_c79bb482424eb3a0);
    }
    if (1 && !var_adf4a147715daba0.var_c551ab221bac9779) {
        startorigin = baseorigin;
        if (!istrue(var_3ace5ac9c7d6fa44)) {
            startorigin = startorigin + (0, 0, var_b57e08395cbe94d2);
        }
        var_adf4a147715daba0.payload = calcscriptablepayloadgravityarc(startorigin, var_adf4a147715daba0.var_2be6462ff6be9915);
    }
    /#
        if (var_551904951118b7b9) {
            println("<unknown string>" + dropstruct.var_dfba5a2c3c6f0a07 + "<unknown string>" + var_adf4a147715daba0.var_2be6462ff6be9915 + "<unknown string>" + var_adf4a147715daba0.var_37fba60b9cb411eb);
        }
    #/
    dropstruct.var_dfba5a2c3c6f0a07++;
    return function_250558a79c78739e(var_adf4a147715daba0.var_2be6462ff6be9915, var_adf4a147715daba0.var_37fba60b9cb411eb, var_adf4a147715daba0.payload, var_adf4a147715daba0.groundentity);
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4bce
// Size: 0x1c5
function private function_1b451ac8cf14a6a4(var_adf4a147715daba0, dropstruct, baseorigin) {
    var_fafd64b272244139 = getlootscriptablearrayinradius(undefined, undefined, baseorigin, var_adf4a147715daba0.dist + 10);
    if (isdefined(var_fafd64b272244139) && var_fafd64b272244139.size > 0) {
        foreach (scriptable in var_fafd64b272244139) {
            if (!isdefined(scriptable.origin)) {
                continue;
            }
            var_cac6b8b7efddb0e4 = scriptable.origin - baseorigin;
            var_e6d3398e6e00bb9e = vectornormalize(var_cac6b8b7efddb0e4);
            angle = vectordot(var_adf4a147715daba0.dir, var_e6d3398e6e00bb9e);
            if (angle > level.var_3a94e816b6c1f549) {
                mindist = distance2d(baseorigin, scriptable.origin) / 2;
                if (mindist < var_adf4a147715daba0.dist) {
                    var_adf4a147715daba0.dist = mindist;
                }
            }
        }
        var_57716496f9f490f = 75;
        if (isdefined(dropstruct.var_808de1e892fb0269)) {
            var_57716496f9f490f = dropstruct.var_808de1e892fb0269;
        }
        var_e0cc897878c28778 = 35;
        if (isdefined(dropstruct.var_6353cc9d3791853a)) {
            var_e0cc897878c28778 = dropstruct.var_6353cc9d3791853a;
        }
        if (var_adf4a147715daba0.dist < level.var_77551c1821d16927) {
            var_adf4a147715daba0.dist = var_57716496f9f490f + var_e0cc897878c28778 + randomfloatrange(-5, 5);
        }
    }
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d9a
// Size: 0x188
function private function_9b539449b8809a8(dropstruct, var_adf4a147715daba0, baseorigin, ignoreent, var_fbcabd62b8f66eb8, var_551904951118b7b9) {
    tracestart = baseorigin + (0, 0, 21);
    var_ffbb92bfd2dc8fe7 = var_adf4a147715daba0.dir * 18;
    traceend = var_adf4a147715daba0.var_2be6462ff6be9915 + var_ffbb92bfd2dc8fe7 + (0, 0, 21);
    traceresults = trace::ray_trace(tracestart, traceend, ignoreent, var_fbcabd62b8f66eb8);
    /#
        if (var_551904951118b7b9) {
            function_d2d7b153b9d3889e(dropstruct.var_dfba5a2c3c6f0a07, "<unknown string>", tracestart, traceend, traceresults);
        }
    #/
    if (traceresults["fraction"] < 1) {
        var_adf4a147715daba0.var_2be6462ff6be9915 = traceresults["position"];
    } else {
        var_adf4a147715daba0.var_2be6462ff6be9915 = traceend;
    }
    var_adf4a147715daba0.var_2be6462ff6be9915 = var_adf4a147715daba0.var_2be6462ff6be9915 - var_ffbb92bfd2dc8fe7;
    var_69750fb1d5f5525f = level.var_f4a8313dc2ced539;
    for (check = 0; check < var_69750fb1d5f5525f; check++) {
        tracestart = tracestart + (0, 0, 10 * check);
        var_435e68a101be2358 = trace::ray_trace(tracestart, traceend, ignoreent, var_fbcabd62b8f66eb8);
        if (var_435e68a101be2358["fraction"] < traceresults["fraction"]) {
            traceresults["fraction"] = -1;
        }
    }
    return traceresults;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f2a
// Size: 0x360
function private function_37e7de90990a9b95(dropstruct, var_adf4a147715daba0, baseorigin, baseangles, ignoreent, var_fbcabd62b8f66eb8, retries, var_daa047868cf7a01b, var_551904951118b7b9) {
    var_c459fe3ec72a8224 = 6;
    var_3385f93167b49aa1 = 360 / var_c459fe3ec72a8224;
    var_69ba8b68ba5e82e1 = var_adf4a147715daba0.ring;
    var_52f7d953deddb1d3 = var_adf4a147715daba0.var_c824bfca29a82e9b;
    var_d1f8e4e25a5b0afa = var_adf4a147715daba0.yaw;
    var_b1645fb2e124b7bf = var_adf4a147715daba0.dist;
    var_943ce3376b5dfe = var_adf4a147715daba0.dir;
    var_f4a31528787ae6bd = var_adf4a147715daba0.var_37fba60b9cb411eb;
    var_9bd3420d924c5c43 = var_adf4a147715daba0.var_2be6462ff6be9915;
    var_57716496f9f490f = 75;
    if (isdefined(dropstruct.var_808de1e892fb0269)) {
        var_57716496f9f490f = dropstruct.var_808de1e892fb0269;
    }
    var_e0cc897878c28778 = 35;
    if (isdefined(dropstruct.var_6353cc9d3791853a)) {
        var_e0cc897878c28778 = dropstruct.var_6353cc9d3791853a;
    }
    attempts = 0;
    success = 0;
    while (attempts < retries && !success) {
        dropstruct.var_dfba5a2c3c6f0a07++;
        var_adf4a147715daba0.ring = int(dropstruct.var_dfba5a2c3c6f0a07 / var_c459fe3ec72a8224);
        var_adf4a147715daba0.var_c824bfca29a82e9b = dropstruct.var_dfba5a2c3c6f0a07 - var_adf4a147715daba0.ring * var_c459fe3ec72a8224;
        var_adf4a147715daba0.yaw = baseangles[1] + var_adf4a147715daba0.var_c824bfca29a82e9b * var_3385f93167b49aa1 + var_adf4a147715daba0.ring * 30 + randomfloatrange(-5, 5);
        var_adf4a147715daba0.dist = var_57716496f9f490f + var_adf4a147715daba0.ring * var_e0cc897878c28778 + randomfloatrange(-5, 5);
        var_adf4a147715daba0.var_37fba60b9cb411eb = (0, var_adf4a147715daba0.yaw, 0);
        var_adf4a147715daba0.dir = anglestoforward(var_adf4a147715daba0.var_37fba60b9cb411eb);
        if (level.var_cb89daf3a1d3e761 && var_adf4a147715daba0.ring < 1) {
            function_1b451ac8cf14a6a4(var_adf4a147715daba0, dropstruct, baseorigin);
        }
        var_adf4a147715daba0.var_2be6462ff6be9915 = baseorigin + var_adf4a147715daba0.dir * var_adf4a147715daba0.dist;
        traceresults = function_9b539449b8809a8(dropstruct, var_adf4a147715daba0, baseorigin, ignoreent, var_fbcabd62b8f66eb8, var_551904951118b7b9);
        if (traceresults["fraction"] >= var_daa047868cf7a01b) {
            return;
        }
        attempts++;
    }
    var_adf4a147715daba0.ring = var_69ba8b68ba5e82e1;
    var_adf4a147715daba0.var_c824bfca29a82e9b = var_52f7d953deddb1d3;
    var_adf4a147715daba0.yaw = var_d1f8e4e25a5b0afa;
    var_adf4a147715daba0.dist = var_b1645fb2e124b7bf;
    var_adf4a147715daba0.dir = var_943ce3376b5dfe;
    var_adf4a147715daba0.var_37fba60b9cb411eb = var_f4a31528787ae6bd;
    var_adf4a147715daba0.var_2be6462ff6be9915 = var_9bd3420d924c5c43;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5291
// Size: 0xfd
function private function_1bf026a5b9fdae23(dropstruct, var_adf4a147715daba0, ignoreent, var_fbcabd62b8f66eb8, var_551904951118b7b9) {
    tracestart = var_adf4a147715daba0.var_2be6462ff6be9915;
    traceend = var_adf4a147715daba0.var_2be6462ff6be9915 + (0, 0, 60);
    traceresults = trace::ray_trace(tracestart, traceend, ignoreent, var_fbcabd62b8f66eb8);
    /#
        if (var_551904951118b7b9) {
            function_d2d7b153b9d3889e(dropstruct.var_dfba5a2c3c6f0a07, "<unknown string>", tracestart + (0, 1, 0), traceend + (0, 1, 0), traceresults);
        }
    #/
    if (traceresults["fraction"] < 1) {
        var_adf4a147715daba0.var_2be6462ff6be9915 = traceresults["position"] + (0, 0, -6);
    } else {
        var_adf4a147715daba0.var_2be6462ff6be9915 = traceend;
    }
    return traceresults;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5396
// Size: 0x2ae
function private function_2b84f1379888e314(dropstruct, var_adf4a147715daba0, ignoreent, var_fbcabd62b8f66eb8, var_c79bb482424eb3a0, var_69f3e94ac253c6ab, var_551904951118b7b9) {
    tracestart = var_adf4a147715daba0.var_2be6462ff6be9915;
    traceheight = function_53c4c53197386572(var_69f3e94ac253c6ab, level.var_bb7795c61887fc81);
    var_3a7f0173b03f5767 = -1 * traceheight;
    traceend = var_adf4a147715daba0.var_2be6462ff6be9915 + (0, 0, var_3a7f0173b03f5767);
    traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreent, var_fbcabd62b8f66eb8);
    /#
        if (var_551904951118b7b9) {
            function_d2d7b153b9d3889e(dropstruct.var_dfba5a2c3c6f0a07, "<unknown string>", tracestart, traceend, traceresults);
        }
    #/
    if (traceresults["fraction"] < 1) {
        var_adf4a147715daba0.var_2be6462ff6be9915 = traceresults["position"] + (0, 0, var_c79bb482424eb3a0);
        var_adf4a147715daba0.groundentity = traceresults["entity"];
        if (isdefined(var_adf4a147715daba0.groundentity) && (istrue(var_adf4a147715daba0.groundentity.isdestroyed) || istrue(var_adf4a147715daba0.groundentity.burningdown))) {
            ignorelist = [0:var_adf4a147715daba0.groundentity];
            if (isdefined(ignoreent)) {
                ignorelist[ignorelist.size] = ignoreent;
            }
            traceresults = namespace_2a184fc4902783dc::ray_trace(var_adf4a147715daba0.var_2be6462ff6be9915, traceend, ignorelist, var_fbcabd62b8f66eb8);
            /#
                if (var_551904951118b7b9) {
                    function_d2d7b153b9d3889e(dropstruct.var_dfba5a2c3c6f0a07, "<unknown string>", var_adf4a147715daba0.var_2be6462ff6be9915, traceend, traceresults);
                }
            #/
            if (traceresults["fraction"] < 1) {
                var_adf4a147715daba0.var_2be6462ff6be9915 = traceresults["position"] + (0, 0, var_c79bb482424eb3a0);
                var_adf4a147715daba0.groundentity = traceresults["entity"];
            } else {
                /#
                    if (var_551904951118b7b9) {
                        println("<unknown string>" + dropstruct.var_dfba5a2c3c6f0a07 + "<unknown string>");
                    }
                #/
                var_adf4a147715daba0.var_2be6462ff6be9915 = (0, 0, 0);
                var_adf4a147715daba0.var_c551ab221bac9779 = 1;
            }
        }
    } else {
        /#
            if (var_551904951118b7b9) {
                println("<unknown string>" + dropstruct.var_dfba5a2c3c6f0a07 + "<unknown string>");
            }
        #/
        var_adf4a147715daba0.var_2be6462ff6be9915 = (0, 0, 0);
        var_adf4a147715daba0.var_c551ab221bac9779 = 1;
    }
    return traceresults;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x564c
// Size: 0xaa
function private function_250558a79c78739e(origin, angles, payload, groundentity) {
    /#
        assert(isdefined(origin));
    #/
    var_cb4fad49263e20c4 = spawnstruct();
    var_cb4fad49263e20c4.origin = origin;
    if (isdefined(angles)) {
        var_cb4fad49263e20c4.angles = angles;
    } else {
        var_cb4fad49263e20c4.angles = (0, 0, 0);
    }
    if (isdefined(payload)) {
        var_cb4fad49263e20c4.payload = payload;
    } else {
        var_cb4fad49263e20c4.payload = 0;
    }
    var_cb4fad49263e20c4.groundentity = groundentity;
    return var_cb4fad49263e20c4;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x56fe
// Size: 0x14b
function function_d2d7b153b9d3889e(index, name, start, end, traceresults) {
    /#
        var_a16891a5162df351 = 2000;
        if (traceresults["<unknown string>"] < 1) {
            line(start, traceresults["<unknown string>"], (1, 0, 0), 1, 0, var_a16891a5162df351);
            if (isdefined(traceresults["<unknown string>"])) {
                var_8b6b95e859550ffb = traceresults["<unknown string>"];
                println("<unknown string>" + index + "<unknown string>" + name + "<unknown string>" + traceresults["<unknown string>"] + "<unknown string>" + traceresults["<unknown string>"] + "<unknown string>" + utility::function_53c4c53197386572(var_8b6b95e859550ffb.name, "<unknown string>"));
            } else {
                println("<unknown string>" + index + "<unknown string>" + name + "<unknown string>" + traceresults["<unknown string>"] + "<unknown string>" + traceresults["<unknown string>"]);
            }
        } else {
            println("<unknown string>" + index + "<unknown string>" + name + "<unknown string>");
            line(start, end, (1, 1, 1), 1, 0, var_a16891a5162df351);
        }
    #/
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5850
// Size: 0x96
function function_2c836ad05e5f634c(ref) {
    if (!isdefined(level.var_782b4804d4e2d690)) {
        level.var_782b4804d4e2d690 = [];
    } else if (isdefined(level.var_782b4804d4e2d690[ref])) {
        return level.var_782b4804d4e2d690[ref];
    }
    var_60ce74182e7c83a7 = function_e4f08713dc9c53b3(ref);
    if (!isdefined(var_60ce74182e7c83a7) || !isdefined(var_60ce74182e7c83a7.itemid)) {
        return undefined;
    }
    lootid = var_60ce74182e7c83a7.itemid;
    if (lootid == 0) {
        return undefined;
    }
    level.var_782b4804d4e2d690[ref] = lootid;
    return lootid;
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58ee
// Size: 0x67
function function_6d15e119c2779a93(itembundle) {
    if (!isdefined(itembundle)) {
        return undefined;
    }
    if (!isdefined(itembundle.ref)) {
        var_fbe755f0978c0369 = function_2cdc55ba39d97d70(itembundle.scriptable);
        /#
            assertmsg("CommonItemERROR: attempted to get lootID for itemspawnentry [" + var_fbe755f0978c0369 + "] which doesn't specify a .ref");
        #/
        return undefined;
    }
    return function_2c836ad05e5f634c(itembundle.ref);
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x595d
// Size: 0x73
function function_b270e989412a5f67() {
    /#
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_eb6d1966b3343a54, 1);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_237a0fdd6c243aca);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_dbbe2312a3bd6d8a);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_dbbe2312a3bd6d8a);
        devgui::function_fe953f000498048f();
    #/
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59d7
// Size: 0x121
function function_112c64fc568b602f(var_9ec97bdad14a0a5b) {
    /#
        if (getdvarint(@"hash_10f0811105fc2f93", 0) == 0) {
            return;
        }
        var_c1c3ecdd33dec5b7 = function_50f8a8f765bad85e("<unknown string>" + var_9ec97bdad14a0a5b, [0:#"type", 1:#"subtype", 2:#"scriptable"]);
        var_1c769e6e3f9771fc = "<unknown string>";
        if (isdefined(var_c1c3ecdd33dec5b7.type) && var_c1c3ecdd33dec5b7.type != "<unknown string>") {
            var_1c769e6e3f9771fc = var_c1c3ecdd33dec5b7.type + "<unknown string>";
        }
        var_1712f2a4cc83caf8 = "<unknown string>";
        if (isdefined(var_c1c3ecdd33dec5b7.subtype) && var_c1c3ecdd33dec5b7.subtype != "<unknown string>") {
            var_1712f2a4cc83caf8 = var_c1c3ecdd33dec5b7.subtype + "<unknown string>";
        }
        if (!isdefined(var_c1c3ecdd33dec5b7.scriptable)) {
            return;
        }
        devgui::function_b23a59dfb4ca49a1("<unknown string>" + var_1c769e6e3f9771fc + var_1712f2a4cc83caf8 + var_9ec97bdad14a0a5b, "<unknown string>" + var_9ec97bdad14a0a5b, &function_f8162124bbb6ece3, 0, 0);
    #/
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5aff
// Size: 0xcc
function private function_eb6d1966b3343a54() {
    /#
        while (1) {
            items = namespace_7c5bb630aad381e::function_f8ecd6e02634e682("<unknown string>");
            if (isdefined(items)) {
                foreach (item in items) {
                    sphere(item.origin, 10, (1, 0, 0), 1);
                    line(item.origin, item.origin + (0, 0, 50), (1, 0, 0), 1, 1);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5bd2
// Size: 0x39
function private function_237a0fdd6c243aca() {
    /#
        level.var_f8a5820fe8fff0fd = !istrue(level.var_f8a5820fe8fff0fd);
        iprintlnbold(level.var_f8a5820fe8fff0fd ? "<unknown string>" : "<unknown string>");
    #/
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x5c12
// Size: 0x47
function private function_4bc7f4cf12558446(origin, color, radius, depthtest, duration) {
    /#
        if (istrue(level.var_f8a5820fe8fff0fd)) {
            sphere(origin, color, radius, depthtest, duration);
        }
    #/
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x5c60
// Size: 0x50
function private function_434cb1f9af023e71(start, end, color, alpha, depthtest, duration) {
    /#
        if (istrue(level.var_f8a5820fe8fff0fd)) {
            line(start, end, color, alpha, depthtest, duration);
        }
    #/
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5cb7
// Size: 0x1b7
function function_f8162124bbb6ece3(params) {
    /#
        item_name = params[0];
        payload = params[1];
        if (isdefined(item_name) && item_name != "<unknown string>") {
            if (isdefined(payload)) {
                payload = [0:#"hash_5f9c433bdcfb4e14", 1:level.players[0] getentitynumber()];
            }
            foreach (var_b58ae7444b8d7baa, var_a59089e939dc706f in level.var_986acb83cc29ed77.var_970a8dd2fe7c510b) {
                if (item_name == var_a59089e939dc706f || item_name == var_b58ae7444b8d7baa) {
                    itembundle = getscriptbundle("<unknown string>" + var_a59089e939dc706f);
                    function_c465d27f3f6066b4(itembundle, function_963151d62c29fc95(), undefined, 0, 0, payload);
                    return;
                }
            }
            foreach (var_5dece42973125f56, var_a59089e939dc706f in level.var_986acb83cc29ed77.var_ec08d293dcc1ea4f) {
                if (item_name == var_a59089e939dc706f || item_name == var_5dece42973125f56) {
                    itembundle = getscriptbundle("<unknown string>" + var_a59089e939dc706f);
                    function_c465d27f3f6066b4(itembundle, function_963151d62c29fc95(), undefined, 0, 0, payload);
                    return;
                }
            }
            itembundle = getscriptbundle("<unknown string>" + item_name);
            if (isdefined(itembundle)) {
                function_c465d27f3f6066b4(itembundle, function_963151d62c29fc95(), undefined, 0, 0, payload);
                return;
            }
            /#
                assertmsg("<unknown string>" + item_name + "<unknown string>");
            #/
        }
    #/
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e75
// Size: 0x85
function function_963151d62c29fc95() {
    /#
        if (level.players.size > 0) {
            player = level.players[0];
            forward = anglestoforward(player getplayerangles());
            var_c9844d4eb04faec9 = player.origin + forward * 100;
            var_c9844d4eb04faec9 = utility::drop_to_ground(var_c9844d4eb04faec9, 100) + (0, 0, 8);
            return var_c9844d4eb04faec9;
        }
        return (0, 0, 0);
    #/
}

// Namespace namespace_49e179ec476603d6/namespace_2abc885019e1956
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f01
// Size: 0x18b
function function_dbbe2312a3bd6d8a(params) {
    /#
        enabled = params[0] == "<unknown string>";
        if (level.players.size > 0) {
            player = level.players[0];
            player_forward = anglestoforward(player getplayerangles());
            result = namespace_2a184fc4902783dc::ray_trace(player geteye(), player geteye() + player_forward * 10000);
            if (isdefined(result["<unknown string>"]) && isdefined(result["<unknown string>"]) && result["<unknown string>"] < 1) {
                cylinder(result["<unknown string>"], result["<unknown string>"] + (0, 0, 1), 32, (0, 1, 0), 0, 10);
                scriptables = getscriptablearrayinradius(undefined, undefined, result["<unknown string>"], 32);
                scriptables = utility::array_combine(scriptables, getlootscriptablearrayinradius(undefined, undefined, result["<unknown string>"], 32));
                if (scriptables.size == 0) {
                    return;
                }
                foreach (scriptable in scriptables) {
                    if (scriptable getscriptableisloot() && scriptable getscriptableisusableonanypart()) {
                        if (enabled) {
                            scriptable enablescriptableplayeruse(player);
                        } else {
                            scriptable disablescriptableplayeruse(player);
                        }
                    }
                }
            }
        }
    #/
}

