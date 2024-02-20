// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_247745a526421ba7;
#using script_2d9d24f7c63ac143;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\class.gsc;
#using script_b7a9ce0a2282b79;
#using script_600b944a95c3a7bf;
#using script_7ef95bba57dc4b82;
#using script_6775ad452d13858;
#using script_2669878cf5a1b6bc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_6fc415ff6a905dc1;
#using scripts\cp_mp\challenges.gsc;
#using script_2391409ef7b431e1;
#using scripts\mp\supers.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\equipment.gsc;
#using script_7c40fa80892a721;

#namespace namespace_b16531563568eaba;

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x604
// Size: 0xb3
function init() {
    namespace_3c37cb17ade254d::registersharedfunc("instanceInventory", "getUpgradeCount", &getUpgradeCount);
    namespace_3c37cb17ade254d::registersharedfunc("instanceInventory", "restorePlateCarrier", &function_743a2b4d08f023d2);
    namespace_3c37cb17ade254d::registersharedfunc("instanceInventory", "getNumStartUpgradePlates", &getNumStartUpgradePlates);
    namespace_3c37cb17ade254d::registersharedfunc("instanceInventory", "isEnabled", &function_e0fc1230452cf4e7);
    namespace_3c37cb17ade254d::registersharedfunc("instanceInventory", "inventoryIsValid", &inventoryIsValid);
    namespace_3c37cb17ade254d::registersharedfunc("instanceInventory", "updateDefaultClassStruct", &function_f02d8dd1e58f235c);
    namespace_3c37cb17ade254d::registersharedfunc("instanceInventory", "updateCustomClassStruct", &function_8b8cedb1c653204e);
    namespace_3c37cb17ade254d::registersharedfunc("instanceInventory", "updateInstanceInventoryFromDefault", &updateInstanceInventoryFromDefault);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6be
// Size: 0x63
function initteamdatafields() {
    foreach (team in level.teamnamelist) {
        level.teamdata[team]["extractedStashItems"] = [];
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x728
// Size: 0x53
function function_ddbc94f52a1947b5(player, lootid) {
    extractedStashItems = namespace_54d20dd0dd79277f::getteamdata(player.team, "extractedStashItems");
    extractedStashItems[lootid] = 1;
    namespace_54d20dd0dd79277f::setteamdata(player.team, "extractedStashItems", extractedStashItems);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x782
// Size: 0x31
function function_e0fc1230452cf4e7() {
    if (!isdefined(level.var_8f125ba0dc7c4b33)) {
        level.var_8f125ba0dc7c4b33 = getdvarint(@"hash_a31e837c3d3a9c9", 0);
    }
    return level.var_8f125ba0dc7c4b33;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bb
// Size: 0x31
function function_758b22811e547efe() {
    if (!isdefined(level.var_77441e4682269fc5)) {
        level.var_77441e4682269fc5 = getdvarint(@"hash_3a0b46b826670c2b", 0);
    }
    return level.var_77441e4682269fc5;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f4
// Size: 0x32
function function_dedf2039edee97d0() {
    if (!isdefined(level.var_8fa33b5efba196a8)) {
        level.var_8fa33b5efba196a8 = getdvarint(@"hash_effdf75f46ecb806", 1);
    }
    return level.var_8fa33b5efba196a8;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82e
// Size: 0x12
function inventoryIsValid(player) {
    return player function_f6c07d6ea7d83a5a();
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x848
// Size: 0x335
function function_8b8cedb1c653204e(player, struct, class) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    classindex = namespace_d19129e4fa5d176::getclassindex(class);
    self.class_num = classindex;
    struct.loadoutarchetype = namespace_d19129e4fa5d176::cac_getcharacterarchetype();
    var_85fb3582623df614 = namespace_a38a2e1fe7519183::function_7dfe7ea5ffd28ad4(self, 0);
    struct.loadoutprimary = var_85fb3582623df614.weaponref;
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        struct.loadoutprimaryattachments[attachmentindex] = var_85fb3582623df614.var_31553e68a5164e3e[attachmentindex];
        struct.loadoutprimaryattachmentids[attachmentindex] = var_85fb3582623df614.var_f3464d71f01f614e[attachmentindex];
        var_c19231fe2990712e = var_85fb3582623df614.var_eae5a591e200672[attachmentindex];
        if (isdefined(var_c19231fe2990712e)) {
            struct.var_193bf3cfb8aeaf0f[struct.loadoutprimaryattachments[attachmentindex]] = var_c19231fe2990712e;
        }
    }
    struct.loadoutprimarycamo = var_85fb3582623df614.weaponcamo;
    struct.loadoutprimaryreticle = var_85fb3582623df614.weaponreticle;
    struct.loadoutprimarylootitemid = var_85fb3582623df614.lootItemID;
    struct.loadoutprimaryvariantid = var_85fb3582623df614.var_9da910194dabeabe;
    struct.loadoutprimarycosmeticattachment = var_85fb3582623df614.var_67dfd35699ba2d3e;
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
        struct.loadoutprimarystickers[var_36d2abbdcbcb186c] = var_85fb3582623df614.var_3a585b7543f910c5[var_36d2abbdcbcb186c];
    }
    if (isdefined(var_85fb3582623df614.var_eb30bdf1f971a3cd)) {
        struct.var_c4c1f56f0ddbeeff = var_85fb3582623df614.var_eb30bdf1f971a3cd;
    }
    var_fc0fae08675e1054 = namespace_a38a2e1fe7519183::function_7dfe7ea5ffd28ad4(self, 1);
    struct.loadoutsecondary = var_fc0fae08675e1054.weaponref;
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        struct.loadoutsecondaryattachments[attachmentindex] = var_fc0fae08675e1054.var_31553e68a5164e3e[attachmentindex];
        struct.loadoutsecondaryattachmentids[attachmentindex] = var_fc0fae08675e1054.var_f3464d71f01f614e[attachmentindex];
        var_c19231fe2990712e = undefined;
        if (isdefined(var_c19231fe2990712e)) {
            struct.var_ead3720e647f74a3[struct.loadoutsecondaryattachments[attachmentindex]] = var_c19231fe2990712e;
        }
    }
    struct.loadoutsecondarycamo = var_fc0fae08675e1054.weaponcamo;
    struct.loadoutsecondaryreticle = var_fc0fae08675e1054.weaponreticle;
    struct.loadoutsecondarylootitemid = var_fc0fae08675e1054.lootItemID;
    struct.loadoutsecondaryvariantid = var_fc0fae08675e1054.var_9da910194dabeabe;
    struct.loadoutsecondarycosmeticattachment = var_fc0fae08675e1054.var_67dfd35699ba2d3e;
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
        struct.loadoutsecondarystickers[var_36d2abbdcbcb186c] = var_fc0fae08675e1054.var_3a585b7543f910c5[var_36d2abbdcbcb186c];
    }
    if (isdefined(var_fc0fae08675e1054.var_eb30bdf1f971a3cd)) {
        struct.var_f440bb0f08482d83 = var_fc0fae08675e1054.var_eb30bdf1f971a3cd;
    }
    namespace_a38a2e1fe7519183::function_f02d8dd1e58f235c(self, struct);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb84
// Size: 0x282
function function_f02d8dd1e58f235c(player, struct) {
    if (!function_e0fc1230452cf4e7() || !istrue(inventoryIsValid(player))) {
        return;
    }
    lootid = player function_644ed519cac9722b(1, 2).lootid;
    var_5577636292591c8b = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
    if (isdefined(var_5577636292591c8b) && var_5577636292591c8b == "weapon") {
        var_5577636292591c8b = "equipment";
    }
    if (isdefined(var_5577636292591c8b) && var_5577636292591c8b == "equipment") {
        struct.loadoutequipmentprimary = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
        struct.var_b68e3a0a9c628d23 = function_64ccc54bdbae5cf6(lootid);
        if (isdefined(struct.var_b68e3a0a9c628d23) && struct.var_b68e3a0a9c628d23 > 0) {
            struct.loadoutequipmentprimary = namespace_4fb9dddfb8c1a67a::function_f4f687e4e1edb923(struct.loadoutequipmentprimary);
        }
    }
    lootid = player function_644ed519cac9722b(1, 3).lootid;
    var_5577636292591c8b = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
    if (isdefined(var_5577636292591c8b) && var_5577636292591c8b == "weapon") {
        var_5577636292591c8b = "equipment";
    }
    if (isdefined(var_5577636292591c8b) && var_5577636292591c8b == "equipment") {
        struct.loadoutequipmentsecondary = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
        struct.var_a1dfc5ce15795a3 = function_64ccc54bdbae5cf6(lootid);
        if (isdefined(struct.var_a1dfc5ce15795a3) && struct.var_a1dfc5ce15795a3 > 0) {
            struct.loadoutequipmentsecondary = namespace_4fb9dddfb8c1a67a::function_f4f687e4e1edb923(struct.loadoutequipmentsecondary);
        }
    }
    lootid = player function_644ed519cac9722b(1, 4).lootid;
    var_5577636292591c8b = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
    if (isdefined(var_5577636292591c8b) && var_5577636292591c8b == "super") {
        struct.loadoutfieldupgrade1 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    }
    var_5864ea4e21a60cd4 = function_ef8648922f0937b9(player);
    struct.loadoutstreaksfilled = 1;
    lootid = player function_644ed519cac9722b(65535, 0).lootid;
    var_5577636292591c8b = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
    if (isdefined(var_5577636292591c8b) && var_5577636292591c8b == "killstreak") {
        struct.loadoutkillstreak1 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    } else if (isdefined(var_5864ea4e21a60cd4)) {
        var_fee734b9a173f3ec = namespace_465d40bb08a5337a::function_e0b3eff8c73f5475(var_5864ea4e21a60cd4);
        if (isdefined(var_fee734b9a173f3ec)) {
            /#
                assert(namespace_38b993c4618e76cd::function_282cf83c9eeda744(var_fee734b9a173f3ec) == "killstreak");
            #/
            struct.loadoutkillstreak1 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_fee734b9a173f3ec);
            function_aa051314f7cdab4e(player, var_fee734b9a173f3ec);
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0d
// Size: 0x99
function updateInstanceInventoryFromDefault(player) {
    if (!function_e0fc1230452cf4e7() || !istrue(namespace_d19129e4fa5d176::function_de324c78ecdc7acd(player))) {
        return;
    }
    function_787f50a063a49187(player, 11, 1, 0, player.primaryweaponobj);
    function_787f50a063a49187(player, 11, 1, 1, player.secondaryweaponobj);
    function_f5b2810055f85ead(player, "primary", namespace_38b993c4618e76cd::getLootIDFromRef(player.loadoutequipmentprimary));
    function_f5b2810055f85ead(player, "secondary", namespace_38b993c4618e76cd::getLootIDFromRef(player.loadoutequipmentsecondary));
    namespace_d19129e4fa5d176::function_cfa0343e808b7421(player, 0);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xead
// Size: 0x5a3
function function_ea56934c1996d527(player, location, var_fb6bafb61d5c3d4a) {
    struct = spawnstruct();
    instance = player function_644ed519cac9722b(location, var_fb6bafb61d5c3d4a);
    if (istrue(level.var_ff7483c62c2bcb88) && (!isdefined(instance) || instance.lootid == 0)) {
        struct.lootItemID = 0;
        struct.weaponref = "iw9_me_fists_mp";
        struct.var_9da910194dabeabe = 0;
    } else {
        var_5577636292591c8b = namespace_38b993c4618e76cd::function_282cf83c9eeda744(instance.lootid);
        if (isdefined(var_5577636292591c8b) && var_5577636292591c8b == "weapon") {
            struct.lootItemID = instance.lootid;
        } else {
            struct.lootItemID = 0;
        }
        struct.weaponref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(struct.lootItemID);
        struct.var_9da910194dabeabe = function_64ccc54bdbae5cf6(struct.lootItemID);
    }
    struct.var_31553e68a5164e3e = [];
    struct.var_f3464d71f01f614e = [];
    struct.var_eae5a591e200672 = [];
    struct.var_4d3cc0262cea20f0 = [];
    struct.weaponcamo = "none";
    struct.weaponreticle = "none";
    struct.var_67dfd35699ba2d3e = "none";
    struct.var_3a585b7543f910c5 = [];
    if (struct.lootItemID == 0) {
        return struct;
    }
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(struct.weaponref);
    var_c7bd95b10c89cff8 = namespace_e0ee43ef2dddadaa::weaponassetnamemap(rootname, struct.var_9da910194dabeabe);
    var_a49780479de1fc05 = instance.var_6cb812578f7d9ae7;
    for (var_80fbf4ed7b56b1df = 0; var_80fbf4ed7b56b1df <= 4; var_80fbf4ed7b56b1df++) {
        var_251fc0ce44d0b66d = "none";
        var_552c315bc08bc397 = 0;
        attachmentindex = 0 + var_80fbf4ed7b56b1df;
        struct.var_f3464d71f01f614e[var_80fbf4ed7b56b1df] = 0;
        if (isdefined(var_a49780479de1fc05) && isdefined(var_a49780479de1fc05[attachmentindex])) {
            var_552c315bc08bc397 = var_a49780479de1fc05[attachmentindex];
            var_5577636292591c8b = namespace_38b993c4618e76cd::function_282cf83c9eeda744(var_552c315bc08bc397);
            if (isdefined(var_552c315bc08bc397) && var_552c315bc08bc397 != 0 && isdefined(var_5577636292591c8b) && var_5577636292591c8b == "attachment") {
                var_251fc0ce44d0b66d = namespace_38b993c4618e76cd::function_2f80e9272a2074d(var_552c315bc08bc397, var_c7bd95b10c89cff8);
                struct.var_f3464d71f01f614e[var_80fbf4ed7b56b1df] = namespace_3bbb5a98b932c46f::function_15abe90be101ffc8(var_c7bd95b10c89cff8, var_251fc0ce44d0b66d, var_a49780479de1fc05[attachmentindex]);
            }
        }
        struct.var_31553e68a5164e3e[var_80fbf4ed7b56b1df] = var_251fc0ce44d0b66d;
    }
    if (isdefined(instance.var_d3c548c09bb62da2)) {
        for (i = 2; i <= 6; i++) {
            value = function_423648b9c03fdaa1(i, instance, 1);
            if (isdefined(value) && int(value) != 0) {
                value = int(value);
                valuex = value & 255;
                valuey = value >> 8;
                struct.var_eae5a591e200672[i - 2] = [0:function_f76ff66a6601d9c9(valuex), 1:function_f76ff66a6601d9c9(valuey)];
            }
        }
        for (i = 8; i <= 12; i++) {
            value = function_423648b9c03fdaa1(i, instance, 1);
            if (isdefined(value) && int(value) != 0) {
                struct.var_4d3cc0262cea20f0[i - 8] = int(value);
            }
        }
        value = function_423648b9c03fdaa1(7, instance, 1);
        if (isdefined(value) && int(value) != 0) {
            struct.var_eb30bdf1f971a3cd = int(value);
        }
    }
    var_5577636292591c8b = namespace_38b993c4618e76cd::function_282cf83c9eeda744(var_a49780479de1fc05[5]);
    if (isdefined(var_a49780479de1fc05) && isdefined(var_a49780479de1fc05[5]) && isdefined(var_5577636292591c8b) && var_5577636292591c8b == "camo") {
        weaponcamo = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_a49780479de1fc05[5]);
        var_a3f7381340cf06d9 = function_50f8a8f765bad85e(function_2ef675c13ca1c4af(%"hash_1345cc24140e89b8", weaponcamo), [0:#"ref"]);
        struct.weaponcamo = var_a3f7381340cf06d9.ref;
    }
    var_5577636292591c8b = namespace_38b993c4618e76cd::function_282cf83c9eeda744(var_a49780479de1fc05[6]);
    if (isdefined(var_a49780479de1fc05) && isdefined(var_a49780479de1fc05[6] && isdefined(var_5577636292591c8b) && var_5577636292591c8b == "reticle")) {
        struct.weaponreticle = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_a49780479de1fc05[6]);
    }
    var_5577636292591c8b = namespace_38b993c4618e76cd::function_282cf83c9eeda744(var_a49780479de1fc05[7]);
    if (isdefined(var_a49780479de1fc05) && isdefined(var_a49780479de1fc05[7]) && isdefined(var_5577636292591c8b) && (var_5577636292591c8b == "gun_screen" || var_5577636292591c8b == "weapon_charm")) {
        struct.var_67dfd35699ba2d3e = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_a49780479de1fc05[7]);
    }
    for (var_171380a28f103a53 = 0; var_171380a28f103a53 <= 4; var_171380a28f103a53++) {
        var_3372b69cf77360ed = "none";
        var_36d2abbdcbcb186c = var_171380a28f103a53 + 8;
        var_5577636292591c8b = namespace_38b993c4618e76cd::function_282cf83c9eeda744(var_a49780479de1fc05[var_36d2abbdcbcb186c]);
        if (isdefined(var_a49780479de1fc05) && isdefined(var_a49780479de1fc05[var_36d2abbdcbcb186c]) && isdefined(var_5577636292591c8b) && var_5577636292591c8b == "sticker") {
            lootid = var_a49780479de1fc05[var_36d2abbdcbcb186c];
            if (isdefined(lootid) && lootid != 0) {
                var_3372b69cf77360ed = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
            }
        }
        struct.var_3a585b7543f910c5[var_171380a28f103a53] = var_3372b69cf77360ed;
    }
    return struct;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1458
// Size: 0x30
function function_7dfe7ea5ffd28ad4(player, weaponslot) {
    var_fb6bafb61d5c3d4a = function_4ad0394e9ad7176d(weaponslot);
    return function_ea56934c1996d527(player, 1, var_fb6bafb61d5c3d4a);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1490
// Size: 0x55
function private function_dc67872cc4cfae72(player, location, var_fb6bafb61d5c3d4a) {
    instance = player function_644ed519cac9722b(location, var_fb6bafb61d5c3d4a);
    if (instance.var_fb5fdfafc29f4513 != "0") {
        player function_dd5661ebe3c9a5a2(instance.var_fb5fdfafc29f4513);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ec
// Size: 0x18
function function_4ad0394e9ad7176d(weaponslot) {
    return ter_op(weaponslot == 0, 0, 1);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150c
// Size: 0x4e
function function_540c2b6342f4e28c(player, slot) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    if (slot == 2) {
        return player function_644ed519cac9722b(2, 0);
    } else {
        var_89dc405a017d19ca = function_4ad0394e9ad7176d(slot);
        return player function_644ed519cac9722b(1, var_89dc405a017d19ca);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1561
// Size: 0x59
function function_1f83d85290c29bef(player, weaponslot) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_fb6bafb61d5c3d4a = function_4ad0394e9ad7176d(weaponslot);
    var_6e079390df583eb4 = player function_644ed519cac9722b(1, var_fb6bafb61d5c3d4a);
    player function_da187bcae911d661(var_6e079390df583eb4.var_fb5fdfafc29f4513, 2, 0);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c1
// Size: 0xbd
function function_9fee9bd8efd81655(player, weaponobj, var_f51bbb191526dfa4, metadata) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    if (istrue(var_f51bbb191526dfa4)) {
        function_dc67872cc4cfae72(player, 2, 0);
    }
    function_787f50a063a49187(player, 11, 2, 0, weaponobj);
    function_a839b9ad5740477d(player, 2, 0);
    if (isdefined(metadata)) {
        instance = player function_644ed519cac9722b(2, 0);
        var_11cc6f33cb91b3f1 = function_fe92418620d93763(metadata[0]);
        var_d3c548c09bb62da2 = function_fe92418620d93763(metadata[1]);
        function_cd81c0e152649846(player, instance, var_11cc6f33cb91b3f1, var_d3c548c09bb62da2);
        /#
            function_72fe945f29c8bce6(player function_644ed519cac9722b(2, 0));
        #/
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1685
// Size: 0x9d
function function_fe92418620d93763(metadata) {
    var_60d63c99a7a31e59 = [];
    if (isdefined(metadata)) {
        foreach (data in metadata) {
            var_a0d21fdd38f60ecf = var_60d63c99a7a31e59.size;
            var_60d63c99a7a31e59[var_a0d21fdd38f60ecf] = [];
            var_60d63c99a7a31e59[var_a0d21fdd38f60ecf][0] = data.key;
            var_60d63c99a7a31e59[var_a0d21fdd38f60ecf][1] = int(data.value);
        }
    }
    return var_60d63c99a7a31e59;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172a
// Size: 0x1ff
function function_bf2fa755e8269ca8(keys, values, instance, var_d3c548c09bb62da2) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    if (!isdefined(keys) || !isdefined(values) || !isdefined(instance)) {
        return undefined;
    }
    if (!isarray(keys)) {
        keys = [0:keys];
    }
    if (!isarray(values)) {
        values = [0:values];
    }
    if (keys.size != values.size) {
        /#
            assertmsg("Keys and Values do not have the same length in createMetadataFromKVPs");
        #/
    }
    var_c630485049dea721 = [];
    var_a7efdaacbd89567 = instance.metadata;
    if (istrue(var_d3c548c09bb62da2)) {
        var_a7efdaacbd89567 = instance.var_d3c548c09bb62da2;
    }
    var_11e7b05668d732b9 = 0;
    if (istrue(var_d3c548c09bb62da2)) {
        var_11e7b05668d732b9 = 0;
    }
    foreach (index, key in keys) {
        var_946361b3ec392ac3 = undefined;
        foreach (dataindex, data in var_a7efdaacbd89567) {
            if (data.key == key) {
                var_a0d21fdd38f60ecf = var_c630485049dea721.size;
                var_c630485049dea721[var_a0d21fdd38f60ecf] = [];
                var_c630485049dea721[var_a0d21fdd38f60ecf][0] = key;
                var_c630485049dea721[var_a0d21fdd38f60ecf][1] = values[index];
                var_946361b3ec392ac3 = undefined;
                break;
            } else if (data.key == var_11e7b05668d732b9) {
                var_946361b3ec392ac3 = dataindex;
            }
        }
        if (isdefined(var_946361b3ec392ac3)) {
            var_a7efdaacbd89567[var_946361b3ec392ac3].key = key;
            var_a7efdaacbd89567[var_946361b3ec392ac3].value = values[index];
            var_a0d21fdd38f60ecf = var_c630485049dea721.size;
            var_c630485049dea721[var_a0d21fdd38f60ecf] = [];
            var_c630485049dea721[var_a0d21fdd38f60ecf][0] = key;
            var_c630485049dea721[var_a0d21fdd38f60ecf][1] = values[index];
        }
    }
    return var_c630485049dea721;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1931
// Size: 0x30d
function function_a839b9ad5740477d(player, location, var_fb6bafb61d5c3d4a, var_223785486725cd51) {
    weaponstruct = function_ea56934c1996d527(player, location, var_fb6bafb61d5c3d4a);
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weaponstruct.weaponref);
    player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "weapon", rootname);
    player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "variantID", weaponstruct.var_9da910194dabeabe);
    player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "lootItemID", weaponstruct.lootItemID);
    var_428a6c7cd65625c0 = 0;
    if (isdefined(weaponstruct.var_31553e68a5164e3e)) {
        for (attachmentindex = 0; attachmentindex < weaponstruct.var_31553e68a5164e3e.size; attachmentindex++) {
            player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "attachmentSetup", var_428a6c7cd65625c0, "attachment", weaponstruct.var_31553e68a5164e3e[attachmentindex]);
            player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "attachmentSetup", var_428a6c7cd65625c0, "variantID", weaponstruct.var_f3464d71f01f614e[attachmentindex]);
            if (isdefined(weaponstruct.var_eae5a591e200672) && isdefined(weaponstruct.var_eae5a591e200672[attachmentindex])) {
                player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "attachmentSetup", var_428a6c7cd65625c0, "customTune", 0, function_f3c863dd3265167(weaponstruct.var_eae5a591e200672[attachmentindex][0]));
                player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "attachmentSetup", var_428a6c7cd65625c0, "customTune", 1, function_f3c863dd3265167(weaponstruct.var_eae5a591e200672[attachmentindex][1]));
            }
            var_428a6c7cd65625c0++;
        }
    }
    if (isdefined(weaponstruct.weaponcamo)) {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "camo", weaponstruct.weaponcamo);
    }
    if (isdefined(weaponstruct.weaponreticle)) {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "reticle", weaponstruct.weaponreticle);
    }
    if (isdefined(weaponstruct.var_67dfd35699ba2d3e)) {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "cosmeticAttachment", weaponstruct.var_67dfd35699ba2d3e);
    }
    if (isdefined(weaponstruct.var_3a585b7543f910c5)) {
        for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < weaponstruct.var_3a585b7543f910c5.size; var_36d2abbdcbcb186c++) {
            if (isdefined(weaponstruct.var_3a585b7543f910c5[var_36d2abbdcbcb186c])) {
                player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "sticker", var_36d2abbdcbcb186c, weaponstruct.var_3a585b7543f910c5[var_36d2abbdcbcb186c]);
            }
        }
    }
    namespace_aead94004cf4c147::function_3e89085d4a19a802(player);
    if (!istrue(var_223785486725cd51)) {
        function_5baaa0ce73d6fe84(player);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c45
// Size: 0x3c
function function_f910b139e75fd559(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_6267a5ad12c5e4d4 = player function_644ed519cac9722b(2, 0);
    player function_dd5661ebe3c9a5a2(var_6267a5ad12c5e4d4.var_fb5fdfafc29f4513);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c88
// Size: 0xcd
function function_5d94b2dfabbc4cce(player, weaponobj, weaponslot, var_f51bbb191526dfa4, metadata) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_fb6bafb61d5c3d4a = function_4ad0394e9ad7176d(weaponslot);
    if (istrue(var_f51bbb191526dfa4)) {
        function_dc67872cc4cfae72(player, 1, var_fb6bafb61d5c3d4a);
    }
    function_787f50a063a49187(player, 11, 1, var_fb6bafb61d5c3d4a, weaponobj);
    if (isdefined(metadata)) {
        instance = player function_644ed519cac9722b(1, var_fb6bafb61d5c3d4a);
        var_11cc6f33cb91b3f1 = function_fe92418620d93763(metadata[0]);
        var_d3c548c09bb62da2 = function_fe92418620d93763(metadata[1]);
        function_cd81c0e152649846(player, instance, var_11cc6f33cb91b3f1, var_d3c548c09bb62da2);
        /#
            function_72fe945f29c8bce6(player function_644ed519cac9722b(1, var_fb6bafb61d5c3d4a));
        #/
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d5c
// Size: 0x357
function function_787f50a063a49187(player, var_207098e76bcac40f, location, var_fb6bafb61d5c3d4a, weaponobj) {
    variantid = weaponobj.variantid;
    if (!isdefined(weaponobj.variantid)) {
        variantid = 0;
    }
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weaponobj);
    lootid = namespace_e0ee43ef2dddadaa::function_79d6e6c22245687a(rootname, variantid);
    attachmentindex = 0;
    var_282ed072c12d4d4d = [];
    for (var_e26e310b5f042288 = 0; var_e26e310b5f042288 <= 12; var_e26e310b5f042288++) {
        var_282ed072c12d4d4d[var_e26e310b5f042288] = 0;
    }
    if (isdefined(weaponobj.attachments)) {
        foreach (attachment in weaponobj.attachments) {
            if (namespace_e0ee43ef2dddadaa::attachmentiscosmetic(attachment)) {
                var_282ed072c12d4d4d[7] = namespace_38b993c4618e76cd::getLootIDFromRef(attachment);
            } else if (namespace_3c37cb17ade254d::issharedfuncdefined("weapons", "attachmentIsSelectable")) {
                if ([[ namespace_3c37cb17ade254d::getsharedfunc("weapons", "attachmentIsSelectable") ]](weaponobj, attachment)) {
                    attachmentref = attachment;
                    if (isdefined(weaponobj.attachmentvarindices) && isdefined(weaponobj.attachmentvarindices[attachment])) {
                        var_4f13b964ab82fe13 = namespace_3bbb5a98b932c46f::function_1c6803f36c2ea0a6(weaponobj.basename, attachment, weaponobj.attachmentvarindices[attachment]);
                        if (!isdefined(var_4f13b964ab82fe13)) {
                            var_4f13b964ab82fe13 = namespace_e0ee43ef2dddadaa::function_693e108cb61ceeb5(rootname, attachment);
                        }
                        var_282ed072c12d4d4d[attachmentindex] = var_4f13b964ab82fe13;
                    } else {
                        var_282ed072c12d4d4d[attachmentindex] = namespace_e0ee43ef2dddadaa::function_693e108cb61ceeb5(rootname, attachment);
                    }
                    attachmentindex = attachmentindex + 1;
                }
            }
        }
    }
    if (isdefined(weaponobj.camo)) {
        var_282ed072c12d4d4d[5] = namespace_38b993c4618e76cd::getLootIDFromRef(weaponobj.camo);
    }
    if (isdefined(weaponobj.reticle)) {
        var_282ed072c12d4d4d[6] = namespace_38b993c4618e76cd::getLootIDFromRef(weaponobj.radical);
    }
    if (isdefined(weaponobj.stickerslot0) && weaponobj.stickerslot0 != "none") {
        var_282ed072c12d4d4d[8] = namespace_38b993c4618e76cd::getLootIDFromRef(weaponobj.stickerslot0);
    }
    if (isdefined(weaponobj.stickerslot1) && weaponobj.stickerslot1 != "none") {
        var_282ed072c12d4d4d[9] = namespace_38b993c4618e76cd::getLootIDFromRef(weaponobj.stickerslot1);
    }
    if (isdefined(weaponobj.stickerslot2) && weaponobj.stickerslot2 != "none") {
        var_282ed072c12d4d4d[10] = namespace_38b993c4618e76cd::getLootIDFromRef(weaponobj.stickerslot2);
    }
    if (isdefined(weaponobj.stickerslot3) && weaponobj.stickerslot3 != "none") {
        var_282ed072c12d4d4d[11] = namespace_38b993c4618e76cd::getLootIDFromRef(weaponobj.stickerslot3);
    }
    if (isdefined(weaponobj.var_b39ac546cc8621f8) && weaponobj.var_b39ac546cc8621f8 != "none") {
        var_282ed072c12d4d4d[12] = namespace_38b993c4618e76cd::getLootIDFromRef(weaponobj.var_b39ac546cc8621f8);
    }
    player function_4f1027e74d5073c4(lootid, var_207098e76bcac40f, location, var_fb6bafb61d5c3d4a, var_282ed072c12d4d4d);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ba
// Size: 0x1fb
function function_e5845ff9b61ac5d7(player, weaponobj, var_ec22a950f210e39, var_bac000abfe10d487, var_9539ccecbbdebc31, metadata) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    weaponslot = undefined;
    primaryweapon = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(player, 0);
    secondaryweapon = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(player, 1);
    if (isdefined(primaryweapon) && primaryweapon == weaponobj) {
        weaponslot = 0;
    } else if (isdefined(secondaryweapon) && secondaryweapon == weaponobj) {
        weaponslot = 1;
    } else {
        /#
            assert(0, "Attempting to set instance inventory for equip weapon" + weaponobj.basename + " for player " + player.name + " but weapon isn't equipped in either slot.");
        #/
        weaponslot = 0;
    }
    if (isdefined(var_ec22a950f210e39)) {
        var_6e079390df583eb4 = player function_644ed519cac9722b(1, weaponslot);
        if (istrue(var_bac000abfe10d487) && istrue(var_9539ccecbbdebc31)) {
            var_6267a5ad12c5e4d4 = player function_644ed519cac9722b(2, 0);
            function_87d6a0c83604fbea(player, var_6e079390df583eb4, var_6267a5ad12c5e4d4, 1, 2, weaponslot, 0);
            return;
        } else if (istrue(var_bac000abfe10d487)) {
            player function_da187bcae911d661(var_6e079390df583eb4.var_fb5fdfafc29f4513, 2, 0);
        } else {
            player function_dd5661ebe3c9a5a2(var_6e079390df583eb4.var_fb5fdfafc29f4513);
        }
    }
    if (istrue(var_9539ccecbbdebc31)) {
        var_6267a5ad12c5e4d4 = player function_644ed519cac9722b(2, 0);
        player function_da187bcae911d661(var_6267a5ad12c5e4d4.var_fb5fdfafc29f4513, 1, weaponslot);
    } else {
        function_787f50a063a49187(player, 11, 1, weaponslot, weaponobj);
        if (isdefined(metadata)) {
            instance = player function_644ed519cac9722b(1, weaponslot);
            var_11cc6f33cb91b3f1 = function_fe92418620d93763(metadata[0]);
            var_d3c548c09bb62da2 = function_fe92418620d93763(metadata[1]);
            function_cd81c0e152649846(player, instance, var_11cc6f33cb91b3f1, var_d3c548c09bb62da2);
            /#
                function_72fe945f29c8bce6(player function_644ed519cac9722b(1, weaponslot));
            #/
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22bc
// Size: 0x72
function function_22c2d36f9a723c2f(player, index, loadoutslot) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_65b695f0c0d909ed = 1 + index;
    /#
        assert(var_65b695f0c0d909ed < 12, "Attempting to set a backpack item at invalid index " + index);
    #/
    var_aa074bf91d082a74 = player function_644ed519cac9722b(1, loadoutslot);
    player function_da187bcae911d661(var_aa074bf91d082a74.var_fb5fdfafc29f4513, 2, var_65b695f0c0d909ed);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2335
// Size: 0x8a
function function_d368b112dc94baae(player, index, var_72ad120eaac64650, loadoutslot) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_65b695f0c0d909ed = 1 + index;
    /#
        assert(var_65b695f0c0d909ed < 12, "Attempting to set a backpack item at invalid index " + index);
    #/
    var_5dd11d67a8ffe194 = player function_644ed519cac9722b(2, var_65b695f0c0d909ed);
    var_aa074bf91d082a74 = player function_644ed519cac9722b(var_72ad120eaac64650, loadoutslot);
    function_87d6a0c83604fbea(player, var_5dd11d67a8ffe194, var_aa074bf91d082a74, 2, var_72ad120eaac64650, var_65b695f0c0d909ed, loadoutslot);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c6
// Size: 0x72
function function_e8a616866b41197(player, index, loadoutslot) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_65b695f0c0d909ed = 1 + index;
    /#
        assert(var_65b695f0c0d909ed <= 12, "Attempting to set a backpack item at invalid index " + index);
    #/
    var_5dd11d67a8ffe194 = player function_644ed519cac9722b(2, var_65b695f0c0d909ed);
    player function_da187bcae911d661(var_5dd11d67a8ffe194.var_fb5fdfafc29f4513, 1, loadoutslot);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x243f
// Size: 0x8e
function function_233512489717381(player, index, lootid) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_65b695f0c0d909ed = 1 + index;
    /#
        assert(var_65b695f0c0d909ed < 12, "Attempting to set a backpack item at invalid index " + index);
    #/
    var_207098e76bcac40f = 13;
    var_2f44e3b98c77c7cc = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (namespace_cb965d2f71fefddc::function_82d45592d750d388(var_2f44e3b98c77c7cc) || namespace_cb965d2f71fefddc::function_a38e261031751c09(var_2f44e3b98c77c7cc)) {
        var_207098e76bcac40f = 15;
    }
    player function_4f1027e74d5073c4(lootid, var_207098e76bcac40f, 2, var_65b695f0c0d909ed, []);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d4
// Size: 0x53
function function_f5b2810055f85ead(player, slot, lootid) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_89dc405a017d19ca = function_f1c7356a808e9bd9(slot);
    if (!isdefined(var_89dc405a017d19ca)) {
        return;
    }
    if (lootid == 0) {
        return;
    }
    player function_4f1027e74d5073c4(lootid, 13, 1, var_89dc405a017d19ca, []);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x252e
// Size: 0x2d
function function_aa051314f7cdab4e(player, lootid) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    player function_4f1027e74d5073c4(lootid, 13, 65535, 0, []);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2562
// Size: 0x2e
function function_92d947129ea5ba6e(player, lootid) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    player function_4f1027e74d5073c4(lootid, 13, 65535, 1, []);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2597
// Size: 0x2e
function function_c0ae57d4dc3a8eef(player, lootid) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    player function_4f1027e74d5073c4(lootid, 13, 65535, 3, []);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25cc
// Size: 0x2e
function function_826c883f14e827b3(player, lootid) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    player function_4f1027e74d5073c4(lootid, 13, 65535, 4, []);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2601
// Size: 0x2e
function function_bd01c77ab46f790(player, lootid) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    player function_4f1027e74d5073c4(lootid, 13, 65535, 2, []);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2636
// Size: 0x93
function function_ef8648922f0937b9(player) {
    if (!function_e0fc1230452cf4e7()) {
        return undefined;
    }
    var_2b33b070c1f877e6 = player function_644ed519cac9722b(65535, 6);
    if (isdefined(var_2b33b070c1f877e6) && var_2b33b070c1f877e6.var_fb5fdfafc29f4513 != "0") {
        if (isdefined(var_2b33b070c1f877e6.var_6cb812578f7d9ae7) && isdefined(var_2b33b070c1f877e6.var_6cb812578f7d9ae7[0])) {
            skinref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_2b33b070c1f877e6.var_6cb812578f7d9ae7[0]);
            if (isdefined(skinref)) {
                return namespace_465d40bb08a5337a::function_29b2af59258d6501(skinref);
            }
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26d0
// Size: 0x95
function function_28f402fa85068f06(player) {
    if (!function_e0fc1230452cf4e7()) {
        return undefined;
    }
    var_2b33b070c1f877e6 = player function_644ed519cac9722b(65535, 6);
    if (isdefined(var_2b33b070c1f877e6) && var_2b33b070c1f877e6.var_fb5fdfafc29f4513 != "0") {
        if (isdefined(var_2b33b070c1f877e6.var_6cb812578f7d9ae7) && isdefined(var_2b33b070c1f877e6.var_6cb812578f7d9ae7[1])) {
            executionref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_2b33b070c1f877e6.var_6cb812578f7d9ae7[1]);
            if (isdefined(executionref)) {
                return namespace_465d40bb08a5337a::function_3daf6bb451cf826e(executionref);
            }
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x276c
// Size: 0x13d
function function_80a3ed28ed1b33a1(player, streak, var_d933a3a8c547998e) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_573d6cfc9f758dcc = player function_644ed519cac9722b(65535, 5);
    var_282ed072c12d4d4d = [];
    var_48b8a0d00d96e904 = 0;
    if (isdefined(var_573d6cfc9f758dcc) && var_573d6cfc9f758dcc.var_fb5fdfafc29f4513 != "0") {
        if (isdefined(var_573d6cfc9f758dcc.var_6cb812578f7d9ae7)) {
            var_282ed072c12d4d4d = var_573d6cfc9f758dcc.var_6cb812578f7d9ae7;
            for (perkindex = 0; perkindex <= 9; perkindex++) {
                if (var_282ed072c12d4d4d[perkindex] != 0) {
                    var_48b8a0d00d96e904++;
                }
            }
        }
    }
    if (isdefined(var_d933a3a8c547998e)) {
        /#
            assert(var_48b8a0d00d96e904 <= 9);
        #/
        var_287813c50ec317ab = int(min(var_48b8a0d00d96e904, 9));
        var_282ed072c12d4d4d[var_287813c50ec317ab] = var_d933a3a8c547998e;
    }
    function_7bc70fc1dd299f89(player);
    player function_4f1027e74d5073c4(namespace_38b993c4618e76cd::getLootIDFromRef("dmz_exfil_streak"), 15, 65535, 5, var_282ed072c12d4d4d);
    var_573d6cfc9f758dcc = player function_644ed519cac9722b(65535, 5);
    var_5170a7c15b09f348 = function_bf2fa755e8269ca8([0:2], [0:streak], var_573d6cfc9f758dcc);
    function_cd81c0e152649846(player, var_573d6cfc9f758dcc, var_5170a7c15b09f348);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28b0
// Size: 0x2d
function function_a0b4e4dcd4b46cf8(player, lootid) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    player function_4f1027e74d5073c4(lootid, 13, 1, 12, []);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28e4
// Size: 0x2d
function function_1444118309b4345a(player, lootid) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    player function_4f1027e74d5073c4(lootid, 13, 1, 13, []);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2918
// Size: 0x2d
function function_1488c5e2dec8cf1b(player, lootid) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    player function_4f1027e74d5073c4(lootid, 13, 1, 14, []);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x294c
// Size: 0x2d
function function_72918635f959a76f(player, lootid) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    player function_4f1027e74d5073c4(lootid, 13, 1, 15, []);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2980
// Size: 0x2d
function function_21ca7273e5592920(player, lootid) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    player function_4f1027e74d5073c4(lootid, 13, 1, 16, []);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b4
// Size: 0x22
function function_b9da145c1f56fb90(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_dc67872cc4cfae72(player, 1, 12);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29dd
// Size: 0x22
function function_a29cfeeaaf0eff2(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_dc67872cc4cfae72(player, 1, 13);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a06
// Size: 0x22
function function_2906a7bfaa0ad0a3(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_dc67872cc4cfae72(player, 1, 14);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a2f
// Size: 0x22
function function_1e27d6436d2ef237(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_dc67872cc4cfae72(player, 1, 15);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a58
// Size: 0x22
function function_62eb6ab1b2878a58(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_dc67872cc4cfae72(player, 1, 16);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a81
// Size: 0x34
function function_80ff109723716c07(player) {
    function_b9da145c1f56fb90(player);
    function_a29cfeeaaf0eff2(player);
    function_2906a7bfaa0ad0a3(player);
    function_1e27d6436d2ef237(player);
    function_62eb6ab1b2878a58(player);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2abc
// Size: 0x23
function function_7bc70fc1dd299f89(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_dc67872cc4cfae72(player, 65535, 5);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ae6
// Size: 0xb2
function function_1558f8fb859c492a(player) {
    if (!function_e0fc1230452cf4e7()) {
        return [0:0, 1:[]];
    }
    var_573d6cfc9f758dcc = player function_644ed519cac9722b(65535, 5);
    if (isdefined(var_573d6cfc9f758dcc) && var_573d6cfc9f758dcc.var_fb5fdfafc29f4513 != "0") {
        if (isdefined(var_573d6cfc9f758dcc.var_6cb812578f7d9ae7) && isdefined(var_573d6cfc9f758dcc.metadata)) {
            streak = function_423648b9c03fdaa1(2, var_573d6cfc9f758dcc);
            if (!isdefined(streak)) {
                streak = 0;
            }
            return [0:int(streak), 1:var_573d6cfc9f758dcc.var_6cb812578f7d9ae7];
        }
    }
    return [0:0, 1:[]];
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba0
// Size: 0x4b
function function_52384260fe709f19(player, index) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    index = index + 1;
    /#
        assert(index >= 1 && index <= 12, "Attempting to revoke a backpack item at invalid index " + index);
    #/
    function_dc67872cc4cfae72(player, 2, index);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bf2
// Size: 0x6a
function function_bfedeb20f8b77f3f(player, slot, var_4850537bc9bf2170) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    if (istrue(var_4850537bc9bf2170) && !function_6484ce4430c9439b(player, slot)) {
        return;
    }
    if (slot == 2) {
        function_dc67872cc4cfae72(player, 2, 0);
    } else {
        var_89dc405a017d19ca = function_4ad0394e9ad7176d(slot);
        function_dc67872cc4cfae72(player, 1, var_89dc405a017d19ca);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c63
// Size: 0x41
function function_351fe4ac57ca37e5(player, slot) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_89dc405a017d19ca = function_f1c7356a808e9bd9(slot);
    if (!isdefined(var_89dc405a017d19ca)) {
        return;
    }
    function_dc67872cc4cfae72(player, 1, var_89dc405a017d19ca);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cab
// Size: 0x22
function function_28550536ebafe216(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_dc67872cc4cfae72(player, 65535, 0);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd4
// Size: 0x23
function function_777c89585478357b(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_dc67872cc4cfae72(player, 65535, 4);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cfe
// Size: 0x23
function function_a60428cda4724a7(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_dc67872cc4cfae72(player, 65535, 3);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d28
// Size: 0x23
function function_5b7dc44bb66553a6(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_dc67872cc4cfae72(player, 65535, 1);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d52
// Size: 0x23
function function_ea96b27797c7e268(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_dc67872cc4cfae72(player, 65535, 2);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d7c
// Size: 0x7d
function private function_87d6a0c83604fbea(player, var_7e55bd82d026534d, var_7e55ba82d0264cb4, var_fcf7e6e6d8c4861, var_fcf7b6e6d8c41c8, var_4a10e88291db3581, var_4a10e58291db2ee8) {
    player function_da187bcae911d661(var_7e55bd82d026534d.var_fb5fdfafc29f4513, 2, 13);
    player function_da187bcae911d661(var_7e55ba82d0264cb4.var_fb5fdfafc29f4513, var_fcf7e6e6d8c4861, var_4a10e88291db3581);
    player function_da187bcae911d661(var_7e55bd82d026534d.var_fb5fdfafc29f4513, var_fcf7b6e6d8c41c8, var_4a10e58291db2ee8);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e00
// Size: 0x13b
function function_ab1505092d4e2a8c(player, var_87f0698dc7ac0a09, location, var_fb6bafb61d5c3d4a, var_760480dc8b6f2623) {
    var_8488a6af29de20a = player function_644ed519cac9722b(location, var_fb6bafb61d5c3d4a);
    if (var_8488a6af29de20a.var_fb5fdfafc29f4513 != "0" && var_8488a6af29de20a.lootid != 0 && var_8488a6af29de20a.var_207098e76bcac40f != 11) {
        var_85166da84e55de25 = function_423648b9c03fdaa1(15, var_8488a6af29de20a, 1);
        if (function_3a8d97d9e7d9e535(player, var_8488a6af29de20a) > getsystemtime()) {
            player function_dd5661ebe3c9a5a2(var_8488a6af29de20a.var_fb5fdfafc29f4513);
        } else if (istrue(var_760480dc8b6f2623[var_85166da84e55de25])) {
            player function_dd5661ebe3c9a5a2(var_8488a6af29de20a.var_fb5fdfafc29f4513);
        } else {
            var_760480dc8b6f2623[var_85166da84e55de25] = 1;
            var_5170a7c15b09f348 = function_bf2fa755e8269ca8([0:1], [0:var_87f0698dc7ac0a09], var_8488a6af29de20a);
            if (isdefined(var_5170a7c15b09f348)) {
                function_cd81c0e152649846(player, var_8488a6af29de20a, var_5170a7c15b09f348);
            }
            var_8488a6af29de20a = player function_644ed519cac9722b(location, var_fb6bafb61d5c3d4a);
            /#
                function_72fe945f29c8bce6(var_8488a6af29de20a);
            #/
            player.var_b1bf418aa7242c1d[player.var_b1bf418aa7242c1d.size] = var_8488a6af29de20a;
            return var_760480dc8b6f2623;
        }
    }
    return var_760480dc8b6f2623;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f43
// Size: 0x7c
function function_8d65122ea2e88ecd(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    if (isdefined(player.var_b1bf418aa7242c1d)) {
        return;
    }
    player.var_b1bf418aa7242c1d = [];
    var_87f0698dc7ac0a09 = function_a3d464413e73f057(player);
    var_760480dc8b6f2623 = [];
    var_760480dc8b6f2623 = function_ab1505092d4e2a8c(player, var_87f0698dc7ac0a09, 2, 0, var_760480dc8b6f2623);
    var_760480dc8b6f2623 = function_ab1505092d4e2a8c(player, var_87f0698dc7ac0a09, 1, 0, var_760480dc8b6f2623);
    var_760480dc8b6f2623 = function_ab1505092d4e2a8c(player, var_87f0698dc7ac0a09, 1, 1, var_760480dc8b6f2623);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc6
// Size: 0x11f
function function_db31af9bfc65ea51(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    player.var_81d789409ada6941 = [];
    var_b2721cf177f915e4 = player function_644ed519cac9722b(1, 2);
    if (var_b2721cf177f915e4.var_fb5fdfafc29f4513 != "0" && var_b2721cf177f915e4.lootid != 0) {
        player.var_81d789409ada6941[2] = var_b2721cf177f915e4.lootid;
    }
    var_2230de25f8635c83 = player function_644ed519cac9722b(1, 3);
    if (var_2230de25f8635c83.var_fb5fdfafc29f4513 != "0" && var_2230de25f8635c83.lootid != 0) {
        player.var_81d789409ada6941[3] = var_2230de25f8635c83.lootid;
    }
    var_bed94c5e8ba6c57e = player function_644ed519cac9722b(1, 4);
    if (var_bed94c5e8ba6c57e.var_fb5fdfafc29f4513 != "0" && var_bed94c5e8ba6c57e.lootid != 0) {
        player.var_81d789409ada6941[4] = var_bed94c5e8ba6c57e.lootid;
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ec
// Size: 0x184
function function_33366ade5697aa38(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    /#
        println(player.name + "lootItemID");
    #/
    function_a839b9ad5740477d(player, 2, 0);
    for (var_65b695f0c0d909ed = 0; var_65b695f0c0d909ed < 11; var_65b695f0c0d909ed++) {
        var_65d040b6fa76f410 = player function_644ed519cac9722b(2, 1 + var_65b695f0c0d909ed);
        lootid = var_65d040b6fa76f410.lootid;
        quantity = function_423648b9c03fdaa1(3, var_65d040b6fa76f410, 0);
        quantity = int(function_53c4c53197386572(quantity, 1));
        player setplayerdata(level.var_5d69837cf4db0407, "dmzBackpack", var_65b695f0c0d909ed, "lootID", lootid);
        player setplayerdata(level.var_5d69837cf4db0407, "dmzBackpack", var_65b695f0c0d909ed, "quantity", quantity);
        player namespace_512200f0f9e6ebc9::function_bac731e0fdaa0ccb(lootid);
    }
    /#
        println(player.name + "<unknown string>");
    #/
    for (var_65b695f0c0d909ed = 0; var_65b695f0c0d909ed < 11; var_65b695f0c0d909ed++) {
        lootid = player function_6196d9ea9a30e609(var_65b695f0c0d909ed);
        quantity = player function_897b29adb37f06a7(var_65b695f0c0d909ed);
        ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
        /#
            println("<unknown string>" + var_65b695f0c0d909ed + "<unknown string>" + lootid + "<unknown string>" + ref + "<unknown string>" + lootid);
            println("<unknown string>" + var_65b695f0c0d909ed + "<unknown string>" + lootid + "<unknown string>" + ref + "<unknown string>" + quantity);
        #/
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3277
// Size: 0x5c
function function_f1c7356a808e9bd9(var_cbb2b3d05e48bd27) {
    switch (var_cbb2b3d05e48bd27) {
    case #"hash_325cb2e66f67d5b9":
        return 2;
    case #"hash_511d3c24fcedcdb1":
        return 3;
    case #"hash_e534fd8ec73eafb4":
        return 4;
    case #"hash_723175e1d432ccef":
    default:
        return undefined;
        break;
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32da
// Size: 0x60
function function_56ec0560843aa9a4(player) {
    var_a0e4abf938dbe26b = player function_644ed519cac9722b(1, 5);
    if (istrue(function_59352c09a417a5e2(player, 28)) && isdefined(var_a0e4abf938dbe26b) && var_a0e4abf938dbe26b.var_fb5fdfafc29f4513 != "0") {
        return var_a0e4abf938dbe26b.quantity;
    } else {
        return function_1d6d967dbf6dfa05(player);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3341
// Size: 0x5a
function function_416ab73109b71d69(player) {
    var_a0e4abf938dbe26b = player function_644ed519cac9722b(1, 5);
    if (istrue(function_59352c09a417a5e2(player, 28)) && isdefined(var_a0e4abf938dbe26b) && var_a0e4abf938dbe26b.var_fb5fdfafc29f4513 != "0") {
        return var_a0e4abf938dbe26b.quantity;
    } else {
        return 0;
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33a2
// Size: 0x64
function function_b9e5b13d100aa0f5(player, quantity) {
    var_a0e4abf938dbe26b = player function_644ed519cac9722b(1, 5);
    if (istrue(function_59352c09a417a5e2(player, 28)) && isdefined(var_a0e4abf938dbe26b) && var_a0e4abf938dbe26b.var_fb5fdfafc29f4513 != "0") {
        player function_77eff0a02c92c9b7(var_a0e4abf938dbe26b.var_fb5fdfafc29f4513, quantity);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x340d
// Size: 0x59
function function_695fdeab4db350b4(player) {
    var_8a9d33941712cf66 = 0;
    if (istrue(function_59352c09a417a5e2(player, 28))) {
        var_8a9d33941712cf66 = 10000;
        var_4deb41b14261b5 = int(min(getUpgradeCount(player, 15), 18));
        if (isdefined(var_4deb41b14261b5)) {
            var_8a9d33941712cf66 = var_8a9d33941712cf66 + var_4deb41b14261b5 * 5000;
        }
    }
    return var_8a9d33941712cf66;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x346e
// Size: 0xbb
function function_3b61a01133ed91b0(player) {
    if (!istrue(function_59352c09a417a5e2(player, 28))) {
        return;
    }
    plundercount = 0;
    if (isdefined(player.plundercount) && player.plundercount > 0) {
        plundercount = player.plundercount;
    }
    var_8a9d33941712cf66 = function_695fdeab4db350b4(player);
    var_cf9f108239129dc2 = player function_7aee6670da372309();
    var_c899829bbfe3b823 = var_8a9d33941712cf66 - var_cf9f108239129dc2;
    if (var_c899829bbfe3b823 > 0) {
        var_ffc09fbc7f1bbbc5 = 0;
        if (var_c899829bbfe3b823 >= plundercount) {
            var_ffc09fbc7f1bbbc5 = plundercount;
        } else {
            var_ffc09fbc7f1bbbc5 = var_c899829bbfe3b823;
        }
        player function_a653645c73c1f9f8(var_ffc09fbc7f1bbbc5);
        plundercount = plundercount - var_ffc09fbc7f1bbbc5;
    }
    function_b9e5b13d100aa0f5(player, plundercount);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3530
// Size: 0x62
function function_7d760edc2a7e9b8f(player) {
    var_8a9d33941712cf66 = function_695fdeab4db350b4(player);
    var_cf9f108239129dc2 = player function_7aee6670da372309();
    if (var_cf9f108239129dc2 > var_8a9d33941712cf66) {
        player function_2fb23b36f31441c5(var_8a9d33941712cf66);
    }
    var_80d194bff78511db = function_416ab73109b71d69(player);
    if (var_80d194bff78511db > 25000) {
        function_b9e5b13d100aa0f5(player, 25000);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3599
// Size: 0x74
function function_2ab8227b96ab5d5f(player) {
    plundercount = 0;
    if (isdefined(player.plundercount) && player.plundercount > 0) {
        plundercount = player.plundercount;
    }
    if (istrue(function_59352c09a417a5e2(player, 28))) {
        function_b9e5b13d100aa0f5(player, plundercount);
    } else {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzPocketCash", plundercount);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3614
// Size: 0x28
function function_cd234cdd6b1b3699(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_1341f0ae49d492cd(player, 1);
    function_1d553b4e5df1cb3e(player);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3643
// Size: 0x21b
function function_ea65e35c77f7679b(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_623484ac7e5934a9 = [];
    player.pers["telemetry"].var_7e78e00462492360 = [];
    var_f41d7258200e1d08 = namespace_aead94004cf4c147::function_c4f1bd7a01a307fa(player);
    extractedStashItems = namespace_54d20dd0dd79277f::getteamdata(player.team, "extractedStashItems");
    for (var_65b695f0c0d909ed = 0; var_65b695f0c0d909ed < 11; var_65b695f0c0d909ed++) {
        var_65d040b6fa76f410 = player function_644ed519cac9722b(2, 1 + var_65b695f0c0d909ed);
        if (var_65d040b6fa76f410.var_fb5fdfafc29f4513 != "0") {
            var_25978461c6e4f61b = namespace_38b993c4618e76cd::getScriptableFromLootID(var_65d040b6fa76f410.lootid);
            if (isdefined(var_25978461c6e4f61b)) {
                var_a38e261031751c09 = namespace_cb965d2f71fefddc::function_a38e261031751c09(var_25978461c6e4f61b);
                player.pers["telemetry"].var_7e78e00462492360[var_65b695f0c0d909ed] = 0;
                if (!namespace_cb965d2f71fefddc::function_82d45592d750d388(var_25978461c6e4f61b) && !var_a38e261031751c09 && !var_f41d7258200e1d08) {
                    player namespace_aead94004cf4c147::function_db1dd76061352e5b(var_65b695f0c0d909ed);
                    player.pers["telemetry"].var_7e78e00462492360[var_65b695f0c0d909ed] = 1;
                } else if (var_a38e261031751c09) {
                    var_623484ac7e5934a9[var_65d040b6fa76f410.lootid] = 1;
                    var_ff239359935aa777 = player namespace_aead94004cf4c147::function_897b29adb37f06a7(var_65b695f0c0d909ed);
                    function_f605baf61d74d8df(player, var_65d040b6fa76f410, var_ff239359935aa777);
                }
            }
        }
    }
    if (var_f41d7258200e1d08) {
        function_1341f0ae49d492cd(player);
    }
    foreach (var_bcd9424dbe5be418, _ in extractedStashItems) {
        if (!istrue(var_623484ac7e5934a9[var_bcd9424dbe5be418])) {
            var_65b695f0c0d909ed = player namespace_aead94004cf4c147::getAvailableDMZBackpackIndex();
            if (isdefined(var_65b695f0c0d909ed)) {
                namespace_aead94004cf4c147::function_11f48ae5b87b4525(player, var_65b695f0c0d909ed, var_bcd9424dbe5be418, 1);
            }
        }
    }
    function_1d553b4e5df1cb3e(player);
    function_6b94748791fa241c(player);
    function_3b61a01133ed91b0(player);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3865
// Size: 0x4a
function function_f605baf61d74d8df(player, var_65d040b6fa76f410, quantity) {
    var_5170a7c15b09f348 = function_bf2fa755e8269ca8([0:3], [0:quantity], var_65d040b6fa76f410);
    if (isdefined(var_5170a7c15b09f348)) {
        function_cd81c0e152649846(player, var_65d040b6fa76f410, var_5170a7c15b09f348);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38b6
// Size: 0x182
function function_1341f0ae49d492cd(player, var_fd5de2fbc2159648, infil) {
    for (var_65b695f0c0d909ed = 0; var_65b695f0c0d909ed < 11; var_65b695f0c0d909ed++) {
        var_65d040b6fa76f410 = player function_644ed519cac9722b(2, 1 + var_65b695f0c0d909ed);
        if (var_65d040b6fa76f410.var_fb5fdfafc29f4513 != "0") {
            if (function_957f1b4b0dc253d9(var_65d040b6fa76f410.lootid, var_fd5de2fbc2159648, infil)) {
                function_52384260fe709f19(player, var_65b695f0c0d909ed);
                if (istrue(var_fd5de2fbc2159648)) {
                    method = namespace_aad14af462a74d08::function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"extract"));
                    namespace_aad14af462a74d08::function_d24138b32084fc3e(player, var_65d040b6fa76f410.lootid, undefined, method, 1, 0);
                }
            } else if (!istrue(infil)) {
                var_ff239359935aa777 = player namespace_aead94004cf4c147::function_897b29adb37f06a7(var_65b695f0c0d909ed);
                if (namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(var_65d040b6fa76f410.lootid)) {
                    var_ff239359935aa777 = namespace_85cd45b4fe0d86fb::function_20d00accaa12c27f();
                } else if (!istrue(player.extracted) && isdefined(player.var_457667014505e1f9) && isdefined(player.var_457667014505e1f9[var_65b695f0c0d909ed]) && player.var_457667014505e1f9[var_65b695f0c0d909ed]["lootID"] == var_65d040b6fa76f410.lootid) {
                    var_ff239359935aa777 = player.var_457667014505e1f9[var_65b695f0c0d909ed]["quantity"];
                    if (!isdefined(var_ff239359935aa777)) {
                        var_ff239359935aa777 = 1;
                    }
                }
                function_f605baf61d74d8df(player, var_65d040b6fa76f410, var_ff239359935aa777);
            }
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a3f
// Size: 0x54
function function_957f1b4b0dc253d9(lootid, var_fd5de2fbc2159648, infil) {
    return !istrue(var_fd5de2fbc2159648) && !(istrue(infil) && istrue(level.var_a25720e982f459fb)) && function_f6f8c1fc9549eaf6(lootid) || function_8e61ef2a2f9137e7(lootid) || function_b4893066110f4d10(lootid);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9b
// Size: 0xa1
function function_a3bbd9874f6a5599(lootid, var_fd5de2fbc2159648, infil) {
    scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    var_907944a173ed27e1 = isdefined(scriptablename) && namespace_85d036cb78063c4a::function_907944a173ed27e1(scriptablename);
    var_d8d84c04a1b3965 = isdefined(scriptablename) && (var_907944a173ed27e1 || namespace_cb965d2f71fefddc::function_3cad96c265936df7(scriptablename));
    return !istrue(var_fd5de2fbc2159648) && !(istrue(infil) && istrue(level.var_a25720e982f459fb)) && function_f6f8c1fc9549eaf6(lootid) || var_d8d84c04a1b3965 && !istrue(var_fd5de2fbc2159648) && !istrue(infil) || var_907944a173ed27e1 && istrue(var_fd5de2fbc2159648);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3b44
// Size: 0x3d
function private function_6b94748791fa241c(player) {
    if (!istrue(level.var_e442ba065dd78f24)) {
        return;
    }
    if (!isdefined(player.var_54d33ff1df87c60f)) {
        return;
    }
    function_bfedeb20f8b77f3f(player, player.var_54d33ff1df87c60f);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b88
// Size: 0xf9
function function_ed325a060adcbe65(player) {
    if (!istrue(level.var_e442ba065dd78f24)) {
        return;
    }
    foreach (weaponslot in [0:0, 1:1]) {
        weapon = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(player, weaponslot);
        if (isdefined(weapon) && weaponclass(weapon) == "sniper" && weapon hasattachment("unique_sn_alpha50_stpats")) {
            player.var_54d33ff1df87c60f = weaponslot;
            return;
        }
    }
    if (!isdefined(player.var_54d33ff1df87c60f)) {
        weapon = namespace_aead94004cf4c147::function_2985254128b1c262(player);
        if (isdefined(weapon) && weaponclass(weapon) == "sniper" && weapon hasattachment("unique_sn_alpha50_stpats")) {
            player.var_54d33ff1df87c60f = 2;
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3c88
// Size: 0xd7
function private function_181f84b6e516d4e6(var_8488a6af29de20a, prefix) {
    var_cb325ddb4a764623 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_8488a6af29de20a.lootid);
    prefix = prefix + " ID: " + var_8488a6af29de20a.lootid + " " + var_cb325ddb4a764623 + " ";
    if (isdefined(var_8488a6af29de20a.var_6cb812578f7d9ae7)) {
        foreach (childindex, var_99b9b0b10959580e in var_8488a6af29de20a.var_6cb812578f7d9ae7) {
            if (isdefined(var_99b9b0b10959580e) && var_99b9b0b10959580e != 0) {
                prefix = prefix + " Child " + childindex + ": " + var_99b9b0b10959580e + " ";
            }
        }
    }
    return prefix;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d67
// Size: 0x45
function private function_e29c498dd636939a(instance, prefix) {
    var_cb325ddb4a764623 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(instance.lootid);
    return prefix + instance.lootid + " " + var_cb325ddb4a764623;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3db4
// Size: 0x2f
function function_ddd16c8b86863b56(player) {
    operatorIndex = player getplayerdata(level.var_5d69837cf4db0407, "dmzActiveOperatorSlot");
    return operatorIndex - 100;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3deb
// Size: 0x42
function function_1d6d967dbf6dfa05(player) {
    cash = player getplayerdata(level.var_5d69837cf4db0407, "dmzPocketCash");
    player setplayerdata(level.var_5d69837cf4db0407, "dmzPocketCash", 0);
    return cash;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e35
// Size: 0x3e5
function function_c241fbc63120cfc4(player, onconnect) {
    if (!function_e0fc1230452cf4e7()) {
        return 0;
    }
    var_5864ea4e21a60cd4 = function_ef8648922f0937b9(player);
    var_5dd11d67a8ffe194 = player function_644ed519cac9722b(65535, 1);
    var_e12099eace9b6bfc = namespace_465d40bb08a5337a::function_a317055d4d0a4605(var_5864ea4e21a60cd4);
    scriptable = namespace_38b993c4618e76cd::getScriptableFromLootID(var_5dd11d67a8ffe194.lootid);
    if (var_5dd11d67a8ffe194.var_fb5fdfafc29f4513 != "0" && isdefined(scriptable) && namespace_cb965d2f71fefddc::function_b1e944a2b3e15e9d(scriptable)) {
        backpackSize = namespace_aead94004cf4c147::function_3188d9c94b3d56c2(namespace_38b993c4618e76cd::getScriptableFromLootID(var_5dd11d67a8ffe194.lootid));
        namespace_aead94004cf4c147::function_d28f52da6ede0191(player, backpackSize, undefined, var_5dd11d67a8ffe194.lootid);
    } else if (isdefined(var_5864ea4e21a60cd4) && isdefined(var_e12099eace9b6bfc)) {
        scriptable = namespace_38b993c4618e76cd::getScriptableFromLootID(var_e12099eace9b6bfc);
        /#
            assert(namespace_cb965d2f71fefddc::function_b1e944a2b3e15e9d(scriptable));
        #/
        function_92d947129ea5ba6e(player, var_e12099eace9b6bfc);
        backpackSize = namespace_aead94004cf4c147::function_3188d9c94b3d56c2(scriptable);
        namespace_aead94004cf4c147::function_d28f52da6ede0191(player, backpackSize, undefined, var_e12099eace9b6bfc);
    } else {
        namespace_aead94004cf4c147::function_d28f52da6ede0191(player, 5);
    }
    var_6267a5ad12c5e4d4 = player function_644ed519cac9722b(2, 0);
    var_5577636292591c8b = namespace_38b993c4618e76cd::function_282cf83c9eeda744(var_6267a5ad12c5e4d4.lootid);
    if (var_6267a5ad12c5e4d4.var_fb5fdfafc29f4513 != "0" && var_6267a5ad12c5e4d4.lootid > 0) {
        var_b3723cf04dcd3fb8 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(namespace_aead94004cf4c147::function_102abd6883c5f9bf(player));
        var_6d77d0560b815b93 = namespace_aead94004cf4c147::function_18e2d7a6912b1d07(var_b3723cf04dcd3fb8);
        if (isdefined(var_5577636292591c8b) && var_5577636292591c8b == "weapon" && var_6d77d0560b815b93) {
            function_a839b9ad5740477d(player, 2, 0, onconnect);
        } else {
            function_f910b139e75fd559(player);
        }
    }
    var_dc62a204e1921a99 = player function_644ed519cac9722b(65535, 4);
    if (var_dc62a204e1921a99.var_fb5fdfafc29f4513 != "0") {
        scriptable = namespace_38b993c4618e76cd::getScriptableFromLootID(var_dc62a204e1921a99.lootid);
        if (isdefined(scriptable) && namespace_cb965d2f71fefddc::isgasmask(scriptable)) {
            player namespace_9c6cddd872ad75f7::init(undefined, scriptable);
        } else {
            function_777c89585478357b(player);
        }
    } else if (isdefined(var_5864ea4e21a60cd4)) {
        var_7c64a9a794249d9f = namespace_465d40bb08a5337a::function_8d92d3fb88a9d34(var_5864ea4e21a60cd4);
        if (isdefined(var_7c64a9a794249d9f)) {
            scriptable = namespace_38b993c4618e76cd::getScriptableFromLootID(var_7c64a9a794249d9f);
            /#
                assert(namespace_cb965d2f71fefddc::isgasmask(scriptable));
            #/
            function_826c883f14e827b3(player, var_7c64a9a794249d9f);
            player namespace_9c6cddd872ad75f7::init(undefined, scriptable);
        }
    }
    var_ea074533d9558d3d = player function_644ed519cac9722b(65535, 3);
    scriptable = namespace_38b993c4618e76cd::getScriptableFromLootID(var_ea074533d9558d3d.lootid);
    var_a96a2ab9bf3042d5 = undefined;
    if (isdefined(var_5864ea4e21a60cd4)) {
        var_a96a2ab9bf3042d5 = namespace_465d40bb08a5337a::function_a3195a1d60bb2d90(var_5864ea4e21a60cd4);
    }
    if (var_ea074533d9558d3d.var_fb5fdfafc29f4513 != "0" && isdefined(scriptable) && namespace_cb965d2f71fefddc::isrevivepickup(scriptable)) {
        player namespace_cb965d2f71fefddc::function_aaaa1b3dfe18885c(1, var_ea074533d9558d3d.lootid);
    } else if (isdefined(var_a96a2ab9bf3042d5)) {
        /#
            assert(namespace_cb965d2f71fefddc::isrevivepickup(namespace_38b993c4618e76cd::getScriptableFromLootID(var_a96a2ab9bf3042d5)));
        #/
        function_c0ae57d4dc3a8eef(player, var_a96a2ab9bf3042d5);
        player namespace_cb965d2f71fefddc::function_aaaa1b3dfe18885c(1, var_a96a2ab9bf3042d5);
    }
    var_928d2239ab126d72 = player function_644ed519cac9722b(65535, 5);
    var_ee3ed078f6741ede = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_928d2239ab126d72.lootid);
    if (var_928d2239ab126d72.var_fb5fdfafc29f4513 != "0" && isdefined(var_ee3ed078f6741ede) && var_ee3ed078f6741ede == "dmz_exfil_streak") {
        namespace_d696adde758cbe79::function_470b4aaafd986a0d(player);
    } else {
        player namespace_d696adde758cbe79::function_1a425272955d5f75();
    }
    namespace_a38a2e1fe7519183::function_1341f0ae49d492cd(player, 0, 1);
    function_8d65122ea2e88ecd(player);
    function_db31af9bfc65ea51(player);
    return 1;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4222
// Size: 0xdb
function function_fc56050bd3dcea6c(player) {
    if (!function_e0fc1230452cf4e7()) {
        return 0;
    }
    var_ea074533d9558d3d = player function_644ed519cac9722b(65535, 3);
    var_a96a2ab9bf3042d5 = undefined;
    var_5864ea4e21a60cd4 = function_ef8648922f0937b9(player);
    if (isdefined(var_5864ea4e21a60cd4)) {
        var_a96a2ab9bf3042d5 = namespace_465d40bb08a5337a::function_a3195a1d60bb2d90(var_5864ea4e21a60cd4);
    }
    if (var_ea074533d9558d3d.var_fb5fdfafc29f4513 == "0" && !isdefined(var_a96a2ab9bf3042d5) && isdefined(player.team)) {
        if (function_59352c09a417a5e2(player, 30)) {
            teamplayers = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
            if (isdefined(teamplayers) && teamplayers.size == 1) {
                function_c0ae57d4dc3a8eef(player, namespace_38b993c4618e76cd::getLootIDFromRef("brloot_self_revive"));
                player namespace_cb965d2f71fefddc::function_aaaa1b3dfe18885c(1);
            }
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4304
// Size: 0x53
function function_a9857977596563cd(player, var_ac505d7dee638bdf) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    function_53d2be04710104ca(player, function_b41e38c8836a823e(player, 0), var_ac505d7dee638bdf);
    function_53d2be04710104ca(player, function_b41e38c8836a823e(player, 1), var_ac505d7dee638bdf);
    function_53d2be04710104ca(player, function_b41e38c8836a823e(player, 2), var_ac505d7dee638bdf);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x435e
// Size: 0x7f
function function_53d2be04710104ca(player, instance, var_ac505d7dee638bdf) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_79bf9868c4b11727 = int(function_53c4c53197386572(instance.var_b34159f22f6379c9, 0));
    if (var_79bf9868c4b11727 <= getsystemtime()) {
        return;
    }
    var_963b1b6e92e4db70 = int(max(var_79bf9868c4b11727 - var_ac505d7dee638bdf, 0));
    player function_4e8d00b0ee5d3bbb(instance.var_fb5fdfafc29f4513, var_963b1b6e92e4db70);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x43e4
// Size: 0xb2
function private function_b45a3c813eaaa08d(player, instance) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_79bf9868c4b11727 = function_3a8d97d9e7d9e535(player, instance);
    if (var_79bf9868c4b11727 > getsystemtime()) {
        return;
    }
    var_963b1b6e92e4db70 = function_319dc9ed3b41647();
    if (getdvarint(@"hash_6dc2f0452c76707d", 1) || getdvarint(@"hash_257cb72a99900ef2", 1)) {
        var_963b1b6e92e4db70 = function_809d965739629dbf(player, instance);
    }
    var_963b1b6e92e4db70 = getsystemtime() + var_963b1b6e92e4db70;
    var_b0bee880705ae6be = function_869526aec2165ec3(player, instance);
    player function_4e8d00b0ee5d3bbb(var_b0bee880705ae6be.var_fb5fdfafc29f4513, int(var_963b1b6e92e4db70));
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x449d
// Size: 0x1d
function function_b41e38c8836a823e(player, index) {
    return player function_644ed519cac9722b(5, index);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44c2
// Size: 0xae
function function_869526aec2165ec3(player, instance) {
    if (!isdefined(instance) || !isdefined(player) || !isdefined(instance.var_d3c548c09bb62da2)) {
        return 0;
    }
    foreach (data in instance.var_d3c548c09bb62da2) {
        if (data.key == 15) {
            return player function_644ed519cac9722b(5, int(data.value) - 1);
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4577
// Size: 0x39
function function_3a8d97d9e7d9e535(player, instance) {
    var_b0bee880705ae6be = function_869526aec2165ec3(player, instance);
    return function_53c4c53197386572(var_b0bee880705ae6be.var_b34159f22f6379c9, 0);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b8
// Size: 0x138
function function_809d965739629dbf(player, instance) {
    if (!isdefined(instance) || !isdefined(player) || !isdefined(instance.var_d3c548c09bb62da2)) {
        return 0;
    }
    var_85166da84e55de25 = function_423648b9c03fdaa1(15, instance, 1);
    if (!isdefined(var_85166da84e55de25)) {
        return function_319dc9ed3b41647();
    }
    var_9e007ec32f9c5194 = function_f1aa77738031b49c(instance);
    if (var_9e007ec32f9c5194 > 0) {
        return var_9e007ec32f9c5194;
    }
    if (!getdvarint(@"hash_6dc2f0452c76707d", 1)) {
        return function_319dc9ed3b41647();
    }
    var_fe3513edecdec855 = undefined;
    switch (var_85166da84e55de25) {
    case #"hash_31100fbc01bd387c":
        var_fe3513edecdec855 = getdvarint(@"hash_618c3ca8c4897d2c", 7200);
        break;
    case #"hash_311012bc01bd3d35":
        var_fe3513edecdec855 = getdvarint(@"hash_618c3fa8c48983c5", 14400);
        break;
    case #"hash_311011bc01bd3ba2":
        var_fe3513edecdec855 = getdvarint(@"hash_618c3ea8c4898192", 21600);
        break;
    default:
        var_fe3513edecdec855 = function_319dc9ed3b41647();
        break;
    }
    var_45b8f5c6792a74f2 = function_1ee6a57e88b1a120(player, var_85166da84e55de25);
    return max(0, var_fe3513edecdec855 - var_fe3513edecdec855 * var_45b8f5c6792a74f2);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46f8
// Size: 0x93
function function_f1aa77738031b49c(instance) {
    if (!isdefined(instance.lootid) || instance.lootid == 0) {
        return 0;
    }
    ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(instance.lootid);
    if (!isdefined(ref)) {
        return 0;
    }
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(ref);
    variantid = function_64ccc54bdbae5cf6(instance.lootid);
    cooldown = namespace_e0ee43ef2dddadaa::function_115404a4dbd59830(rootname, variantid);
    return cooldown;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4793
// Size: 0x79
function function_80478f2ef8c8882f(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    for (i = 0; i < 3; i++) {
        instance = function_b41e38c8836a823e(player, i);
        if (!isdefined(instance)) {
            continue;
        }
        var_79bf9868c4b11727 = int(function_53c4c53197386572(instance.var_b34159f22f6379c9, 0));
        if (var_79bf9868c4b11727 > getsystemtime()) {
            return 1;
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4813
// Size: 0xa8
function function_498ba9b391e5d087(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    if (!istrue(function_80478f2ef8c8882f(player))) {
        return;
    }
    var_5fb1bb78299865ee = undefined;
    for (i = 0; i < 3; i++) {
        instance = function_b41e38c8836a823e(player, i);
        if (!isdefined(instance)) {
            continue;
        }
        var_79bf9868c4b11727 = int(function_53c4c53197386572(instance.var_b34159f22f6379c9, 0));
        if (var_79bf9868c4b11727 > getsystemtime()) {
            if (!isdefined(var_5fb1bb78299865ee)) {
                var_5fb1bb78299865ee = var_79bf9868c4b11727;
            } else {
                var_5fb1bb78299865ee = int(min(var_5fb1bb78299865ee, var_79bf9868c4b11727));
            }
        }
    }
    return var_5fb1bb78299865ee;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48c3
// Size: 0x14
function function_319dc9ed3b41647() {
    return getdvarint(@"hash_40eb514e313dd3ef", 14400);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48df
// Size: 0x14
function function_4e92b2a9e565aee() {
    return getdvarint(@"hash_c5ac098e3a15af33", 3000);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48fb
// Size: 0xd7
function function_4feddb036ae52e8(player) {
    var_9c8064e9c57c2ece = [];
    var_6267a5ad12c5e4d4 = player function_644ed519cac9722b(2, 0);
    if (var_6267a5ad12c5e4d4.var_fb5fdfafc29f4513 != "0" && var_6267a5ad12c5e4d4.lootid != 0) {
        var_9c8064e9c57c2ece[var_9c8064e9c57c2ece.size] = var_6267a5ad12c5e4d4;
    }
    var_de79dbea8c4f970e = player function_644ed519cac9722b(1, 0);
    if (var_de79dbea8c4f970e.var_fb5fdfafc29f4513 != "0" && var_de79dbea8c4f970e.lootid != 0) {
        var_9c8064e9c57c2ece[var_9c8064e9c57c2ece.size] = var_de79dbea8c4f970e;
    }
    var_6585928b9413484e = player function_644ed519cac9722b(1, 1);
    if (var_6585928b9413484e.var_fb5fdfafc29f4513 != "0" && var_6585928b9413484e.lootid != 0) {
        var_9c8064e9c57c2ece[var_9c8064e9c57c2ece.size] = var_6585928b9413484e;
    }
    return var_9c8064e9c57c2ece;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49da
// Size: 0xa6
function function_5148f855de907e6f(player, weaponslot) {
    if (!function_e0fc1230452cf4e7()) {
        return undefined;
    }
    var_8488a6af29de20a = function_540c2b6342f4e28c(player, weaponslot);
    foreach (instance in player.var_b1bf418aa7242c1d) {
        var_609578472524b507 = undefined;
        if (function_e7fcc338bf1ccf24(instance, var_8488a6af29de20a)) {
            return function_423648b9c03fdaa1(15, var_8488a6af29de20a, 1);
        }
    }
    return undefined;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a88
// Size: 0x11a
function function_1d553b4e5df1cb3e(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    if (!isdefined(player.var_b1bf418aa7242c1d)) {
        return;
    }
    var_9c8064e9c57c2ece = function_4feddb036ae52e8(player);
    foreach (instance in player.var_b1bf418aa7242c1d) {
        var_609578472524b507 = undefined;
        foreach (var_ea21a6b912d4bcb9 in var_9c8064e9c57c2ece) {
            if (function_e7fcc338bf1ccf24(instance, var_ea21a6b912d4bcb9)) {
                var_609578472524b507 = var_ea21a6b912d4bcb9;
                break;
            }
        }
        if (!isdefined(var_609578472524b507)) {
            function_b45a3c813eaaa08d(player, instance);
        } else if (var_609578472524b507.var_207098e76bcac40f != 14) {
            function_814f4e5c852d9604(player, var_609578472524b507);
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ba9
// Size: 0xf8
function function_814f4e5c852d9604(player, instance) {
    player function_dd5661ebe3c9a5a2(instance.var_fb5fdfafc29f4513);
    player function_4f1027e74d5073c4(instance.lootid, 14, instance.location, instance.var_fb6bafb61d5c3d4a, instance.var_6cb812578f7d9ae7);
    var_2ba777e4c43a10f5 = player function_644ed519cac9722b(instance.location, instance.var_fb6bafb61d5c3d4a);
    if (isdefined(instance.metadata)) {
        var_5170a7c15b09f348 = function_fe92418620d93763(instance.metadata);
        player function_e70c1fc3c2e5e05f(var_2ba777e4c43a10f5.var_fb5fdfafc29f4513, 0, var_5170a7c15b09f348);
    }
    if (isdefined(instance.var_d3c548c09bb62da2)) {
        var_5170a7c15b09f348 = function_fe92418620d93763(instance.var_d3c548c09bb62da2);
        player function_e70c1fc3c2e5e05f(var_2ba777e4c43a10f5.var_fb5fdfafc29f4513, 1, var_5170a7c15b09f348);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ca8
// Size: 0x7e
function function_2286bf57aede9518(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    if (!isdefined(player.var_b1bf418aa7242c1d)) {
        return;
    }
    foreach (instance in player.var_b1bf418aa7242c1d) {
        function_b45a3c813eaaa08d(player, instance);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d2d
// Size: 0x52
function function_cd81c0e152649846(player, instance, metadata, var_d3c548c09bb62da2) {
    player function_e70c1fc3c2e5e05f(instance.var_fb5fdfafc29f4513, 0, metadata);
    if (isdefined(var_d3c548c09bb62da2)) {
        player function_e70c1fc3c2e5e05f(instance.var_fb5fdfafc29f4513, 1, var_d3c548c09bb62da2);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d86
// Size: 0xba
function function_4a84e57f6373e69(key, metadata, var_7f24f2a49f4715f7) {
    if (isdefined(metadata)) {
        foreach (data in metadata) {
            if (key == data.key) {
                if (istrue(var_7f24f2a49f4715f7)) {
                    return [0:data.value, 1:data.var_64c2ffaa2c43ce24, 2:data.var_355199fd29c935e];
                } else {
                    return data.value;
                }
            }
        }
    }
    return undefined;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e48
// Size: 0x63
function function_423648b9c03fdaa1(key, instance, var_d3c548c09bb62da2, var_7f24f2a49f4715f7) {
    if (!isdefined(key) || !isdefined(instance)) {
        return undefined;
    }
    metadata = instance.metadata;
    if (istrue(var_d3c548c09bb62da2)) {
        metadata = instance.var_d3c548c09bb62da2;
    }
    return function_4a84e57f6373e69(key, metadata, var_7f24f2a49f4715f7);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb3
// Size: 0x7f
function function_92f14840aa31925d(key, value, metadata) {
    foreach (data in metadata) {
        if (key == data.key) {
            data.value = value;
        }
    }
    return metadata;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f3a
// Size: 0x8d
function private function_e7fcc338bf1ccf24(var_d01b7a8ebe9fe5c9, var_ea21a6b912d4bcb9) {
    var_cf86f085f815a526 = function_423648b9c03fdaa1(1, var_d01b7a8ebe9fe5c9);
    var_e51271b38c67dfc6 = function_423648b9c03fdaa1(1, var_ea21a6b912d4bcb9);
    if (!isdefined(var_cf86f085f815a526) || !isdefined(var_e51271b38c67dfc6)) {
        return 0;
    }
    if (var_cf86f085f815a526 == var_e51271b38c67dfc6) {
        var_f4d447ffd61bcf2 = function_423648b9c03fdaa1(15, var_d01b7a8ebe9fe5c9, 1);
        var_b8250a3b219f951a = function_423648b9c03fdaa1(15, var_ea21a6b912d4bcb9, 1);
        return (isdefined(var_f4d447ffd61bcf2) && isdefined(var_b8250a3b219f951a) && var_f4d447ffd61bcf2 == var_b8250a3b219f951a);
    }
    return 0;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4fcf
// Size: 0x58
function private function_c60ad978e8ec0345(player, location, var_fb6bafb61d5c3d4a) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    instance = player function_644ed519cac9722b(location, var_fb6bafb61d5c3d4a);
    return [0:instance.metadata, 1:instance.var_d3c548c09bb62da2];
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x502f
// Size: 0x35
function private function_cd4840758c0f2125(instance) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    return [0:instance.metadata, 1:instance.var_d3c548c09bb62da2];
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x506c
// Size: 0x4f
function function_74031e3249a6f69e(player, slot) {
    if (!function_e0fc1230452cf4e7()) {
        return undefined;
    }
    location = 1;
    var_fb6bafb61d5c3d4a = slot;
    if (slot == 2) {
        location = 2;
        var_fb6bafb61d5c3d4a = 0;
    }
    return function_c60ad978e8ec0345(player, location, var_fb6bafb61d5c3d4a);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50c3
// Size: 0x106
function function_743a2b4d08f023d2(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_2ac478345313402 = player function_644ed519cac9722b(65535, 2);
    var_5864ea4e21a60cd4 = function_ef8648922f0937b9(player);
    var_3fc34ca532242bea = namespace_465d40bb08a5337a::function_81360519d4836bf7(var_5864ea4e21a60cd4);
    var_347aa4935f42810 = namespace_38b993c4618e76cd::getScriptableFromLootID(var_2ac478345313402.lootid);
    if (var_2ac478345313402.var_fb5fdfafc29f4513 != "0" && namespace_d3d40f75bb4e4c32::function_4aa12e0ed3f6b745(var_347aa4935f42810)) {
        var_e9cfd120b0b43ef = namespace_cb965d2f71fefddc::function_e98a5a4e0e001ac3(player, var_347aa4935f42810, 1);
    } else if (isdefined(var_5864ea4e21a60cd4) && isdefined(var_3fc34ca532242bea)) {
        scriptable = namespace_38b993c4618e76cd::getScriptableFromLootID(var_2ac478345313402.lootid);
        /#
            assert(namespace_d3d40f75bb4e4c32::function_4aa12e0ed3f6b745(scriptable));
        #/
        function_bd01c77ab46f790(player, var_3fc34ca532242bea);
        var_e9cfd120b0b43ef = namespace_cb965d2f71fefddc::function_e98a5a4e0e001ac3(player, namespace_38b993c4618e76cd::getScriptableFromLootID(var_3fc34ca532242bea), 1);
    } else {
        namespace_cb965d2f71fefddc::function_a0877dfcb342653a(player);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51d0
// Size: 0x193
function function_c0cc833a07b24cd8(player, instance, var_6537d9855fb64bf9, var_fd52a3922167ea1, var_11b87ef3f5ccbc5e) {
    lootid = namespace_3bbb5a98b932c46f::function_7a91162092cc11ec(instance.lootid);
    if (!isdefined(lootid) || lootid == 0) {
        return [0:var_fd52a3922167ea1, 1:var_6537d9855fb64bf9];
    }
    if (!isdefined(var_11b87ef3f5ccbc5e[lootid])) {
        var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_6537d9855fb64bf9;
        var_fd52a3922167ea1[var_fd52a3922167ea1.size] = lootid;
        var_11b87ef3f5ccbc5e[lootid] = 1;
        var_6537d9855fb64bf9 = var_6537d9855fb64bf9 + 1;
    }
    var_93b3002ebef628b = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(var_93b3002ebef628b);
    assetname = namespace_e0ee43ef2dddadaa::function_72376783a92be46(rootname);
    attachments = function_6527364c1ecca6c6(assetname);
    foreach (attachment in attachments) {
        var_3b55819c1ebec007 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_3c2c9813bb16552f", attachment));
        if (isdefined(var_3b55819c1ebec007)) {
            var_4f13b964ab82fe13 = var_3b55819c1ebec007.lootid;
        }
        if (!isdefined(var_4f13b964ab82fe13)) {
            continue;
        }
        if (!isdefined(var_11b87ef3f5ccbc5e[var_4f13b964ab82fe13])) {
            var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_6537d9855fb64bf9;
            var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_4f13b964ab82fe13;
            var_11b87ef3f5ccbc5e[var_4f13b964ab82fe13] = 1;
            var_6537d9855fb64bf9 = var_6537d9855fb64bf9 + 1;
        }
    }
    return [0:var_fd52a3922167ea1, 1:var_6537d9855fb64bf9, 2:var_11b87ef3f5ccbc5e];
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x536b
// Size: 0x344
function function_2495dd1dde4756fb(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_b103a36a0ed8b293";
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    var_fd52a3922167ea1 = [];
    var_11b87ef3f5ccbc5e = [];
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version");
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = 1;
    var_6be6ee2c96b9685d = function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id");
    var_21341c7142d7e704 = var_6be6ee2c96b9685d;
    var_333f404612f8d562 = player function_644ed519cac9722b(1, 0);
    var_bffcb26249870cb0 = function_c0cc833a07b24cd8(player, var_333f404612f8d562, var_21341c7142d7e704, var_fd52a3922167ea1, var_11b87ef3f5ccbc5e);
    var_11b87ef3f5ccbc5e = var_bffcb26249870cb0[2];
    var_21341c7142d7e704 = var_bffcb26249870cb0[1];
    var_fd52a3922167ea1 = var_bffcb26249870cb0[0];
    var_20debc67d125a6a2 = player function_644ed519cac9722b(1, 1);
    var_bffcb36249870ee3 = function_c0cc833a07b24cd8(player, var_20debc67d125a6a2, var_21341c7142d7e704, var_fd52a3922167ea1, var_11b87ef3f5ccbc5e);
    var_11b87ef3f5ccbc5e = var_bffcb36249870ee3[2];
    var_21341c7142d7e704 = var_bffcb36249870ee3[1];
    var_fd52a3922167ea1 = var_bffcb36249870ee3[0];
    var_6267a5ad12c5e4d4 = player function_644ed519cac9722b(2, 0);
    var_c0014062498c3ad1 = function_c0cc833a07b24cd8(player, var_6267a5ad12c5e4d4, var_21341c7142d7e704, var_fd52a3922167ea1, var_11b87ef3f5ccbc5e);
    var_11b87ef3f5ccbc5e = var_c0014062498c3ad1[2];
    var_21341c7142d7e704 = var_c0014062498c3ad1[1];
    var_fd52a3922167ea1 = var_c0014062498c3ad1[0];
    var_b2721cf177f915e4 = player function_644ed519cac9722b(1, 2);
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_21341c7142d7e704;
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_b2721cf177f915e4.lootid;
    var_11b87ef3f5ccbc5e[var_b2721cf177f915e4.lootid] = 1;
    var_21341c7142d7e704++;
    var_2230de25f8635c83 = player function_644ed519cac9722b(1, 3);
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_21341c7142d7e704;
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_2230de25f8635c83.lootid;
    var_11b87ef3f5ccbc5e[var_2230de25f8635c83.lootid] = 1;
    var_21341c7142d7e704++;
    var_bed94c5e8ba6c57e = player function_644ed519cac9722b(1, 4);
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_21341c7142d7e704;
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_bed94c5e8ba6c57e.lootid;
    var_11b87ef3f5ccbc5e[var_bed94c5e8ba6c57e.lootid] = 1;
    var_21341c7142d7e704++;
    var_8862c20cffb85370 = player function_644ed519cac9722b(65535, 0);
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_21341c7142d7e704;
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_8862c20cffb85370.lootid;
    var_11b87ef3f5ccbc5e[var_8862c20cffb85370.lootid] = 1;
    var_21341c7142d7e704++;
    for (var_65b695f0c0d909ed = 1; var_65b695f0c0d909ed <= 12; var_65b695f0c0d909ed++) {
        var_5dd11d67a8ffe194 = player function_644ed519cac9722b(2, var_65b695f0c0d909ed);
        if (!isdefined(var_11b87ef3f5ccbc5e[var_5dd11d67a8ffe194.lootid])) {
            var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_21341c7142d7e704;
            var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_5dd11d67a8ffe194.lootid;
            var_11b87ef3f5ccbc5e[var_5dd11d67a8ffe194.lootid] = 1;
            var_21341c7142d7e704++;
        }
    }
    var_23d99faf8c73c = var_21341c7142d7e704 - function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id");
    /#
        assertmsg(var_23d99faf8c73c <= 49, "The total unlocked items count of " + var_23d99faf8c73c + " is greater then the supported max of " + 49 + ". This most likely means that a weapon has more default attachments than the expected max of nine.");
    #/
    if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
        player function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, var_fd52a3922167ea1);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56b6
// Size: 0xa3
function function_ef552df845e8b952(player) {
    if (function_6484ce4430c9439b(player, 0)) {
        function_dc67872cc4cfae72(player, 1, 0);
    }
    if (function_6484ce4430c9439b(player, 1)) {
        function_dc67872cc4cfae72(player, 1, 1);
    }
    function_f910b139e75fd559(player);
    function_351fe4ac57ca37e5(player, "primary");
    function_351fe4ac57ca37e5(player, "secondary");
    function_351fe4ac57ca37e5(player, "super");
    function_28550536ebafe216(player);
    function_777c89585478357b(player);
    function_a60428cda4724a7(player);
    function_5b7dc44bb66553a6(player);
    function_ea96b27797c7e268(player);
    if (!namespace_aead94004cf4c147::function_c4f1bd7a01a307fa(player)) {
        function_f30f21d87c483297(player);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5760
// Size: 0x15b
function function_e8b12ce137e718cd(player) {
    if (!isdefined(player.var_81d789409ada6941)) {
        return;
    }
    if (isdefined(player.var_81d789409ada6941[2])) {
        var_1189bd7fbe2861f8 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(player.var_81d789409ada6941[2]);
        isselectable = namespace_1a507865f681850e::isequipmentselectable(var_1189bd7fbe2861f8);
        if (istrue(isselectable)) {
            player function_4f1027e74d5073c4(player.var_81d789409ada6941[2], 13, 1, 2, []);
        }
    }
    if (isdefined(player.var_81d789409ada6941[3])) {
        var_1189bd7fbe2861f8 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(player.var_81d789409ada6941[3]);
        isselectable = namespace_1a507865f681850e::isequipmentselectable(var_1189bd7fbe2861f8);
        if (istrue(isselectable)) {
            player function_4f1027e74d5073c4(player.var_81d789409ada6941[3], 13, 1, 3, []);
        }
    }
    if (isdefined(player.var_81d789409ada6941[4])) {
        var_ebec497ff8b18a45 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(player.var_81d789409ada6941[4]);
        var_94deac09d462d41e = namespace_85d036cb78063c4a::function_5cc7d8c432d5d6c1(var_ebec497ff8b18a45);
        var_41f94bca374ed58a = namespace_85d036cb78063c4a::function_c519ae03535afe0f(var_ebec497ff8b18a45);
        if (!istrue(var_94deac09d462d41e) || isdefined(var_41f94bca374ed58a) && function_59352c09a417a5e2(player, var_41f94bca374ed58a)) {
            player function_4f1027e74d5073c4(player.var_81d789409ada6941[4], 13, 1, 4, []);
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58c2
// Size: 0x25
function function_868b6d4fbec3938c(player) {
    function_c1bb256c7473f345(player);
    function_b9e5b13d100aa0f5(player, 0);
    function_e8b12ce137e718cd(player);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58ee
// Size: 0xaf
function function_c1bb256c7473f345(player) {
    function_2286bf57aede9518(player);
    function_dc67872cc4cfae72(player, 1, 0);
    function_dc67872cc4cfae72(player, 1, 1);
    function_f910b139e75fd559(player);
    function_351fe4ac57ca37e5(player, "primary");
    function_351fe4ac57ca37e5(player, "secondary");
    function_351fe4ac57ca37e5(player, "super");
    function_28550536ebafe216(player);
    function_777c89585478357b(player);
    function_a60428cda4724a7(player);
    function_5b7dc44bb66553a6(player);
    function_ea96b27797c7e268(player);
    function_7bc70fc1dd299f89(player);
    function_80ff109723716c07(player);
    if (!namespace_aead94004cf4c147::function_c4f1bd7a01a307fa(player)) {
        function_f30f21d87c483297(player);
    } else {
        function_1341f0ae49d492cd(player);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59a4
// Size: 0x38
function function_f30f21d87c483297(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    for (var_65b695f0c0d909ed = 0; var_65b695f0c0d909ed < 11; var_65b695f0c0d909ed++) {
        function_52384260fe709f19(player, var_65b695f0c0d909ed);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59e3
// Size: 0x1d
function function_b05e71b6d3d2256f(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    player function_78ec884c707a6adc();
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a07
// Size: 0xae
function function_4b57e9867785e738(player) {
    if (!function_e0fc1230452cf4e7() || !istrue(inventoryIsValid(player))) {
        return 0;
    }
    for (var_a7c9e7c67496899e = 0; var_a7c9e7c67496899e <= 1; var_a7c9e7c67496899e++) {
        var_8488a6af29de20a = player function_644ed519cac9722b(1, var_a7c9e7c67496899e);
        if (isdefined(var_8488a6af29de20a.var_207098e76bcac40f) && var_8488a6af29de20a.var_207098e76bcac40f == 14) {
            return 1;
        }
    }
    var_6267a5ad12c5e4d4 = player function_644ed519cac9722b(2, 0);
    if (isdefined(var_6267a5ad12c5e4d4.var_207098e76bcac40f) && var_6267a5ad12c5e4d4.var_207098e76bcac40f == 14) {
        return 1;
    }
    return 0;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5abd
// Size: 0xa1
function function_4d95079ff587fdb9(player) {
    if (!function_e0fc1230452cf4e7()) {
        return 0;
    }
    for (var_a7c9e7c67496899e = 0; var_a7c9e7c67496899e <= 1; var_a7c9e7c67496899e++) {
        var_8488a6af29de20a = player function_644ed519cac9722b(1, var_a7c9e7c67496899e);
        if (isdefined(var_8488a6af29de20a.var_207098e76bcac40f) && var_8488a6af29de20a.var_207098e76bcac40f == 11) {
            return 1;
        }
    }
    var_6267a5ad12c5e4d4 = player function_644ed519cac9722b(2, 0);
    if (isdefined(var_6267a5ad12c5e4d4.var_207098e76bcac40f) && var_6267a5ad12c5e4d4.var_207098e76bcac40f == 11) {
        return 1;
    }
    return 0;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b66
// Size: 0x51
function function_7bc089fe8fde43c7(player, weaponslot) {
    var_8488a6af29de20a = function_540c2b6342f4e28c(player, weaponslot);
    if (isdefined(var_8488a6af29de20a)) {
        if (isdefined(var_8488a6af29de20a.var_207098e76bcac40f) && var_8488a6af29de20a.var_207098e76bcac40f == 11) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5bbf
// Size: 0x30e
function function_e64d9a42c66018c9(player) {
    /#
        if (!istrue(inventoryIsValid(player))) {
            return;
        }
        var_333f404612f8d562 = player function_644ed519cac9722b(1, 0);
        var_c094db262ce4dfa0 = "<unknown string>";
        println(function_181f84b6e516d4e6(var_333f404612f8d562, var_c094db262ce4dfa0));
        var_20debc67d125a6a2 = player function_644ed519cac9722b(1, 1);
        var_c094db262ce4dfa0 = "<unknown string>";
        println(function_181f84b6e516d4e6(var_20debc67d125a6a2, var_c094db262ce4dfa0));
        var_6267a5ad12c5e4d4 = player function_644ed519cac9722b(2, 0);
        var_c094db262ce4dfa0 = "<unknown string>";
        println(function_181f84b6e516d4e6(var_6267a5ad12c5e4d4, var_c094db262ce4dfa0));
        var_b2721cf177f915e4 = player function_644ed519cac9722b(1, 2);
        println("<unknown string>" + var_b2721cf177f915e4.lootid);
        var_2230de25f8635c83 = player function_644ed519cac9722b(1, 3);
        println("<unknown string>" + var_2230de25f8635c83.lootid);
        var_bed94c5e8ba6c57e = player function_644ed519cac9722b(1, 4);
        println("<unknown string>" + var_bed94c5e8ba6c57e.lootid);
        var_8862c20cffb85370 = player function_644ed519cac9722b(65535, 0);
        println("<unknown string>" + var_8862c20cffb85370.lootid);
        var_dc62a204e1921a99 = player function_644ed519cac9722b(65535, 4);
        println("<unknown string>" + var_dc62a204e1921a99.lootid);
        var_5dd11d67a8ffe194 = player function_644ed519cac9722b(65535, 1);
        println("<unknown string>" + var_5dd11d67a8ffe194.lootid);
        var_ea074533d9558d3d = player function_644ed519cac9722b(65535, 3);
        println("<unknown string>" + var_ea074533d9558d3d.lootid);
        var_50b1b73063d6e846 = player function_644ed519cac9722b(1, 12);
        println("<unknown string>" + var_50b1b73063d6e846.lootid);
        var_c8bbed73f0438ec8 = player function_644ed519cac9722b(1, 13);
        println("<unknown string>" + var_c8bbed73f0438ec8.lootid);
        var_9cdf915529700821 = player function_644ed519cac9722b(1, 14);
        println("<unknown string>" + var_9cdf915529700821.lootid);
        var_a4462a64012f11a5 = player function_644ed519cac9722b(1, 15);
        println("<unknown string>" + var_a4462a64012f11a5.lootid);
        var_78ae3551b1d877da = player function_644ed519cac9722b(1, 16);
        println("<unknown string>" + var_78ae3551b1d877da.lootid);
        for (var_65b695f0c0d909ed = 1; var_65b695f0c0d909ed <= 12; var_65b695f0c0d909ed++) {
            var_5dd11d67a8ffe194 = player function_644ed519cac9722b(2, var_65b695f0c0d909ed);
            println("<unknown string>" + var_65b695f0c0d909ed + "<unknown string>" + var_5dd11d67a8ffe194.lootid);
        }
    #/
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ed4
// Size: 0x5c
function function_540204218b5dd9da(player) {
    var_1580961b4a92675c = 7;
    player.var_6f7281f031b30320 = [];
    for (i = 0; i <= var_1580961b4a92675c; i++) {
        player.var_6f7281f031b30320[i] = createfontstring("default", 0.8);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f37
// Size: 0x5e6
function function_c563bbc48f1dd3d2(player) {
    if (!istrue(inventoryIsValid(player))) {
        return;
    }
    while (1) {
        if (!isdefined(player.var_6f7281f031b30320)) {
            function_540204218b5dd9da(player);
        }
        var_333f404612f8d562 = player function_644ed519cac9722b(1, 0);
        /#
            player.var_6f7281f031b30320[0] setdevtext(function_181f84b6e516d4e6(var_333f404612f8d562, "<unknown string>"));
        #/
        player.var_6f7281f031b30320[0] setpoint("TOPLEFT", "TOPLEFT", 250, 30);
        player.var_6f7281f031b30320[0] clearalltextafterhudelem();
        var_20debc67d125a6a2 = player function_644ed519cac9722b(1, 1);
        /#
            player.var_6f7281f031b30320[1] setdevtext(function_181f84b6e516d4e6(var_20debc67d125a6a2, "<unknown string>"));
        #/
        player.var_6f7281f031b30320[1] setpoint("TOPLEFT", "TOPLEFT", 250, 40);
        player.var_6f7281f031b30320[1] clearalltextafterhudelem();
        var_6267a5ad12c5e4d4 = player function_644ed519cac9722b(2, 0);
        /#
            player.var_6f7281f031b30320[2] setdevtext(function_181f84b6e516d4e6(var_6267a5ad12c5e4d4, "<unknown string>"));
        #/
        player.var_6f7281f031b30320[2] setpoint("TOPLEFT", "TOPLEFT", 250, 50);
        player.var_6f7281f031b30320[2] clearalltextafterhudelem();
        var_b2721cf177f915e4 = player function_644ed519cac9722b(1, 2);
        var_2230de25f8635c83 = player function_644ed519cac9722b(1, 3);
        /#
            player.var_6f7281f031b30320[3] setdevtext(function_e29c498dd636939a(var_b2721cf177f915e4, "<unknown string>") + "<unknown string>" + function_e29c498dd636939a(var_2230de25f8635c83, "<unknown string>"));
        #/
        player.var_6f7281f031b30320[3] setpoint("TOPLEFT", "TOPLEFT", 250, 60);
        player.var_6f7281f031b30320[3] clearalltextafterhudelem();
        player.var_6f7281f031b30320[3].archived = 0;
        var_bed94c5e8ba6c57e = player function_644ed519cac9722b(1, 4);
        var_8862c20cffb85370 = player function_644ed519cac9722b(65535, 0);
        /#
            player.var_6f7281f031b30320[4] setdevtext(function_e29c498dd636939a(var_bed94c5e8ba6c57e, "<unknown string>") + "<unknown string>" + function_e29c498dd636939a(var_8862c20cffb85370, "<unknown string>"));
        #/
        player.var_6f7281f031b30320[4] setpoint("TOPLEFT", "TOPLEFT", 250, 80);
        player.var_6f7281f031b30320[4] clearalltextafterhudelem();
        player.var_6f7281f031b30320[4].archived = 0;
        var_dc62a204e1921a99 = player function_644ed519cac9722b(65535, 4);
        var_5dd11d67a8ffe194 = player function_644ed519cac9722b(65535, 1);
        var_2ac478345313402 = player function_644ed519cac9722b(65535, 2);
        var_ea074533d9558d3d = player function_644ed519cac9722b(65535, 3);
        /#
            player.var_6f7281f031b30320[5] setdevtext(function_e29c498dd636939a(var_dc62a204e1921a99, "<unknown string>") + "<unknown string>" + function_e29c498dd636939a(var_5dd11d67a8ffe194, "<unknown string>") + "<unknown string>" + function_e29c498dd636939a(var_ea074533d9558d3d, "<unknown string>") + "<unknown string>" + function_e29c498dd636939a(var_2ac478345313402, "<unknown string>"));
        #/
        player.var_6f7281f031b30320[5] setpoint("TOPLEFT", "TOPLEFT", 250, 100);
        player.var_6f7281f031b30320[5] clearalltextafterhudelem();
        player.var_6f7281f031b30320[5].archived = 0;
        var_50b1b73063d6e846 = player function_644ed519cac9722b(1, 12);
        var_c8bbed73f0438ec8 = player function_644ed519cac9722b(1, 13);
        var_9cdf915529700821 = player function_644ed519cac9722b(1, 14);
        var_a4462a64012f11a5 = player function_644ed519cac9722b(1, 15);
        var_78ae3551b1d877da = player function_644ed519cac9722b(1, 16);
        /#
            player.var_6f7281f031b30320[6] setdevtext(function_e29c498dd636939a(var_50b1b73063d6e846, "<unknown string>") + "<unknown string>" + function_e29c498dd636939a(var_c8bbed73f0438ec8, "<unknown string>") + "<unknown string>" + function_e29c498dd636939a(var_9cdf915529700821, "<unknown string>") + "<unknown string>" + function_e29c498dd636939a(var_a4462a64012f11a5, "<unknown string>") + "<unknown string>" + function_e29c498dd636939a(var_78ae3551b1d877da, "<unknown string>"));
        #/
        player.var_6f7281f031b30320[6] setpoint("TOPLEFT", "TOPLEFT", 250, 140);
        player.var_6f7281f031b30320[6] clearalltextafterhudelem();
        player.var_6f7281f031b30320[6].archived = 0;
        var_b868dd85a8e182f2 = "Backpack Items: ";
        for (var_65b695f0c0d909ed = 1; var_65b695f0c0d909ed <= 12; var_65b695f0c0d909ed++) {
            var_5dd11d67a8ffe194 = player function_644ed519cac9722b(2, var_65b695f0c0d909ed);
            var_b868dd85a8e182f2 = var_b868dd85a8e182f2 + function_e29c498dd636939a(var_5dd11d67a8ffe194, "") + ", ";
        }
        /#
            player.var_6f7281f031b30320[7] setdevtext(var_b868dd85a8e182f2);
        #/
        player.var_6f7281f031b30320[7] setpoint("TOPLEFT", "TOPLEFT", 250, 190);
        player.var_6f7281f031b30320[7] clearalltextafterhudelem();
        player.var_6f7281f031b30320[7].archived = 0;
        wait(3);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6524
// Size: 0x5c
function function_a3d464413e73f057(player) {
    if (!isdefined(level.var_19cc064ef4f4f035)) {
        level.var_19cc064ef4f4f035 = 0;
    }
    if (!isdefined(player.var_87f0698dc7ac0a09)) {
        player.var_87f0698dc7ac0a09 = level.var_19cc064ef4f4f035;
        level.var_19cc064ef4f4f035++;
    }
    return player.var_87f0698dc7ac0a09;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6588
// Size: 0x31
function function_359ea1fa75ce58d8() {
    if (!isdefined(level.var_a2c878a15054b7d2)) {
        level.var_a2c878a15054b7d2 = getdvarint(@"hash_b39534cbfce013c4", 0);
    }
    return level.var_a2c878a15054b7d2;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65c1
// Size: 0xf9
function function_6e0f57c0fdd64f13(player) {
    if (istrue(player.var_7093a8118013837f)) {
        return 1;
    }
    var_ed6ddfe7149b5d7c = namespace_38b993c4618e76cd::getLootIDFromRef("loot_key_gold_door");
    if (!isdefined(var_ed6ddfe7149b5d7c)) {
        return 0;
    }
    for (var_65b695f0c0d909ed = 14; var_65b695f0c0d909ed >= 1; var_65b695f0c0d909ed--) {
        var_5dd11d67a8ffe194 = player function_644ed519cac9722b(2, var_65b695f0c0d909ed);
        if (var_5dd11d67a8ffe194.var_fb5fdfafc29f4513 != "0" && var_5dd11d67a8ffe194.lootid == var_ed6ddfe7149b5d7c) {
            player.var_7093a8118013837f = 1;
            if (var_65b695f0c0d909ed <= 12) {
                var_239511438b021cbe = var_65b695f0c0d909ed - 1;
                player setplayerdata(level.var_5d69837cf4db0407, "dmzBackpack", var_239511438b021cbe, "lootID", 0);
                player setplayerdata(level.var_5d69837cf4db0407, "dmzBackpack", var_239511438b021cbe, "quantity", 0);
            }
            function_dc67872cc4cfae72(player, 2, var_65b695f0c0d909ed);
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x66c2
// Size: 0xad
function function_3b6ac6fde1b3e84a(player) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    if (!player isfireteamleader()) {
        return;
    }
    if (!function_6e0f57c0fdd64f13(player) && function_359ea1fa75ce58d8()) {
        var_6980251e86d0a47 = player getfireteammembers();
        kick(player getentitynumber(), "EXE/PLAYERKICKED_NO_BIO_LAB_TICKET");
        foreach (var_7eef32a705de8bee in var_6980251e86d0a47) {
            kick(var_7eef32a705de8bee getentitynumber(), "EXE/PLAYERKICKED_NO_BIO_LAB_TICKET");
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6776
// Size: 0x3c
function function_6484ce4430c9439b(player, slot) {
    if (!isdefined(player) || !isdefined(player.var_6317f2446d7f722)) {
        return 1;
    }
    return !istrue(player.var_6317f2446d7f722[slot]);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67ba
// Size: 0xae
function function_d3e4d206d9b842a0(scriptable) {
    if (!isdefined(scriptable.metadata) || !isdefined(scriptable.metadata[1])) {
        return 0;
    }
    foreach (data in scriptable.metadata[1]) {
        if (data.key == 15 && int(data.value) > 0) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6870
// Size: 0x1d8
function function_c2b37caeb3e8dfa0(player, weaponindex, var_a0a8cc91d4f7cb2d, var_aa1d8f0586732a5a) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_5170a7c15b09f348 = function_cd4840758c0f2125(var_aa1d8f0586732a5a);
    if (istrue(function_423648b9c03fdaa1(7, var_aa1d8f0586732a5a, 1))) {
        var_5170a7c15b09f348[1] = function_92f14840aa31925d(7, 0, var_5170a7c15b09f348[1]);
    }
    var_de3154264e07d28 = [];
    var_76a621441904ebab = [];
    for (var_80fbf4ed7b56b1df = 0; var_80fbf4ed7b56b1df <= 4; var_80fbf4ed7b56b1df++) {
        attachmentindex = 0 + var_80fbf4ed7b56b1df;
        if (isdefined(function_423648b9c03fdaa1(8 + var_80fbf4ed7b56b1df, var_a0a8cc91d4f7cb2d, 1)) && var_a0a8cc91d4f7cb2d.var_6cb812578f7d9ae7[attachmentindex] != 0) {
            var_de3154264e07d28[var_a0a8cc91d4f7cb2d.var_6cb812578f7d9ae7[attachmentindex]] = 1;
        }
        var_a58b61ff61269ef = function_423648b9c03fdaa1(2 + var_80fbf4ed7b56b1df, var_a0a8cc91d4f7cb2d, 1);
        if (isdefined(var_a58b61ff61269ef) && var_a0a8cc91d4f7cb2d.var_6cb812578f7d9ae7[attachmentindex] != 0) {
            var_76a621441904ebab[var_a0a8cc91d4f7cb2d.var_6cb812578f7d9ae7[attachmentindex]] = var_a58b61ff61269ef;
        }
    }
    for (var_80fbf4ed7b56b1df = 0; var_80fbf4ed7b56b1df <= 4; var_80fbf4ed7b56b1df++) {
        attachmentindex = 0 + var_80fbf4ed7b56b1df;
        var_113e0f3dddfc9a41 = 0;
        var_a58b61ff61269ef = 0;
        if (isdefined(var_de3154264e07d28[var_aa1d8f0586732a5a.var_6cb812578f7d9ae7[attachmentindex]])) {
            var_113e0f3dddfc9a41 = 1;
        }
        if (isdefined(var_76a621441904ebab[var_aa1d8f0586732a5a.var_6cb812578f7d9ae7[attachmentindex]])) {
            var_a58b61ff61269ef = var_76a621441904ebab[var_aa1d8f0586732a5a.var_6cb812578f7d9ae7[attachmentindex]];
        }
        var_5170a7c15b09f348[1] = function_92f14840aa31925d(8 + var_80fbf4ed7b56b1df, var_113e0f3dddfc9a41, var_5170a7c15b09f348[1]);
        var_5170a7c15b09f348[1] = function_92f14840aa31925d(2 + var_80fbf4ed7b56b1df, var_a58b61ff61269ef, var_5170a7c15b09f348[1]);
    }
    var_11cc6f33cb91b3f1 = function_fe92418620d93763(var_5170a7c15b09f348[0]);
    var_d3c548c09bb62da2 = function_fe92418620d93763(var_5170a7c15b09f348[1]);
    function_cd81c0e152649846(player, var_aa1d8f0586732a5a, var_11cc6f33cb91b3f1, var_d3c548c09bb62da2);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a4f
// Size: 0xa6
function function_36275388f9093535(metadata) {
    if (!function_e0fc1230452cf4e7()) {
        return;
    }
    var_87f0698dc7ac0a09 = function_4a84e57f6373e69(1, metadata[0]);
    foreach (player in level.players) {
        if (isdefined(player.var_87f0698dc7ac0a09) && isdefined(var_87f0698dc7ac0a09) && player.var_87f0698dc7ac0a09 == int(var_87f0698dc7ac0a09)) {
            return player;
        }
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6afc
// Size: 0x35
function private function_251fb8fbf0d6addc() {
    if (!isdefined(level.var_1200c749a3268f9f)) {
        level.var_1200c749a3268f9f = getdvarfloat(@"hash_4d31327236448d75", 0.05);
    }
    return level.var_1200c749a3268f9f;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b39
// Size: 0x33
function function_ba249ac98edc6279(player) {
    if (!function_e0fc1230452cf4e7()) {
        return 0;
    }
    var_5332cda4054641da = getUpgradeCount(player, 14);
    return var_5332cda4054641da * function_251fb8fbf0d6addc();
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b74
// Size: 0x35
function private function_5c55ff785294ad1d() {
    if (!isdefined(level.var_70d06cc3a8218177)) {
        level.var_70d06cc3a8218177 = getdvarfloat(@"hash_aad2dc8050226460", 0.04);
    }
    return level.var_70d06cc3a8218177;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6bb1
// Size: 0x35
function private function_66f4c5ec2e0beee6() {
    if (!isdefined(level.var_18c292b7709dafcc)) {
        level.var_18c292b7709dafcc = getdvarfloat(@"hash_1c2dc077c5758375", 0.05);
    }
    return level.var_18c292b7709dafcc;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6bee
// Size: 0x35
function private function_956e931113e352a6() {
    if (!isdefined(level.var_3aa04e5b96bb1307)) {
        level.var_3aa04e5b96bb1307 = getdvarfloat(@"hash_c9a496baf46a5a42", 0.05);
    }
    return level.var_3aa04e5b96bb1307;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6c2b
// Size: 0x35
function private function_c826ee21a52e408b() {
    if (!isdefined(level.var_96ab8672d820807)) {
        level.var_96ab8672d820807 = getdvarfloat(@"hash_ae4f2b9bfc7f50a8", 0.05);
    }
    return level.var_96ab8672d820807;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c68
// Size: 0xa6
function function_39f56604458d5a9b(player, itemdata) {
    if (!function_e0fc1230452cf4e7()) {
        return 0;
    }
    if (itemdata.ref == "armor") {
        var_5332cda4054641da = getUpgradeCount(player, 13);
        return (function_5c55ff785294ad1d() * var_5332cda4054641da);
    } else if (itemdata.ref == "dmz_exfil_personal") {
        var_5332cda4054641da = getUpgradeCount(player, 11);
        return (function_66f4c5ec2e0beee6() * var_5332cda4054641da);
    } else if (itemdata.type == "killstreak") {
        var_5332cda4054641da = getUpgradeCount(player, 12);
        return (function_956e931113e352a6() * var_5332cda4054641da);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d15
// Size: 0x88
function function_1ee6a57e88b1a120(player, var_85166da84e55de25) {
    var_57838bb4fae836f8 = undefined;
    switch (var_85166da84e55de25) {
    case #"hash_31100fbc01bd387c":
        var_57838bb4fae836f8 = 16;
        break;
    case #"hash_311012bc01bd3d35":
        var_57838bb4fae836f8 = 17;
        break;
    case #"hash_311011bc01bd3ba2":
        var_57838bb4fae836f8 = 18;
        break;
    }
    if (isdefined(var_57838bb4fae836f8)) {
        var_5332cda4054641da = getUpgradeCount(player, var_57838bb4fae836f8);
        return (var_5332cda4054641da * function_c826ee21a52e408b());
    } else {
        return 0;
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6da4
// Size: 0x36
function private function_93f21618e59f6402(player) {
    var_6f908d78e5ac8e01 = level.spawnArmorPlates;
    if (!function_e0fc1230452cf4e7()) {
        return var_6f908d78e5ac8e01;
    }
    return var_6f908d78e5ac8e01 + getUpgradeCount(player, 29);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6de2
// Size: 0x36
function getNumStartUpgradePlates(player) {
    var_51539d5a1aa9b3f9 = namespace_f8d3520d3483c1::function_47320a25b8ee003();
    var_5332cda4054641da = function_93f21618e59f6402(player);
    return min(var_5332cda4054641da, var_51539d5a1aa9b3f9);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e20
// Size: 0x43
function function_aad5c8b478df88c4(player) {
    if (!function_e0fc1230452cf4e7()) {
        return 0;
    }
    var_41c6ec89b130dba2 = function_93f21618e59f6402(player);
    var_51539d5a1aa9b3f9 = namespace_f8d3520d3483c1::function_47320a25b8ee003();
    return max(0, var_41c6ec89b130dba2 - var_51539d5a1aa9b3f9);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e6b
// Size: 0x2a
function function_59352c09a417a5e2(player, var_fb6bafb61d5c3d4a) {
    if (!function_e0fc1230452cf4e7()) {
        return 1;
    }
    return getUpgradeCount(player, var_fb6bafb61d5c3d4a) > 0;
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e9d
// Size: 0x33
function getUpgradeCount(player, var_fb6bafb61d5c3d4a) {
    if (istrue(function_758b22811e547efe())) {
        return 1;
    } else {
        return function_53c4c53197386572(player function_10abd3fe15ba02dd(var_fb6bafb61d5c3d4a), 0);
    }
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ed7
// Size: 0xa0
function function_e860c1be7ff11f5b(team, var_fb6bafb61d5c3d4a) {
    var_d3d220ae17c9a0be = 0;
    players = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    foreach (player in players) {
        var_5332cda4054641da = getUpgradeCount(player, var_fb6bafb61d5c3d4a);
        var_d3d220ae17c9a0be = max(var_5332cda4054641da, var_d3d220ae17c9a0be);
    }
    return int(var_d3d220ae17c9a0be);
}

// Namespace namespace_b16531563568eaba/namespace_a38a2e1fe7519183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f7f
// Size: 0x14c
function function_72fe945f29c8bce6(instance) {
    /#
        println("<unknown string>" + instance.var_fb5fdfafc29f4513);
        if (isdefined(instance.metadata)) {
            println("<unknown string>");
            foreach (data in instance.metadata) {
                println("<unknown string>" + data.key + "<unknown string>" + data.value);
            }
        }
        if (isdefined(instance.var_d3c548c09bb62da2)) {
            println("<unknown string>");
            foreach (data in instance.var_d3c548c09bb62da2) {
                println("<unknown string>" + data.key + "<unknown string>" + data.value);
            }
        }
        println("<unknown string>");
    #/
}

