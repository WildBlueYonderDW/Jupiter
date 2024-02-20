// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using script_600b944a95c3a7bf;
#using script_7c40fa80892a721;
#using scripts\mp\utility\game.gsc;
#using script_b7a9ce0a2282b79;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\hud_message.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_gametype_truckwar.gsc;
#using script_728ffcee8cbf30ee;
#using script_189b67b2735b981d;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\equipment.gsc;
#using script_ec0f9ad939b29e0;
#using script_2391409ef7b431e1;
#using script_744cad313ed0a87e;
#using script_55e418c5cc946593;
#using script_3aacf02225ca0da5;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_3583ff375ab3a91e;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\mp\supers.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using scripts\mp\flags.gsc;
#using script_7c03ab87c5f9f420;
#using scripts\mp\loot.gsc;
#using scripts\mp\gametypes\br.gsc;

#namespace namespace_e50e624d9af51c8c;

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c4
// Size: 0x5a
function function_e0948a1e98e82ae1() {
    if (istrue(level.var_d034183abf2e274d)) {
        level.var_201c841c4668a94f = "dmzBackpack";
        level.backpackSize = "dmzBackpackSize";
    } else {
        level.var_201c841c4668a94f = "brBackpack";
        level.backpackSize = "brBackpackSize";
    }
    level.var_1833d54921da2cc6 = namespace_cd0b2d039510b38d::privatematch();
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x925
// Size: 0xc7
function function_5baaa0ce73d6fe84(player, ammotype) {
    if (function_efab78b72d131d76(player)) {
        var_9ac5e72784815708 = function_2985254128b1c262(player);
        var_811abfdb6c33f17f = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(var_9ac5e72784815708);
        if (isdefined(var_811abfdb6c33f17f)) {
            if (isdefined(ammotype) && ammotype != var_811abfdb6c33f17f) {
                return;
            }
            var_5a57e79ae8d5ae67 = player.br_ammo[var_811abfdb6c33f17f];
            var_ab0ee360900bcb85 = level.var_e6ea72fc5e3fcd00[var_811abfdb6c33f17f];
            var_5a57e79ae8d5ae67 = int(min(var_5a57e79ae8d5ae67, var_ab0ee360900bcb85));
            if (var_5a57e79ae8d5ae67 > 1023) {
                /#
                    assertmsg("updateUIAmmo has too large of an omnvar value, weaponStockAmmo: " + var_5a57e79ae8d5ae67 + ", weapon slot basename" + var_9ac5e72784815708.basename);
                #/
            }
            player setclientomnvar("ui_playerdata_weapon_ammo", var_5a57e79ae8d5ae67);
        }
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f3
// Size: 0x4d
function function_e35a7cb7e7c8c17e(player, weapon, var_f51bbb191526dfa4, metadata, var_223785486725cd51) {
    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
        namespace_a38a2e1fe7519183::function_9fee9bd8efd81655(player, weapon, var_f51bbb191526dfa4, metadata);
    } else {
        function_8107fe0feec27866(player, weapon, var_223785486725cd51);
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa47
// Size: 0x37
function function_705889b7586cf34e(player, weapon, weaponslot) {
    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
        namespace_a38a2e1fe7519183::function_1f83d85290c29bef(player, weaponslot);
    }
    function_8107fe0feec27866(player, weapon);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa85
// Size: 0x68
function function_ee4ccdff22e510fd(player, var_72e90f48e0fd0e1c, sticker) {
    if (sticker == "none") {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "sticker", var_72e90f48e0fd0e1c, sticker);
    } else {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "sticker", var_72e90f48e0fd0e1c, getsubstr(sticker, 2));
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf4
// Size: 0x3c2
function function_8107fe0feec27866(player, weapon, var_223785486725cd51) {
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
    variantid = weapon.variantid;
    if (!isdefined(weapon.variantid)) {
        variantid = 0;
    }
    lootid = namespace_e0ee43ef2dddadaa::function_79d6e6c22245687a(rootname, variantid);
    player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "weapon", rootname);
    player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "variantID", variantid);
    player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "lootItemID", lootid);
    if (!istrue(var_223785486725cd51)) {
        player.var_3ef503345dc57957 = player getweaponammoclip(weapon);
        player.var_ad7897ecdbcb63 = player getweaponammoclip(weapon, "left");
        if (weapon.hasalternate) {
            var_b6ff735c3690cc44 = weapon getaltweapon();
            player.var_86b32aff94b5714e = player getweaponammoclip(var_b6ff735c3690cc44);
        }
    }
    attachments = getweaponattachments(weapon);
    var_f957368a964a7504 = namespace_e0ee43ef2dddadaa::function_792bacb194f6f862(rootname);
    var_428a6c7cd65625c0 = 0;
    var_91bbf8d2294a656e = weapon.attachmentvarindices;
    for (attachmentindex = 0; attachmentindex < attachments.size && var_428a6c7cd65625c0 < 7; attachmentindex++) {
        if (namespace_68e641469fde3fa7::attachmentisselectable(weapon, attachments[attachmentindex])) {
            player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "attachmentSetup", var_428a6c7cd65625c0, "attachment", attachments[attachmentindex]);
            player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "attachmentSetup", var_428a6c7cd65625c0, "variantID", var_91bbf8d2294a656e[attachments[attachmentindex]]);
            var_428a6c7cd65625c0++;
        }
    }
    for (attachmentindex = var_428a6c7cd65625c0; var_428a6c7cd65625c0 < 7; attachmentindex++) {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "attachmentSetup", var_428a6c7cd65625c0, "attachment", "none");
        player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "attachmentSetup", var_428a6c7cd65625c0, "variantID", 0);
        var_428a6c7cd65625c0++;
    }
    if (isdefined(weapon.camo)) {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "camo", weapon.camo);
    }
    if (isdefined(weapon.reticle)) {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "reticle", weapon.reticle);
    }
    if (isdefined(weapon.visual)) {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "cosmeticAttachment", weapon.visual);
    }
    stickers = [];
    if (isdefined(weapon.stickerslot0)) {
        function_ee4ccdff22e510fd(player, 0, weapon.stickerslot0);
    }
    if (isdefined(weapon.stickerslot1)) {
        function_ee4ccdff22e510fd(player, 1, weapon.stickerslot1);
    }
    if (isdefined(weapon.stickerslot2)) {
        function_ee4ccdff22e510fd(player, 2, weapon.stickerslot2);
    }
    if (isdefined(weapon.stickerslot3)) {
        function_ee4ccdff22e510fd(player, 3, weapon.stickerslot3);
    }
    if (isdefined(weapon.var_b39ac546cc8621f8)) {
        function_ee4ccdff22e510fd(player, 4, weapon.var_b39ac546cc8621f8);
    }
    function_3e89085d4a19a802(player, weapon);
    function_5baaa0ce73d6fe84(player);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebd
// Size: 0x2f
function function_3e89085d4a19a802(player, weapon) {
    if (!isdefined(weapon)) {
        weapon = function_f2849dae62f7444e(player);
    }
    player.var_9ac5e72784815708 = weapon;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef3
// Size: 0x17
function function_2985254128b1c262(player) {
    return player.var_9ac5e72784815708;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf12
// Size: 0x1ed
function function_f2849dae62f7444e(player, var_3ae9c94f047db7c3, var_5dc27a5bf459c504) {
    if (!isdefined(var_5dc27a5bf459c504)) {
        var_5dc27a5bf459c504 = "dmzWeapon";
    }
    if (!isdefined(var_3ae9c94f047db7c3)) {
        var_3ae9c94f047db7c3 = level.var_5d69837cf4db0407;
    }
    weapon = player getplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "weapon");
    variantid = player getplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "variantID");
    attachments = [];
    var_f3464d71f01f614e = [];
    var_eae5a591e200672 = [];
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        attachments[attachmentindex] = player getplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "attachmentSetup", attachmentindex, "attachment");
        var_f3464d71f01f614e[attachmentindex] = player getplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "attachmentSetup", attachmentindex, "variantID");
        var_803ecabb6f57b183 = player getplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "attachmentSetup", attachmentindex, "customTune", 0);
        var_803ecbbb6f57b3b6 = player getplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "attachmentSetup", attachmentindex, "customTune", 1);
        var_c19231fe2990712e = namespace_d19129e4fa5d176::function_a5d1432d54033ea9(var_803ecabb6f57b183, var_803ecbbb6f57b3b6, 0);
        if (isdefined(var_c19231fe2990712e)) {
            var_eae5a591e200672[attachments[attachmentindex]] = var_c19231fe2990712e;
        }
    }
    camo = player getplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "camo");
    reticle = player getplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "reticle");
    cosmeticattachment = player getplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "cosmeticAttachment");
    stickers = [];
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
        stickers[var_36d2abbdcbcb186c] = player getplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "sticker", var_36d2abbdcbcb186c);
    }
    return namespace_e0ee43ef2dddadaa::buildweapon(weapon, attachments, camo, reticle, variantid, var_f3464d71f01f614e, cosmeticattachment, stickers);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1107
// Size: 0x95
function function_efab78b72d131d76(player) {
    ret = isdefined(player.var_9ac5e72784815708) && player.var_9ac5e72784815708.basename != "none";
    if (istrue(level.var_f478c1f94caa7e9)) {
        data = player getplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "weapon");
        /#
            assertex(data != "none" == ret, "PlayerData does not match the weaponObj stored on the player! playerData: " + data + ", weaponObj isDefined: " + ret);
        #/
    }
    return ret;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a4
// Size: 0x25
function function_d9b1550011525161(player) {
    return player getplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "lootItemID");
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d1
// Size: 0x16f
function function_f5a1a13f0181bb66(player, var_5756aa71087f3439, var_44ee85dcf52b4001) {
    if (istrue(player.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
        return;
    }
    if (!namespace_aead94004cf4c147::function_efab78b72d131d76(player)) {
        return;
    }
    lootItemID = function_d9b1550011525161(player);
    switchweapon = function_2985254128b1c262(player);
    count = ter_op(isdefined(player.var_3ef503345dc57957), player.var_3ef503345dc57957, weaponclipsize(switchweapon));
    var_e97d731bedd44c63 = ter_op(switchweapon.hasalternate && isdefined(player.var_86b32aff94b5714e), player.var_86b32aff94b5714e, weaponclipsize(switchweapon getaltweapon()));
    countlefthand = undefined;
    if (namespace_68e641469fde3fa7::isakimbo(switchweapon)) {
        countlefthand = ter_op(isdefined(player.var_ad7897ecdbcb63), player.var_ad7897ecdbcb63, weaponclipsize(switchweapon));
    }
    var_e1147886ccf51970 = function_86a5c7670325346b(player, 2);
    function_590202daf6a1d4d7(player);
    namespace_cb965d2f71fefddc::function_e5845ff9b61ac5d7(switchweapon, count, undefined, var_e97d731bedd44c63, var_44ee85dcf52b4001, var_5756aa71087f3439, undefined, undefined, undefined, var_e1147886ccf51970, countlefthand);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1347
// Size: 0x25
function function_954372d604277278(player) {
    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
        namespace_a38a2e1fe7519183::function_f910b139e75fd559(player);
    }
    function_590202daf6a1d4d7(player);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1373
// Size: 0x129
function function_6a77670d14b0d08c(player, var_3ae9c94f047db7c3, var_5dc27a5bf459c504) {
    if (!isdefined(var_5dc27a5bf459c504)) {
        var_5dc27a5bf459c504 = "dmzWeapon";
    }
    if (!isdefined(var_3ae9c94f047db7c3)) {
        var_3ae9c94f047db7c3 = level.var_5d69837cf4db0407;
    }
    player setplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "weapon", "none");
    player setplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "lootItemID", 0);
    player setplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "camo", "none");
    player setplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "reticle", "none");
    player setplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "cosmeticAttachment", "none");
    player setplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "variantID", 0);
    player setplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "blueprintName", "");
    for (var_40e4b9c48b36c9ec = 0; var_40e4b9c48b36c9ec < 5; var_40e4b9c48b36c9ec++) {
        player setplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "attachmentSetup", var_40e4b9c48b36c9ec, "attachment", "none");
        player setplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "attachmentSetup", var_40e4b9c48b36c9ec, "variantID", 0);
    }
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 4; var_36d2abbdcbcb186c++) {
        player setplayerdata(var_3ae9c94f047db7c3, var_5dc27a5bf459c504, "sticker", var_36d2abbdcbcb186c, "none");
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a3
// Size: 0x31
function function_51f991fdaf031388(player, var_3ae9c94f047db7c3, var_5dc27a5bf459c504) {
    function_6a77670d14b0d08c(player, var_3ae9c94f047db7c3, var_5dc27a5bf459c504);
    player.var_9ac5e72784815708 = undefined;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14db
// Size: 0x4e
function function_590202daf6a1d4d7(player, var_5dc27a5bf459c504) {
    function_51f991fdaf031388(player, undefined, "dmzWeapon");
    player.var_3ef503345dc57957 = undefined;
    player.var_86b32aff94b5714e = undefined;
    player.var_ad7897ecdbcb63 = undefined;
    function_ae30366a2d519a57(player, 2, undefined);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1530
// Size: 0x4d
function function_106b52ed8f680043(lootid) {
    if (lootid == 0) {
        return undefined;
    }
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_eeeae9defa0c1e95 = function_6196d9ea9a30e609(i);
        if (lootid == var_eeeae9defa0c1e95) {
            return i;
        }
    }
    return undefined;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1585
// Size: 0x6f
function function_aeb6f176059d98f5(lootid) {
    if (lootid == 0) {
        return undefined;
    }
    indexes = [];
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_eeeae9defa0c1e95 = function_6196d9ea9a30e609(i);
        if (lootid == var_eeeae9defa0c1e95) {
            indexes[i] = function_897b29adb37f06a7(i);
        }
    }
    indexes = tablesort(indexes, "up");
    return indexes;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15fc
// Size: 0x65
function function_ed8f025d796c038(lootid, sorted) {
    if (lootid == 0) {
        return undefined;
    }
    indexes = [];
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_eeeae9defa0c1e95 = function_6196d9ea9a30e609(i);
        if (lootid == var_eeeae9defa0c1e95) {
            indexes[indexes.size] = i;
        }
    }
    return indexes;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1669
// Size: 0x7f
function function_e37ca8120dc19c6a() {
    /#
        if (issubstr(level.mapname, "lootedQuantity") || level.mapname == "onDrop") {
            return 1;
        }
    #/
    var_78c5bd06aaaa2482 = namespace_cd0b2d039510b38d::privatematch() && !namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7() && getdvarint(@"hash_6f45a6cbb79f0513", 0) == 0;
    return namespace_cd0b2d039510b38d::matchmakinggame() || var_78c5bd06aaaa2482 || getdvarint(@"hash_9c2d59c1962cac50");
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f0
// Size: 0xb6
function function_57931a717f140ebe(player) {
    weapons = [];
    primaries = player getweaponslistprimaries();
    foreach (weapon in primaries) {
        if (namespace_68e641469fde3fa7::function_d3c77884d93d850(weapon) || namespace_68e641469fde3fa7::function_3f15e5e526ff94ce(weapon) || weaponinventorytype(weapon) == "altmode" || namespace_68e641469fde3fa7::ismeleeoverrideweapon(weapon) || namespace_68e641469fde3fa7::issuperweapon(weapon)) {
            continue;
        } else {
            weapons[weapons.size] = weapon;
        }
    }
    return weapons;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ae
// Size: 0x12a
function function_254150d1e667dee7() {
    items = [];
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_57acadc40b2f0a8 = function_6738846da50730f1(i);
        quantity = var_57acadc40b2f0a8[1];
        lootid = var_57acadc40b2f0a8[0];
        if (lootid != 0) {
            item = spawnstruct();
            item.lootid = lootid;
            item.quantity = quantity;
            item.index = i;
            items[items.size] = item;
        }
    }
    if (function_efab78b72d131d76(self)) {
        item = spawnstruct();
        item.lootid = function_d9b1550011525161(self);
        item.quantity = 1;
        item.var_e1147886ccf51970 = namespace_3bcd40a3005712ec::function_86a5c7670325346b(self, 2);
        item.objweapon = function_2985254128b1c262(self);
        var_96c4059aa2eabfb8 = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, 2);
        if (isdefined(var_96c4059aa2eabfb8)) {
            item.metadata = var_96c4059aa2eabfb8;
        }
        items[items.size] = item;
    }
    return items;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e0
// Size: 0x52
function function_6738846da50730f1(index) {
    lootid = function_6196d9ea9a30e609(index);
    quantity = function_897b29adb37f06a7(index);
    lootedQuantity = function_eee597a59b37c10e(index);
    return [0:lootid, 1:quantity, 2:lootedQuantity];
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193a
// Size: 0x65
function function_84772ebf836af5db(index, amount) {
    if (!function_e37ca8120dc19c6a()) {
        return;
    }
    var_e8db6afbf2180f7e = function_897b29adb37f06a7(index);
    var_3fa041e4f059bc71 = int(max(0, var_e8db6afbf2180f7e + amount));
    lootid = function_6196d9ea9a30e609(index);
    function_d87a9518235b9682(index, lootid, var_3fa041e4f059bc71);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x19a6
// Size: 0xa4
function function_3b2bf3060f2efdf3(player, index, lootid, quantity, loadoutslot) {
    var_645600fdeaf0aff1 = player getplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "lootID");
    var_9db5199707687a1b = player getplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "quantity");
    if (var_645600fdeaf0aff1 != lootid && quantity > 0) {
        namespace_a38a2e1fe7519183::function_22c2d36f9a723c2f(player, index, loadoutslot);
    }
    player function_d87a9518235b9682(index, lootid, quantity);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a51
// Size: 0x60
function function_3c3ee4c5700e0e32(player, index, lootid, quantity, var_72ad120eaac64650, loadoutslot, lootedQuantity) {
    lootedQuantity = function_53c4c53197386572(lootedQuantity, 0);
    namespace_a38a2e1fe7519183::function_d368b112dc94baae(player, index, var_72ad120eaac64650, loadoutslot);
    player function_d87a9518235b9682(index, lootid, quantity, undefined, lootedQuantity);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab8
// Size: 0xb7
function function_11f48ae5b87b4525(player, index, lootid, quantity, lootedQuantity) {
    lootedQuantity = function_53c4c53197386572(lootedQuantity, 0);
    var_645600fdeaf0aff1 = player getplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "lootID");
    var_9db5199707687a1b = player getplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "quantity");
    if (var_645600fdeaf0aff1 != lootid && (quantity > 0 || lootedQuantity > 0)) {
        namespace_a38a2e1fe7519183::function_233512489717381(player, index, lootid);
    }
    player function_d87a9518235b9682(index, lootid, quantity, undefined, lootedQuantity);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b76
// Size: 0x31
function function_b4e3d555d6d737bb(player, index, loadoutslot) {
    namespace_a38a2e1fe7519183::function_e8a616866b41197(player, index, loadoutslot);
    player function_d87a9518235b9682(index, 0, 0);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bae
// Size: 0x1d
function function_ad05407157b7d86d(player, index) {
    namespace_a38a2e1fe7519183::function_52384260fe709f19(player, index);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd2
// Size: 0x1d
function function_c6306ea9715dd8f1(player, slot) {
    namespace_a38a2e1fe7519183::function_351fe4ac57ca37e5(player, slot);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf6
// Size: 0x43
function function_e900e7e66383ad97(player, index, quantity, var_f3990d8529de3a54) {
    var_645600fdeaf0aff1 = player function_6196d9ea9a30e609(index);
    player function_d87a9518235b9682(index, var_645600fdeaf0aff1, quantity, var_f3990d8529de3a54);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c40
// Size: 0x39
function function_a0ccc23064473a05(player, index, lootid, quantity, lootedQuantity) {
    player function_d87a9518235b9682(index, lootid, quantity, 0, lootedQuantity);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c80
// Size: 0x243
function private function_d87a9518235b9682(index, lootid, quantity, var_f3990d8529de3a54, lootedQuantity) {
    if (!function_e37ca8120dc19c6a()) {
        return;
    }
    lootedQuantity = function_53c4c53197386572(lootedQuantity, 0);
    ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    /#
        println(self.name + "ui_notify_show_minimal_hud" + index + "<unknown string>" + lootid + "<unknown string>" + quantity + "<unknown string>");
        println("<unknown string>" + index + "<unknown string>" + lootid + "<unknown string>" + ref + "<unknown string>" + quantity);
    #/
    if (!isdefined(quantity) || quantity < 0) {
        quantity = 0;
    }
    if (!isdefined(lootid) || lootid != 0 && quantity == 0) {
        lootid = 0;
    }
    if (level.var_1833d54921da2cc6) {
        self setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "lootID", 1);
        self setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "quantity", 1);
    }
    self setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "lootID", lootid);
    self setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "quantity", quantity);
    self setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "lootedQuantity", lootedQuantity);
    if (quantity == 0 && lootedQuantity == 0 || lootid == 0) {
        self setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "lootID", 0);
        self setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "quantity", 0);
        self setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "lootedQuantity", 0);
        if (!istrue(var_f3990d8529de3a54)) {
            function_ad05407157b7d86d(self, index);
        }
    } else {
        pickup = spawnstruct();
        pickup.scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
        namespace_a011fbf6d93f25e5::branalytics_lootpickup(self, pickup.scriptablename, quantity);
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eca
// Size: 0x6f
function function_e7ec9888699dd8cf() {
    function_d28f52da6ede0191(self, 5, 1);
    namespace_a38a2e1fe7519183::function_5b7dc44bb66553a6(self);
    namespace_a38a2e1fe7519183::function_ea96b27797c7e268(self);
    if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz") {
        namespace_cb965d2f71fefddc::function_e98a5a4e0e001ac3(self);
    } else {
        var_2e1d1af8afe39ba8 = getdvarint(@"hash_fde1113ce9981d91", 3);
        var_347aa4935f42810 = namespace_d3d40f75bb4e4c32::function_c2f2bb9e0ae9a454(var_2e1d1af8afe39ba8);
        namespace_cb965d2f71fefddc::function_e98a5a4e0e001ac3(self, var_347aa4935f42810);
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f40
// Size: 0x4b
function function_5c5e6619f0b24f90(var_f3990d8529de3a54) {
    for (var_a6f8d8115e0f1e79 = 0; var_a6f8d8115e0f1e79 < function_b13e35608b336d65(self); var_a6f8d8115e0f1e79++) {
        function_db1dd76061352e5b(var_a6f8d8115e0f1e79, undefined, var_f3990d8529de3a54);
    }
    if (istrue(var_f3990d8529de3a54)) {
        self.var_4f7710ecff5b1619 = 1;
    }
    function_e7ec9888699dd8cf();
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f92
// Size: 0xaf
function function_bab1a10b3fdaae51() {
    for (var_a6f8d8115e0f1e79 = 0; var_a6f8d8115e0f1e79 < function_b13e35608b336d65(self); var_a6f8d8115e0f1e79++) {
        if (level.var_1833d54921da2cc6) {
            self setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, var_a6f8d8115e0f1e79, "lootID", 1);
            self setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, var_a6f8d8115e0f1e79, "quantity", 1);
        }
        self setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, var_a6f8d8115e0f1e79, "lootID", 0);
        self setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, var_a6f8d8115e0f1e79, "quantity", 0);
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2048
// Size: 0x12d
function canItemFitInBackpack(lootid, quantity) {
    var_a1d8c3682333615e = quantity;
    var_a1093166de09e6b8 = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (!isdefined(var_a1093166de09e6b8)) {
        var_a1093166de09e6b8 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    }
    maxcount = level.br_pickups.var_4138f9ddc1cd22d[var_a1093166de09e6b8];
    if (!isdefined(maxcount)) {
        maxcount = level.br_pickups.maxcounts[var_a1093166de09e6b8];
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("canItemFitInBackpack")) {
        result = namespace_71073fa38f11492::function_d72afaccedfc946e("canItemFitInBackpack", lootid, var_a1093166de09e6b8, quantity, maxcount);
        if (isdefined(result)) {
            return result;
        }
    }
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_eeeae9defa0c1e95 = function_6196d9ea9a30e609(i);
        if (var_eeeae9defa0c1e95 == 0 && var_eeeae9defa0c1e95 != lootid) {
            return 1;
        }
        if (var_eeeae9defa0c1e95 == lootid) {
            var_ff239359935aa777 = function_897b29adb37f06a7(i);
            if (var_ff239359935aa777 + quantity <= maxcount) {
                return 1;
            } else {
                quantity = var_ff239359935aa777 + quantity - maxcount;
            }
        }
    }
    if (quantity == var_a1d8c3682333615e) {
        return 0;
    }
    return 1;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x217d
// Size: 0xdb
function function_e05897f5d860188e(lootid, quantity, drop) {
    if (!isdefined(lootid)) {
        return undefined;
    }
    var_a1093166de09e6b8 = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (!isdefined(var_a1093166de09e6b8)) {
        var_a1093166de09e6b8 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    }
    maxcount = level.br_pickups.var_4138f9ddc1cd22d[var_a1093166de09e6b8];
    if (!isdefined(maxcount)) {
        maxcount = level.br_pickups.maxcounts[var_a1093166de09e6b8];
    }
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_eeeae9defa0c1e95 = function_6196d9ea9a30e609(i);
        if (var_eeeae9defa0c1e95 == lootid) {
            if (istrue(drop)) {
                return i;
            }
            var_ff239359935aa777 = function_897b29adb37f06a7(i);
            if (var_ff239359935aa777 < maxcount) {
                return i;
            }
        }
    }
    return undefined;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2260
// Size: 0x2a
function function_6196d9ea9a30e609(index) {
    return self getplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "lootID");
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2292
// Size: 0x2a
function function_897b29adb37f06a7(index) {
    return self getplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "quantity");
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c4
// Size: 0x2a
function function_eee597a59b37c10e(index) {
    return self getplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, index, "lootedQuantity");
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f6
// Size: 0x3c
function getAvailableDMZBackpackIndex() {
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_eeeae9defa0c1e95 = function_6196d9ea9a30e609(i);
        if (var_eeeae9defa0c1e95 == 0) {
            return i;
        }
    }
    return undefined;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233a
// Size: 0xfc
function function_9e76c59021bbf021(ammotype) {
    lootid = loot::function_fae5e1d3de32d3f7(ammotype);
    if (!isdefined(lootid)) {
        return 0;
    }
    var_40f97ad475793851 = int(max(0, level.br_ammo_max[ammotype] - self.br_ammo[ammotype]));
    maxcount = level.br_pickups.var_4138f9ddc1cd22d[ammotype];
    if (!isdefined(maxcount)) {
        maxcount = level.br_pickups.maxcounts[ammotype];
    }
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_eeeae9defa0c1e95 = function_6196d9ea9a30e609(i);
        if (var_eeeae9defa0c1e95 == lootid) {
            var_ff239359935aa777 = function_897b29adb37f06a7(i);
            var_a29ff2ee96b284c1 = int(max(0, maxcount - var_ff239359935aa777));
            var_40f97ad475793851 = var_40f97ad475793851 + var_a29ff2ee96b284c1;
        }
    }
    return var_40f97ad475793851;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x243e
// Size: 0x5d
function function_f6f8c1fc9549eaf6(lootid) {
    scriptable = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    return isdefined(scriptable) && isdefined(level.br_pickups.br_itemtype[scriptable]) && level.br_pickups.br_itemtype[scriptable] == #"hash_b89cda942cb2ed05";
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a3
// Size: 0x2b
function function_8e61ef2a2f9137e7(lootid) {
    scriptable = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    return isdefined(scriptable) && scriptable == "brloot_radioactive_charge";
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d6
// Size: 0x2b
function function_b4893066110f4d10(lootid) {
    scriptable = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    return isdefined(scriptable) && scriptable == "brloot_volatile_decoy_grenade";
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2509
// Size: 0x17
function function_2d86ba79a58bb62(lootid) {
    return isdefined(lootid) && lootid == 8525;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2528
// Size: 0x36
function function_8a160d9935d47f5e(ref, type, quantity) {
    lootid = namespace_38b993c4618e76cd::function_a50b607d2500dda5(ref);
    return function_e01d9736b2d100ac(lootid, quantity);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2566
// Size: 0x70
function function_e01d9736b2d100ac(lootid, quantity) {
    /#
        assertex(isdefined(lootid) && isdefined(quantity), "LootID or quantity not defined in canAddItemToBackpack in br_default_inventory.gsc");
    #/
    if (!isdefined(lootid) || !isdefined(quantity)) {
        return undefined;
    }
    var_a1093166de09e6b8 = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (!function_7e103028c464ab9a(var_a1093166de09e6b8)) {
        return 0;
    }
    if (namespace_cb965d2f71fefddc::function_d345eec68e01361f(lootid)) {
        return isdefined(getAvailableDMZBackpackIndex());
    }
    return canItemFitInBackpack(lootid, quantity);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25de
// Size: 0x5a
function getTotalItemCountInBag(lootid) {
    total = 0;
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_f1cbc68c79ebf1ea = function_6196d9ea9a30e609(i);
        if (var_f1cbc68c79ebf1ea == lootid) {
            total = total + function_897b29adb37f06a7(i);
        }
    }
    return total;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2640
// Size: 0x54
function function_6fe7e7891d125c48(player) {
    total = 0;
    for (i = 0; i < function_b13e35608b336d65(player); i++) {
        var_f1cbc68c79ebf1ea = player function_6196d9ea9a30e609(i);
        if (var_f1cbc68c79ebf1ea) {
            total = total + 1;
        }
    }
    return total;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x269c
// Size: 0x45
function function_474484ee8653086f(player) {
    for (i = 0; i < function_b13e35608b336d65(player); i++) {
        var_f1cbc68c79ebf1ea = player function_6196d9ea9a30e609(i);
        if (var_f1cbc68c79ebf1ea) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e9
// Size: 0x5a
function function_5915bdbc5f6302b6(var_60452e1fc245c1) {
    var_b623b9953b720a12 = [];
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_f1cbc68c79ebf1ea = function_6196d9ea9a30e609(i);
        if (namespace_3c37cb17ade254d::array_contains(var_60452e1fc245c1, var_f1cbc68c79ebf1ea)) {
            var_b623b9953b720a12[var_b623b9953b720a12.size] = i;
        }
    }
    return var_b623b9953b720a12;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x274b
// Size: 0x75
function function_a1ef7227cd878384() {
    var_b623b9953b720a12 = [];
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_f1cbc68c79ebf1ea = function_6196d9ea9a30e609(i);
        ref = function_793e8a72cedb8ef3(var_f1cbc68c79ebf1ea);
        if (array_contains(level.br_pickups.br_killstreakreference, ref)) {
            var_b623b9953b720a12[var_b623b9953b720a12.size] = i;
        }
    }
    return var_b623b9953b720a12;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27c8
// Size: 0x75
function function_69f1f154cb91d491() {
    var_b623b9953b720a12 = [];
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_f1cbc68c79ebf1ea = function_6196d9ea9a30e609(i);
        ref = function_793e8a72cedb8ef3(var_f1cbc68c79ebf1ea);
        if (array_contains(level.br_pickups.br_superreference, ref)) {
            var_b623b9953b720a12[var_b623b9953b720a12.size] = i;
        }
    }
    return var_b623b9953b720a12;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2845
// Size: 0x48
function function_91a0bab850d7db10(index, lootid, maxcount, var_9610a859db3f00cc, var_e30b916adc1e2dc8) {
    var_f94e260ac3c6121e = var_e30b916adc1e2dc8 + var_9610a859db3f00cc - maxcount;
    thread function_e900e7e66383ad97(self, index, maxcount);
    return var_f94e260ac3c6121e;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2895
// Size: 0x1a8
function private setBackpackItem(lootid, pickup) {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("setBackpackItem")) {
        result = namespace_71073fa38f11492::runbrgametypefunc("setBackpackItem", lootid, pickup);
        if (result >= 0) {
            return result;
        }
    }
    quantity = pickup.count;
    maxcount = level.br_pickups.var_4138f9ddc1cd22d[pickup.scriptablename];
    if (!isdefined(maxcount) || maxcount == 0) {
        maxcount = level.br_pickups.maxcounts[pickup.scriptablename];
    }
    ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    if (namespace_cb965d2f71fefddc::function_f5082b4fc43ef59b(ref)) {
        for (i = 0; i < function_b13e35608b336d65(self); i++) {
            var_eeeae9defa0c1e95 = function_6196d9ea9a30e609(i);
            if (var_eeeae9defa0c1e95 == lootid) {
                var_e30b916adc1e2dc8 = function_897b29adb37f06a7(i);
                if (var_e30b916adc1e2dc8 + quantity <= maxcount) {
                    function_11f48ae5b87b4525(self, i, lootid, var_e30b916adc1e2dc8 + quantity);
                    return 0;
                } else {
                    quantity = function_91a0bab850d7db10(i, lootid, maxcount, quantity, var_e30b916adc1e2dc8);
                }
            }
            if (quantity <= 0) {
                return 0;
            }
        }
    }
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        var_eeeae9defa0c1e95 = function_6196d9ea9a30e609(i);
        if (var_eeeae9defa0c1e95 == 0 && var_eeeae9defa0c1e95 != lootid) {
            if (quantity <= maxcount) {
                function_11f48ae5b87b4525(self, i, lootid, quantity);
                return 0;
            } else {
                function_11f48ae5b87b4525(self, i, lootid, maxcount);
                quantity = quantity - maxcount;
            }
        }
        if (quantity <= 0) {
            return 0;
        }
    }
    return quantity;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a45
// Size: 0x66
function addItemToBackpackByRef(ref, type, quantity) {
    lootid = namespace_38b993c4618e76cd::function_a50b607d2500dda5(ref);
    var_60227bff1e9478cc = spawnstruct();
    var_60227bff1e9478cc.scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    var_60227bff1e9478cc.count = quantity;
    return addItemToBackpack(lootid, var_60227bff1e9478cc);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab3
// Size: 0x63b
function addItemToBackpack(lootid, pickup, var_70e660487c2924ec, var_c751296a033cdb3c, var_7f437a5779c8787c) {
    /#
        assertex(isdefined(lootid) || isdefined(pickup), "lootID or pickup not defined in addItemToBackpack in br_dmz_inventory.gsc");
    #/
    if (!isdefined(lootid) || !isdefined(pickup)) {
        return;
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined(lootid, "pickedUp")) {
        result = namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2(lootid, "pickedUp", pickup.instance, self);
        if (isdefined(result)) {
            return;
        }
    }
    if (namespace_cb965d2f71fefddc::function_d345eec68e01361f(lootid, pickup.scriptablename)) {
        index = getAvailableDMZBackpackIndex();
        if (!isdefined(index)) {
            return 0;
        }
        function_71e56bb092fd2574(lootid);
        thread function_11f48ae5b87b4525(self, index, lootid, pickup.count);
        return 0;
    } else if (namespace_cb965d2f71fefddc::function_df3f5431c93ed5a1(undefined, pickup.scriptablename)) {
        index = getAvailableDMZBackpackIndex();
        if (!isdefined(index)) {
            return 0;
        }
        namespace_ea497db8cab34561::function_60d5992f51286201();
    } else if (namespace_cb965d2f71fefddc::function_e4b6260dbb04b43d(pickup.scriptablename)) {
        index = getAvailableDMZBackpackIndex();
        if (!isdefined(index)) {
            return 0;
        }
        namespace_6c622b52017c6808::function_bc0879c9aa2863a3(self, pickup, index);
    }
    namespace_27c74152ccb91331::function_81f5578aed261da1(self);
    if (namespace_d3d40f75bb4e4c32::isammo(pickup.scriptablename)) {
        if (self.br_ammo[pickup.scriptablename] < level.var_e6ea72fc5e3fcd00[pickup.scriptablename] && namespace_3bcd40a3005712ec::function_d885e66811ee3a4d(pickup.scriptablename)) {
            var_5718fab182f37d81 = level.var_e6ea72fc5e3fcd00[pickup.scriptablename] - self.br_ammo[pickup.scriptablename];
            var_c1192c297bbf292f = int(min(var_5718fab182f37d81, pickup.count));
            if (istrue(pickup.isautouse) && namespace_cb965d2f71fefddc::function_e44c2d69db881894(pickup.scriptablename)) {
                self.br_ammo[pickup.scriptablename] = self.br_ammo[pickup.scriptablename] + var_c1192c297bbf292f;
                namespace_3bcd40a3005712ec::br_ammo_player_hud_update_ammotype(pickup.scriptablename);
                namespace_3bcd40a3005712ec::br_ammo_update_weapons(self);
                quantity = pickup.count - var_c1192c297bbf292f;
                dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
                if (isdefined(var_c751296a033cdb3c)) {
                    dropstruct.count = var_c751296a033cdb3c;
                }
                var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, undefined, pickup.var_96c7526f4ab04875, undefined, undefined, pickup.origin);
                item = namespace_cb965d2f71fefddc::spawnpickup(pickup.scriptablename, var_cb4fad49263e20c4, quantity, 1, undefined, 0);
                return 0;
            } else {
                namespace_3bcd40a3005712ec::br_ammo_give_type(self, pickup.scriptablename, var_c1192c297bbf292f);
                pickup.count = pickup.count - var_c1192c297bbf292f;
            }
        } else if (istrue(pickup.isautouse) && namespace_cb965d2f71fefddc::function_e44c2d69db881894(pickup.scriptablename) && !getdvarint(@"hash_b5db5ff4b3f9e052", 0) && getdvarint(@"hash_d116b9023292a13e", 1)) {
            var_57acbdc40b2f2db = function_280230feed0c006(pickup.scriptablename);
            quantity = var_57acbdc40b2f2db[1];
            index = var_57acbdc40b2f2db[0];
            maxstack = function_e02526fc6db8443f(pickup.scriptablename);
            if (quantity >= 0 && isdefined(maxstack) && quantity + pickup.count > maxstack) {
                var_cf3b8ce798a5a08 = pickup.count;
                pickup.count = maxstack - quantity;
                var_cf3b8ce798a5a08 = var_cf3b8ce798a5a08 - pickup.count;
                dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
                if (isdefined(var_c751296a033cdb3c)) {
                    dropstruct.count = var_c751296a033cdb3c;
                }
                var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, undefined, pickup.var_96c7526f4ab04875, undefined, undefined, pickup.origin);
                item = namespace_cb965d2f71fefddc::spawnpickup(pickup.scriptablename, var_cb4fad49263e20c4, var_cf3b8ce798a5a08, 1, undefined, 0);
            }
        }
    }
    quantity = setBackpackItem(lootid, pickup);
    if (quantity > 0) {
        if (!istrue(var_70e660487c2924ec)) {
            baseorigin = self.origin;
            baseangles = self.angles;
            dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
            var_96c7526f4ab04875 = pickup.var_96c7526f4ab04875;
            var_7591ed99e87a77d3 = pickup.origin;
            if (istrue(var_7f437a5779c8787c) && isdefined(self.br_kiosk) && isdefined(self.br_kiosk.dropstruct)) {
                var_e1d097c517c3af5b = self.br_kiosk namespace_cb965d2f71fefddc::function_4f4d537c794b2bf5();
                self.br_kiosk.dropstruct.var_dfba5a2c3c6f0a07 = var_e1d097c517c3af5b;
                dropstruct = self.br_kiosk.dropstruct;
                baseorigin = function_53c4c53197386572(self.br_kiosk.var_afc028d00356e443, self.br_kiosk.origin);
                baseangles = self.br_kiosk.angles;
                var_7591ed99e87a77d3 = undefined;
                var_96c7526f4ab04875 = undefined;
            } else if (isdefined(pickup.dropstruct)) {
                dropstruct = pickup.dropstruct;
            }
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, self, undefined, var_96c7526f4ab04875, undefined, undefined, var_7591ed99e87a77d3);
            item = namespace_cb965d2f71fefddc::spawnpickup(pickup.scriptablename, var_cb4fad49263e20c4, quantity, 1, undefined, 0);
            if (isdefined(pickup.dropstruct)) {
                pickup.dropstruct = dropstruct;
            }
            return 0;
        } else {
            return quantity;
        }
    }
    return 0;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30f6
// Size: 0xbd
function function_db1dd76061352e5b(index, var_74806f0c4caa7e55, var_f3990d8529de3a54) {
    if (!function_e37ca8120dc19c6a()) {
        return 0;
    }
    var_57ad0dc40b2fdda = function_6738846da50730f1(index);
    _ = var_57ad0dc40b2fdda[2];
    _ = var_57ad0dc40b2fdda[1];
    lootid = var_57ad0dc40b2fdda[0];
    var_ff239359935aa777 = function_897b29adb37f06a7(index);
    if (!isdefined(var_74806f0c4caa7e55)) {
        var_74806f0c4caa7e55 = var_ff239359935aa777;
    }
    var_a28bd7f30254c8a0 = int(max(0, var_ff239359935aa777 - var_74806f0c4caa7e55));
    thread function_e900e7e66383ad97(self, index, var_a28bd7f30254c8a0, var_f3990d8529de3a54);
    var_2713f4a3502d1624 = function_91c1be871300a518(lootid);
    function_6355a9db4ea7ab55(lootid);
    return lootid;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31bb
// Size: 0x2e
function function_d63a7299c6203bf9(lootid) {
    if (!function_e37ca8120dc19c6a()) {
        return 0;
    }
    index = function_e05897f5d860188e(lootid, undefined, 1);
    return isdefined(index);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f1
// Size: 0x6b
function function_6f39f9916649ac48(lootid, quantity) {
    if (!function_e37ca8120dc19c6a()) {
        return 0;
    }
    itemtype = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
    if (itemtype == "weapon") {
        function_954372d604277278(self);
        return;
    }
    index = function_e05897f5d860188e(lootid, undefined, 1);
    if (!isdefined(index)) {
        return 0;
    }
    function_db1dd76061352e5b(index, quantity);
    return 1;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3264
// Size: 0x73
function function_43f9da47b5084ce0(scriptablename) {
    if (!function_e37ca8120dc19c6a()) {
        return 0;
    }
    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptablename);
    var_571e17e8c6bc38c6 = 0;
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        if (function_6196d9ea9a30e609(i) == lootid) {
            var_571e17e8c6bc38c6 = var_571e17e8c6bc38c6 + function_897b29adb37f06a7(i);
            function_db1dd76061352e5b(i);
        }
    }
    return var_571e17e8c6bc38c6;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32df
// Size: 0x11e
function removeSmallestItemStackBackpack(scriptablename, var_940774b1f9d551a3) {
    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptablename);
    /#
        assertex(isdefined(lootid), "lootID not defined in removeSmallestItemStackBackpack");
    #/
    if (!isdefined(lootid)) {
        return;
    }
    var_750fcc188317845a = [];
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        if (function_6196d9ea9a30e609(i) == lootid) {
            var_750fcc188317845a[i] = function_897b29adb37f06a7(i);
        }
    }
    if (var_750fcc188317845a.size <= 0) {
        return var_940774b1f9d551a3;
    }
    var_5581023a8fc8d56d = tablesort(var_750fcc188317845a, "up");
    foreach (index in var_5581023a8fc8d56d) {
        var_e30b916adc1e2dc8 = function_897b29adb37f06a7(index);
        if (var_940774b1f9d551a3 <= var_e30b916adc1e2dc8) {
            function_db1dd76061352e5b(index, var_940774b1f9d551a3);
            return 0;
        }
        var_940774b1f9d551a3 = var_940774b1f9d551a3 - var_e30b916adc1e2dc8;
        function_db1dd76061352e5b(index, var_e30b916adc1e2dc8);
    }
    return var_940774b1f9d551a3;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3405
// Size: 0xcb
function function_280230feed0c006(scriptablename) {
    if (!isdefined(scriptablename)) {
        return undefined;
    }
    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptablename);
    backpackSize = function_b13e35608b336d65(self);
    var_cf2620907b40f599 = -1;
    var_56120302dfee9eed = undefined;
    for (i = 0; i < backpackSize; i++) {
        var_57acfdc40b2fba7 = function_6738846da50730f1(i);
        _ = var_57acfdc40b2fba7[2];
        quantity = var_57acfdc40b2fba7[1];
        var_22293f90436ea191 = var_57acfdc40b2fba7[0];
        if (lootid == var_22293f90436ea191 && quantity > var_cf2620907b40f599) {
            var_cf2620907b40f599 = quantity;
            var_56120302dfee9eed = i;
        }
    }
    return [0:var_56120302dfee9eed, 1:var_cf2620907b40f599];
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34d8
// Size: 0xb6
function function_49a39674c4a064e3(scriptablename) {
    if (!isdefined(scriptablename)) {
        return 0;
    }
    maxcount = function_e02526fc6db8443f(scriptablename);
    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptablename);
    backpackSize = function_b13e35608b336d65(self);
    for (i = 0; i < backpackSize; i++) {
        var_57ac4dc40b2e376 = function_6738846da50730f1(i);
        _ = var_57ac4dc40b2e376[2];
        quantity = var_57ac4dc40b2e376[1];
        var_22293f90436ea191 = var_57ac4dc40b2e376[0];
        if (lootid == var_22293f90436ea191 && quantity >= maxcount) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3596
// Size: 0x5b
function function_e02526fc6db8443f(scriptablename) {
    if (!isdefined(scriptablename) || !isdefined(level.br_pickups.var_4138f9ddc1cd22d) || !isdefined(level.br_pickups.var_4138f9ddc1cd22d[scriptablename])) {
        return undefined;
    }
    return level.br_pickups.var_4138f9ddc1cd22d[scriptablename];
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35f9
// Size: 0x5b
function function_c578cff4de96af82(scriptablename) {
    if (!isdefined(scriptablename) || !isdefined(level.br_pickups.var_4183295edcc21db0) || !isdefined(level.br_pickups.var_4183295edcc21db0[scriptablename])) {
        return undefined;
    }
    return level.br_pickups.var_4183295edcc21db0[scriptablename];
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x365c
// Size: 0xb1
function function_d9749a7ab0c838d3(scriptablename) {
    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptablename);
    /#
        assertex(isdefined(lootid), "lootID not defined in getSmallestItemStackBackpackIndex");
    #/
    if (!isdefined(lootid)) {
        return;
    }
    var_50dcba8ba0e8511e = undefined;
    var_8fc76cf32bb0e10d = undefined;
    for (i = 0; i < function_b13e35608b336d65(self); i++) {
        if (function_6196d9ea9a30e609(i) == lootid) {
            quantity = function_897b29adb37f06a7(i);
            /#
                assert(isdefined(quantity));
            #/
            if (!isdefined(var_50dcba8ba0e8511e) || var_50dcba8ba0e8511e > quantity) {
                var_50dcba8ba0e8511e = quantity;
                var_8fc76cf32bb0e10d = i;
            }
        }
    }
    return [0:var_8fc76cf32bb0e10d, 1:var_50dcba8ba0e8511e];
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3715
// Size: 0xbd
function function_93f02514431a1f5d(lootid) {
    var_ff239359935aa777 = 0;
    index = function_106b52ed8f680043(lootid);
    if (!isdefined(index)) {
        return var_ff239359935aa777;
    }
    backpackSize = function_b13e35608b336d65(self);
    for (i = index; i < backpackSize; i++) {
        var_57ac5dc40b2e5a9 = function_6738846da50730f1(i);
        _ = var_57ac5dc40b2e5a9[2];
        _ = var_57ac5dc40b2e5a9[1];
        var_22293f90436ea191 = var_57ac5dc40b2e5a9[0];
        if (lootid == var_22293f90436ea191) {
            if (namespace_cb965d2f71fefddc::function_d345eec68e01361f(lootid)) {
                var_ff239359935aa777 = var_ff239359935aa777 + 1;
            } else {
                var_ff239359935aa777 = function_897b29adb37f06a7(i) + var_ff239359935aa777;
            }
        }
    }
    return var_ff239359935aa777;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37da
// Size: 0xc7
function function_ef5c7ec55e0e20ee(lootid) {
    index = function_106b52ed8f680043(lootid);
    if (!isdefined(index)) {
        return 0;
    }
    if (!isdefined(self.team)) {
        return function_93f02514431a1f5d(index);
    }
    teamplayers = namespace_54d20dd0dd79277f::getteamdata(self.team, "players");
    var_fb01ee55b395fa5 = 0;
    foreach (player in teamplayers) {
        var_25885a6a7c97bc01 = player function_93f02514431a1f5d(lootid);
        var_fb01ee55b395fa5 = var_fb01ee55b395fa5 + var_25885a6a7c97bc01;
    }
    return var_fb01ee55b395fa5;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38a9
// Size: 0x111
function function_71e56bb092fd2574(lootid) {
    if (!isdefined(lootid)) {
        return;
    }
    type = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
    ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    switch (type) {
    case #"hash_1cac65e1b8bf24a7":
    case #"hash_27124c6c97ccffa1":
    case #"hash_325cb2e66f67d5b9":
    case #"hash_339227cb650975db":
    case #"hash_511d3c24fcedcdb1":
    case #"hash_850999d7864fa3b4":
    case #"hash_93c71e7b6c0b81d7":
    case #"hash_ab671284a3fc4e3d":
    case #"hash_b60679835e82a584":
    case #"hash_e534fd8ec73eafb4":
        
    case #"hash_7d516d84d0a82f2":
        if (isdefined(level.var_b33c035c483c2893) && isdefined(level.var_b33c035c483c2893["onPickup"]) && isdefined(level.var_b33c035c483c2893["onPickup"][ref])) {
            [[ level.var_b33c035c483c2893["onPickup"][ref] ]](self);
        }
        return;
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39c2
// Size: 0x123
function function_6355a9db4ea7ab55(lootid) {
    if (!isdefined(lootid)) {
        return;
    }
    type = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
    if (!isdefined(type)) {
        return;
    }
    ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    switch (type) {
    case #"hash_ff2e175bfcc4f32":
    case #"hash_1cac65e1b8bf24a7":
    case #"hash_27124c6c97ccffa1":
    case #"hash_325cb2e66f67d5b9":
    case #"hash_339227cb650975db":
    case #"hash_511d3c24fcedcdb1":
    case #"hash_850999d7864fa3b4":
    case #"hash_93c71e7b6c0b81d7":
    case #"hash_ab671284a3fc4e3d":
    case #"hash_b60679835e82a584":
    case #"hash_e534fd8ec73eafb4":
        
    case #"hash_7d516d84d0a82f2":
        if (isdefined(level.var_b33c035c483c2893) && isdefined(level.var_b33c035c483c2893["onDrop"]) && isdefined(level.var_b33c035c483c2893["onDrop"][ref])) {
            [[ level.var_b33c035c483c2893["onDrop"][ref] ]](self);
        }
        return;
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aed
// Size: 0x14
function function_36b1968bfe78916b(lootid) {
    return isdefined(function_106b52ed8f680043(lootid));
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b09
// Size: 0x77
function function_3ab0a87eeaa203bf() {
    if (!istrue(level.var_2c93542553c664f5)) {
        return 0;
    }
    foreach (weaponobj in self.primaryinventory) {
        if (weaponobj.basename == "iw9_me_fists_mp") {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b88
// Size: 0x32
function function_5e7049647595ab97() {
    if (!level.var_1d814f83596d0a02) {
        return 0;
    }
    return isdefined(self.equipment["super"]) && namespace_1a507865f681850e::getequipmentslotammo("super") > 0;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bc2
// Size: 0x5b
function function_d674d32c2d3ba5ed(player) {
    if (!istrue(level.var_472d7a6d15e57940)) {
        return 0;
    }
    return isdefined(player.streakdata) && isdefined(player.streakdata.streaks) && self.streakdata.streaks.size > 0;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c25
// Size: 0x3f
function function_5bf048439a846222(var_c0fce415cdb283c2) {
    return var_c0fce415cdb283c2 == "equip_c4" || var_c0fce415cdb283c2 == "equip_throwing_knife" || var_c0fce415cdb283c2 == "equip_claymore" || var_c0fce415cdb283c2 == "equip_at_mine" || var_c0fce415cdb283c2 == "equip_throwing_knife_fire";
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c6c
// Size: 0x214
function function_8237b4eeab275f08(player, slot, var_c0fce415cdb283c2) {
    if (!isdefined(player) || !isdefined(slot)) {
        return 0;
    }
    if (function_5bf048439a846222(var_c0fce415cdb283c2)) {
        return 0;
    }
    if (getdvarint(@"hash_ced962345ff6ecd0", 0)) {
        return 0;
    }
    var_32ad03c5b4a0887d = undefined;
    var_54697b28405e2f94 = "";
    var_3b04a55bcba2273a = 0;
    var_28d82fb085befa70 = 0;
    for (var_a6f8d8115e0f1e79 = 0; var_a6f8d8115e0f1e79 < function_b13e35608b336d65(player); var_a6f8d8115e0f1e79++) {
        quantity = player function_897b29adb37f06a7(var_a6f8d8115e0f1e79);
        lootid = player function_6196d9ea9a30e609(var_a6f8d8115e0f1e79);
        if (quantity > 0 && lootid > 0) {
            type = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
            if (type == "equipment") {
                var_cb325ddb4a764623 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
                if (isdefined(var_c0fce415cdb283c2) && isdefined(var_cb325ddb4a764623) && var_cb325ddb4a764623 == var_c0fce415cdb283c2) {
                    var_32ad03c5b4a0887d = var_a6f8d8115e0f1e79;
                    var_54697b28405e2f94 = var_cb325ddb4a764623;
                    var_3b04a55bcba2273a = quantity;
                    var_28d82fb085befa70 = lootid;
                    break;
                } else if (!isdefined(var_32ad03c5b4a0887d)) {
                    itemslot = namespace_1a507865f681850e::getdefaultslot(var_cb325ddb4a764623);
                    if (isdefined(itemslot) && itemslot == slot) {
                        var_32ad03c5b4a0887d = var_a6f8d8115e0f1e79;
                        var_54697b28405e2f94 = var_cb325ddb4a764623;
                        var_3b04a55bcba2273a = quantity;
                        var_28d82fb085befa70 = lootid;
                    }
                }
            }
        }
    }
    if (isdefined(var_32ad03c5b4a0887d)) {
        player namespace_1a507865f681850e::giveequipment(var_54697b28405e2f94, slot);
        player namespace_1a507865f681850e::setequipmentammo(var_54697b28405e2f94, var_3b04a55bcba2273a);
        if (var_54697b28405e2f94 == "equip_hb_sensor") {
            namespace_8a392daf295e43f8::function_30cd943d877dc29f(var_3b04a55bcba2273a);
            namespace_aead94004cf4c147::function_db1dd76061352e5b(var_32ad03c5b4a0887d);
        } else {
            var_402526809b38da5f = player namespace_1a507865f681850e::getequipmentmaxammo(var_54697b28405e2f94);
            var_3fa041e4f059bc71 = min(var_402526809b38da5f, var_3b04a55bcba2273a);
            var_e8db6afbf2180f7e = function_897b29adb37f06a7(var_32ad03c5b4a0887d);
            player function_84772ebf836af5db(var_32ad03c5b4a0887d, -1 * var_3fa041e4f059bc71);
            namespace_a38a2e1fe7519183::function_f5b2810055f85ead(player, slot, var_28d82fb085befa70);
        }
        player setclientomnvar("ui_notify_show_minimal_hud", gettime());
        return 1;
    }
    return 0;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e88
// Size: 0x207
function function_2c226f050114f4b2(dropstruct, victim) {
    for (var_a6f8d8115e0f1e79 = 0; var_a6f8d8115e0f1e79 < function_b13e35608b336d65(victim); var_a6f8d8115e0f1e79++) {
        quantity = victim function_897b29adb37f06a7(var_a6f8d8115e0f1e79);
        lootid = victim function_6196d9ea9a30e609(var_a6f8d8115e0f1e79);
        if (quantity > 0 && lootid > 0) {
            if (namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(lootid)) {
                var_c00a30624996364f = namespace_85cd45b4fe0d86fb::function_379463a84adb07b4(quantity);
                var_dab81ead77442a10 = var_c00a30624996364f[2];
                var_59bd51afc73df2cd = var_c00a30624996364f[1];
                itemcount = var_c00a30624996364f[0];
                var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, victim.origin, victim.angles, victim);
                var_dd070161709fa76 = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
                dogtag = namespace_cb965d2f71fefddc::spawnpickup(var_dd070161709fa76, var_cb4fad49263e20c4, itemcount, 0, undefined, 0, var_59bd51afc73df2cd, var_dab81ead77442a10);
                victim namespace_cb965d2f71fefddc::function_2f4e0022c686dbe6(dogtag);
            } else if (function_2d86ba79a58bb62(lootid)) {
                victim namespace_bd614c3c2275579a::function_f9ff7c89b3792ccc(dropstruct, victim.blacksite);
            } else if (isdefined(namespace_6c622b52017c6808::function_96a1620d901981d1(lootid, 5))) {
                victim namespace_cb965d2f71fefddc::function_b41950c9b54b12e0(dropstruct, var_a6f8d8115e0f1e79, lootid);
            } else if (namespace_708f627020de59d3::function_f647113719f5139b(lootid)) {
                victim namespace_708f627020de59d3::function_3af23b0bfaf91dbd(dropstruct, undefined, undefined, var_a6f8d8115e0f1e79);
            } else if (namespace_a8b2b88699fc40fb::function_55f0daea8408e3a9(lootid)) {
                victim namespace_a8b2b88699fc40fb::function_5128a1edcec1c6e0();
            } else {
                var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, victim.origin, victim.angles, victim);
                var_dd070161709fa76 = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
                var_bb9e46e1d8130f2 = istrue(level.br_pickups.br_hasautopickup[var_dd070161709fa76]);
                item = namespace_cb965d2f71fefddc::spawnpickup(var_dd070161709fa76, var_cb4fad49263e20c4, quantity, 1, undefined, var_bb9e46e1d8130f2);
                victim namespace_cb965d2f71fefddc::function_2f4e0022c686dbe6(item);
            }
        }
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4096
// Size: 0x1e0
function function_5814f4f8710e57f7(victim, dropstruct) {
    var_4ff6e95896e65939 = [];
    var_badde91d16301be4 = 0;
    var_94333580dc2b96b = 0;
    for (var_a6f8d8115e0f1e79 = 0; var_a6f8d8115e0f1e79 < function_b13e35608b336d65(victim); var_a6f8d8115e0f1e79++) {
        quantity = victim function_897b29adb37f06a7(var_a6f8d8115e0f1e79);
        lootid = victim function_6196d9ea9a30e609(var_a6f8d8115e0f1e79);
        if (quantity > 0 && lootid > 0) {
            if (function_2d86ba79a58bb62(lootid)) {
                victim namespace_bd614c3c2275579a::function_f9ff7c89b3792ccc(dropstruct, victim.blacksite);
            } else if (isdefined(namespace_6c622b52017c6808::function_96a1620d901981d1(lootid, 5))) {
                victim namespace_cb965d2f71fefddc::function_b41950c9b54b12e0(dropstruct, var_a6f8d8115e0f1e79, lootid);
            } else {
                if (function_f6f8c1fc9549eaf6(lootid)) {
                    if (getdvarint(@"hash_f5f97aec0784002a", 1)) {
                        var_918249fd5219a579 = namespace_a8b2b88699fc40fb::function_4e271ae7bc17f13c(victim, dropstruct);
                        victim namespace_cb965d2f71fefddc::function_2f4e0022c686dbe6(var_918249fd5219a579);
                        continue;
                    } else {
                        var_94333580dc2b96b = 1;
                    }
                }
                var_4ff6e95896e65939[var_a6f8d8115e0f1e79] = [];
                var_4ff6e95896e65939[var_a6f8d8115e0f1e79]["lootID"] = lootid;
                var_4ff6e95896e65939[var_a6f8d8115e0f1e79]["quantity"] = quantity;
                var_badde91d16301be4++;
            }
        }
    }
    if (istrue(level.var_f478c1f94caa7e9) && istrue(level.var_a3499c286ac570e4)) {
        if (namespace_aead94004cf4c147::function_efab78b72d131d76(victim)) {
            var_badde91d16301be4++;
        }
    }
    dogtag = undefined;
    if (getdvarint(@"hash_6d0beef651f58a69", 0)) {
        victim namespace_cb965d2f71fefddc::function_a61f07010c727c0a(dropstruct);
    } else if (namespace_85cd45b4fe0d86fb::function_c07675f2ce32fcb5(victim)) {
        var_123d6d777458b852 = namespace_85cd45b4fe0d86fb::function_57711583c5d26490(victim);
        if (isdefined(var_123d6d777458b852)) {
            namespace_85cd45b4fe0d86fb::function_bc03aa369196f2bf(victim, 0);
            dogtag = [];
            dogtag["lootID"] = namespace_85cd45b4fe0d86fb::function_777013e79be19c16(victim);
            dogtag["quantity"] = var_123d6d777458b852;
        }
    }
    return [0:var_4ff6e95896e65939, 1:var_94333580dc2b96b, 2:dogtag];
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x427e
// Size: 0x294
function function_45013dfe9531841f(victim, dogtag) {
    var_8919314d1df8d669 = victim namespace_aead94004cf4c147::function_88a168912191ec3e(1, 1);
    var_bf23a60678978c19 = [];
    index = 0;
    var_7803c95645e637e1 = 1;
    var_4f6cde716e0c3d7 = undefined;
    var_6fb67c8525b1d79e = undefined;
    var_ec22a950f210e39 = undefined;
    var_dfdb8aefc4328ea0 = undefined;
    if (isdefined(var_8919314d1df8d669)) {
        foreach (indextype, itemtype in var_8919314d1df8d669) {
            if (!itemtype.size) {
                var_bf23a60678978c19[index] = [];
                var_bf23a60678978c19[index]["lootID"] = 0;
                var_bf23a60678978c19[index]["quantity"] = 0;
                index++;
            } else {
                foreach (var_e1d097c517c3af5b, slot in itemtype) {
                    if (!isdefined(slot) && indextype != 1) {
                        var_bf23a60678978c19[index] = [];
                        var_bf23a60678978c19[index]["lootID"] = 0;
                        var_bf23a60678978c19[index]["quantity"] = 0;
                        index++;
                    } else {
                        lootid = slot[0];
                        quantity = slot[1];
                        if (!isdefined(lootid) || !isdefined(quantity)) {
                            continue;
                        }
                        if (indextype == 1) {
                            if (itemtype.size > 1) {
                                if (!var_7803c95645e637e1) {
                                    var_4f6cde716e0c3d7 = lootid;
                                    var_6fb67c8525b1d79e = slot[2];
                                } else {
                                    var_ec22a950f210e39 = slot[2];
                                    var_dfdb8aefc4328ea0 = var_e1d097c517c3af5b;
                                }
                                var_7803c95645e637e1 = 0;
                            }
                        } else {
                            var_bf23a60678978c19[index] = [];
                            var_bf23a60678978c19[index]["lootID"] = lootid;
                            var_bf23a60678978c19[index]["quantity"] = quantity;
                            index++;
                        }
                    }
                }
            }
        }
    }
    if (isdefined(dogtag)) {
        var_bf23a60678978c19[8] = [];
        var_bf23a60678978c19[8]["lootID"] = dogtag["lootID"];
        var_bf23a60678978c19[8]["quantity"] = dogtag["quantity"];
        index++;
    }
    if (isdefined(victim.var_cd82e790e825db2)) {
        var_bf23a60678978c19[9] = [];
        var_bf23a60678978c19[9]["lootID"] = victim.var_cda8c241effb412a;
        var_bf23a60678978c19[9]["quantity"] = 1;
        index++;
    }
    var_275f4441ab7920c8 = namespace_3bcd40a3005712ec::function_1a561e5ef2eca63a(victim, var_6fb67c8525b1d79e);
    return [0:var_bf23a60678978c19, 1:var_6fb67c8525b1d79e, 2:var_4f6cde716e0c3d7, 3:var_275f4441ab7920c8, 4:var_ec22a950f210e39, 5:var_dfdb8aefc4328ea0];
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x451a
// Size: 0x737
function function_c6b3799b231916bb(victim, dropstruct) {
    if (istrue(victim.extracted)) {
        return;
    }
    var_c00a316249963882 = function_5814f4f8710e57f7(victim, dropstruct);
    dogtag = var_c00a316249963882[2];
    var_94333580dc2b96b = var_c00a316249963882[1];
    var_4ff6e95896e65939 = var_c00a316249963882[0];
    var_c00a346249963f1b = function_45013dfe9531841f(victim, dogtag);
    var_dfdb8aefc4328ea0 = var_c00a346249963f1b[5];
    var_ec22a950f210e39 = var_c00a346249963f1b[4];
    var_c31356a794d8cb46 = var_c00a346249963f1b[3];
    var_c299c08e4b8a8e56 = var_c00a346249963f1b[2];
    var_a0e9fef038504bd0 = var_c00a346249963f1b[1];
    var_bf23a60678978c19 = var_c00a346249963f1b[0];
    if (var_4ff6e95896e65939.size > 0 || var_bf23a60678978c19.size > 0) {
        if (istrue(level.useLootableCorpse) && namespace_cd0b2d039510b38d::isteamreviveenabled() && !getdvarint(@"hash_4536e887a50f692e", 0)) {
            var_4f6cde716e0c3d7 = undefined;
            var_6fb67c8525b1d79e = undefined;
            var_3ef503345dc57957 = undefined;
            var_86b32aff94b5714e = undefined;
            var_275f4441ab7920c8 = undefined;
            var_8348f10d08dad67a = undefined;
            var_b19049daab6b92cb = undefined;
            if (namespace_aead94004cf4c147::function_efab78b72d131d76(victim)) {
                var_4f6cde716e0c3d7 = function_d9b1550011525161(victim);
                var_6fb67c8525b1d79e = function_2985254128b1c262(victim);
                var_3ef503345dc57957 = ter_op(isdefined(victim.var_3ef503345dc57957), victim.var_3ef503345dc57957, weaponclipsize(var_6fb67c8525b1d79e));
                if (namespace_68e641469fde3fa7::isakimbo(var_6fb67c8525b1d79e)) {
                    var_b19049daab6b92cb = ter_op(isdefined(victim.var_ad7897ecdbcb63), victim.var_ad7897ecdbcb63, weaponclipsize(var_6fb67c8525b1d79e));
                }
                var_275f4441ab7920c8 = function_86a5c7670325346b(victim, 2);
                if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
                    var_8348f10d08dad67a = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, 2);
                }
                if (var_6fb67c8525b1d79e.hasalternate) {
                    var_b6ff735c3690cc44 = var_6fb67c8525b1d79e getaltweapon();
                    var_86b32aff94b5714e = ter_op(isdefined(victim.var_86b32aff94b5714e), victim.var_86b32aff94b5714e, weaponclipsize(var_b6ff735c3690cc44));
                }
            }
            var_9d09471027604346 = undefined;
            if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7() && isdefined(var_a0e9fef038504bd0) && isdefined(var_c299c08e4b8a8e56)) {
                var_9d09471027604346 = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, 1);
            }
            namespace_7db13bdf599e41a6::function_9341574d596e9d36(victim, var_4ff6e95896e65939, 6, namespace_85cd45b4fe0d86fb::function_fb2923d9d7eb7aac(victim), var_4f6cde716e0c3d7, var_6fb67c8525b1d79e, var_3ef503345dc57957, var_86b32aff94b5714e, var_275f4441ab7920c8, var_94333580dc2b96b, var_bf23a60678978c19, var_c299c08e4b8a8e56, var_a0e9fef038504bd0, var_8348f10d08dad67a, var_9d09471027604346, var_c31356a794d8cb46, var_b19049daab6b92cb);
        } else {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, victim.origin, victim.angles, victim);
            teamindex = namespace_3c37cb17ade254d::array_find(level.allteamnamelist, victim.team);
            squadindex = victim.var_3f78c6a0862f9e25;
            if (squadindex < 0 && isdefined(victim.var_71afb85ec1cc06f8)) {
                squadindex = victim.var_71afb85ec1cc06f8;
            }
            var_87583859f07b58e3 = victim namespace_cb965d2f71fefddc::spawnpickup(function_432475069c798ddc(self.attached_bag), var_cb4fad49263e20c4, 1, undefined, undefined, undefined, teamindex, squadindex);
            if (isdefined(var_87583859f07b58e3)) {
                if (istrue(level.var_d034183abf2e274d)) {
                    var_87583859f07b58e3.var_bbc200bc77c5db2b = 1;
                } else if (namespace_cd0b2d039510b38d::getsubgametype() == "resurgence") {
                    thread function_f4fc5c80c4d45c10(var_87583859f07b58e3);
                } else {
                    thread function_a87df010e38d988e(var_87583859f07b58e3);
                }
                var_87583859f07b58e3.contents = var_4ff6e95896e65939;
                var_87583859f07b58e3.var_bf23a60678978c19 = var_bf23a60678978c19;
                if (namespace_aead94004cf4c147::function_efab78b72d131d76(victim)) {
                    var_87583859f07b58e3.var_4f6cde716e0c3d7 = function_d9b1550011525161(victim);
                    var_87583859f07b58e3.var_6fb67c8525b1d79e = function_2985254128b1c262(victim);
                    var_87583859f07b58e3.var_3ef503345dc57957 = ter_op(isdefined(victim.var_3ef503345dc57957), victim.var_3ef503345dc57957, weaponclipsize(var_87583859f07b58e3.var_6fb67c8525b1d79e));
                    var_87583859f07b58e3.var_275f4441ab7920c8 = function_86a5c7670325346b(victim, 2);
                    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
                        var_87583859f07b58e3.metadata = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, 2);
                    }
                    if (var_87583859f07b58e3.var_6fb67c8525b1d79e.hasalternate) {
                        var_b6ff735c3690cc44 = var_87583859f07b58e3.var_6fb67c8525b1d79e getaltweapon();
                        var_87583859f07b58e3.var_86b32aff94b5714e = ter_op(isdefined(victim.var_86b32aff94b5714e), victim.var_86b32aff94b5714e, weaponclipsize(var_b6ff735c3690cc44));
                    }
                    if (namespace_68e641469fde3fa7::isakimbo(var_87583859f07b58e3.var_6fb67c8525b1d79e)) {
                        var_87583859f07b58e3.var_ad7897ecdbcb63 = ter_op(isdefined(victim.var_ad7897ecdbcb63), victim.var_ad7897ecdbcb63, weaponclipsize(var_87583859f07b58e3.var_6fb67c8525b1d79e));
                    }
                }
                var_87583859f07b58e3.var_46a3a8565ac0c17c = 6;
                var_87583859f07b58e3.owner = victim;
                var_87583859f07b58e3.backpackSize = namespace_aead94004cf4c147::function_b13e35608b336d65(victim);
                var_87583859f07b58e3.var_846a20d8e6f30b8e = namespace_85cd45b4fe0d86fb::function_fb2923d9d7eb7aac(victim);
                victim.var_6a4360dcf2a8f3d4 = var_87583859f07b58e3;
                if (isdefined(var_a0e9fef038504bd0) && isdefined(var_c299c08e4b8a8e56)) {
                    var_87583859f07b58e3.var_a06e7128c001851d = var_c299c08e4b8a8e56;
                    var_87583859f07b58e3.var_a0e9fef038504bd0 = var_a0e9fef038504bd0;
                    var_87583859f07b58e3.var_c31356a794d8cb46 = var_c31356a794d8cb46;
                    var_87583859f07b58e3.var_27990aa12decffdd = victim getweaponammoclip(var_a0e9fef038504bd0);
                    var_87583859f07b58e3.var_c693663e1bbdd8e9 = victim getweaponammoclip(var_a0e9fef038504bd0, "left");
                    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
                        var_87583859f07b58e3.var_bb6791b7369ef71a = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, 1);
                    }
                }
                foreach (item in var_87583859f07b58e3.contents) {
                    namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2(item["lootID"], "addedToContainer", var_87583859f07b58e3, victim);
                }
            }
        }
    }
    if (isdefined(victim.attached_bag) && !istrue(level.useLootableCorpse)) {
        victim namespace_d696adde758cbe79::function_6d569066ac5f3df0();
    }
    if (isdefined(var_ec22a950f210e39) && namespace_cb965d2f71fefddc::shoulddropbrprimary(var_ec22a950f210e39, victim)) {
        var_facc6a1a18b419f0 = namespace_cb965d2f71fefddc::dropbrweapon(var_ec22a950f210e39, dropstruct);
        if (isdefined(var_facc6a1a18b419f0)) {
            if (istrue(level.var_d034183abf2e274d)) {
                var_facc6a1a18b419f0.var_bbc200bc77c5db2b = 1;
            } else {
                thread function_a87df010e38d988e(var_facc6a1a18b419f0);
            }
            if (isdefined(var_facc6a1a18b419f0.var_ac26ec91048ac2e3)) {
                victim.var_620f2a17df977448 = var_facc6a1a18b419f0.var_ac26ec91048ac2e3;
            }
            if (isdefined(var_dfdb8aefc4328ea0) && namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
                var_facc6a1a18b419f0.metadata = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, var_dfdb8aefc4328ea0);
            }
            victim.var_3480393dc131952a = var_facc6a1a18b419f0;
        }
    }
    if (function_c4f1bd7a01a307fa(victim)) {
        victim.var_457667014505e1f9 = var_4ff6e95896e65939;
    }
    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
        namespace_a38a2e1fe7519183::function_ef552df845e8b952(victim);
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c58
// Size: 0x4a
function function_a87df010e38d988e(item) {
    item endon("death");
    level endon("game_ended");
    item.var_bbc200bc77c5db2b = 1;
    wait(getdvarint(@"hash_2b4f8183903e67ef", 180));
    if (!isdefined(item)) {
        return;
    }
    item.var_bbc200bc77c5db2b = undefined;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ca9
// Size: 0x726
function function_8121cbee12383790(victim, dropstruct) {
    var_4ff6e95896e65939 = [];
    var_badde91d16301be4 = 0;
    var_94333580dc2b96b = 0;
    for (var_a6f8d8115e0f1e79 = 0; var_a6f8d8115e0f1e79 < function_b13e35608b336d65(victim); var_a6f8d8115e0f1e79++) {
        quantity = victim function_897b29adb37f06a7(var_a6f8d8115e0f1e79);
        lootid = victim function_6196d9ea9a30e609(var_a6f8d8115e0f1e79);
        if (quantity > 0 && lootid > 0) {
            if (namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(lootid)) {
                var_bffcbb624987207b = namespace_85cd45b4fe0d86fb::function_379463a84adb07b4(quantity);
                var_dab81ead77442a10 = var_bffcbb624987207b[2];
                var_59bd51afc73df2cd = var_bffcbb624987207b[1];
                itemcount = var_bffcbb624987207b[0];
                var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, victim.origin, victim.angles, victim);
                scriptable = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
                namespace_cb965d2f71fefddc::spawnpickup(scriptable, var_cb4fad49263e20c4, itemcount, 0, undefined, 0, var_59bd51afc73df2cd, var_dab81ead77442a10);
            } else if (function_2d86ba79a58bb62(lootid)) {
                victim namespace_bd614c3c2275579a::function_f9ff7c89b3792ccc(dropstruct, victim.blacksite);
            } else if (isdefined(namespace_6c622b52017c6808::function_96a1620d901981d1(lootid, 5))) {
                victim namespace_cb965d2f71fefddc::function_b41950c9b54b12e0(dropstruct, var_a6f8d8115e0f1e79, lootid);
            } else {
                var_4ff6e95896e65939[var_a6f8d8115e0f1e79] = [];
                var_4ff6e95896e65939[var_a6f8d8115e0f1e79]["lootID"] = lootid;
                var_4ff6e95896e65939[var_a6f8d8115e0f1e79]["quantity"] = quantity;
                if (function_f6f8c1fc9549eaf6(lootid)) {
                    var_94333580dc2b96b = 1;
                }
                var_badde91d16301be4++;
            }
        }
    }
    if (istrue(level.var_f478c1f94caa7e9) && istrue(level.var_a3499c286ac570e4)) {
        if (namespace_aead94004cf4c147::function_efab78b72d131d76(victim)) {
            var_badde91d16301be4++;
        }
    }
    if (namespace_85cd45b4fe0d86fb::function_c07675f2ce32fcb5(victim)) {
        quantity = namespace_85cd45b4fe0d86fb::function_57711583c5d26490(victim);
        if (isdefined(quantity)) {
            var_bffcbc62498722ae = namespace_85cd45b4fe0d86fb::function_379463a84adb07b4(quantity);
            var_dab81ead77442a10 = var_bffcbc62498722ae[2];
            var_59bd51afc73df2cd = var_bffcbc62498722ae[1];
            itemcount = var_bffcbc62498722ae[0];
            var_5983083928ce568c = namespace_85cd45b4fe0d86fb::function_59771b0cc100410a(victim);
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, victim.origin, victim.angles, victim);
            var_3dd3adfb27186cd7 = namespace_cb965d2f71fefddc::spawnpickup(var_5983083928ce568c, var_cb4fad49263e20c4, itemcount, 0, undefined, 0, var_59bd51afc73df2cd, var_dab81ead77442a10);
            if (isdefined(var_3dd3adfb27186cd7)) {
                namespace_85cd45b4fe0d86fb::function_bc03aa369196f2bf(victim, 0);
                victim.dogtag = var_3dd3adfb27186cd7;
                if (isdefined(victim.var_d2dbb2fa012e6d9c)) {
                    victim.var_d2dbb2fa012e6d9c[victim.var_d2dbb2fa012e6d9c.size] = var_3dd3adfb27186cd7;
                }
            }
            if (isdefined(level.var_547167a7517600fb) && isdefined(level.var_547167a7517600fb.var_a5354afeb0d5dfcc)) {
                [[ level.var_547167a7517600fb.var_a5354afeb0d5dfcc ]](victim);
            }
        }
    }
    if (var_badde91d16301be4 > 0) {
        if (istrue(level.useLootableCorpse) && namespace_cd0b2d039510b38d::isteamreviveenabled()) {
            var_4f6cde716e0c3d7 = undefined;
            var_6fb67c8525b1d79e = undefined;
            var_3ef503345dc57957 = undefined;
            var_86b32aff94b5714e = undefined;
            var_275f4441ab7920c8 = undefined;
            var_8348f10d08dad67a = undefined;
            var_ad7897ecdbcb63 = undefined;
            if (namespace_aead94004cf4c147::function_efab78b72d131d76(victim)) {
                var_4f6cde716e0c3d7 = function_d9b1550011525161(victim);
                var_6fb67c8525b1d79e = function_2985254128b1c262(victim);
                var_3ef503345dc57957 = ter_op(isdefined(victim.var_3ef503345dc57957), victim.var_3ef503345dc57957, weaponclipsize(var_6fb67c8525b1d79e));
                var_275f4441ab7920c8 = function_86a5c7670325346b(victim, 2);
                if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
                    var_8348f10d08dad67a = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, 2);
                }
                if (var_6fb67c8525b1d79e.hasalternate) {
                    var_b6ff735c3690cc44 = var_6fb67c8525b1d79e getaltweapon();
                    var_86b32aff94b5714e = ter_op(isdefined(victim.var_86b32aff94b5714e), victim.var_86b32aff94b5714e, weaponclipsize(var_b6ff735c3690cc44));
                }
                if (namespace_68e641469fde3fa7::isakimbo(var_6fb67c8525b1d79e)) {
                    var_ad7897ecdbcb63 = ter_op(isdefined(victim.var_ad7897ecdbcb63), victim.var_ad7897ecdbcb63, weaponclipsize(var_6fb67c8525b1d79e));
                }
            }
            namespace_7db13bdf599e41a6::function_9341574d596e9d36(victim, var_4ff6e95896e65939, 6, namespace_85cd45b4fe0d86fb::function_fb2923d9d7eb7aac(victim), var_4f6cde716e0c3d7, var_6fb67c8525b1d79e, var_3ef503345dc57957, var_86b32aff94b5714e, var_275f4441ab7920c8, var_94333580dc2b96b, undefined, undefined, undefined, var_8348f10d08dad67a, undefined, undefined, var_ad7897ecdbcb63);
        } else {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, victim.origin, victim.angles, victim);
            teamindex = namespace_3c37cb17ade254d::array_find(level.allteamnamelist, victim.team);
            squadindex = victim.var_3f78c6a0862f9e25;
            var_87583859f07b58e3 = namespace_cb965d2f71fefddc::spawnpickup(function_432475069c798ddc(self.attached_bag), var_cb4fad49263e20c4, 1, undefined, undefined, undefined, teamindex, squadindex);
            if (isdefined(var_87583859f07b58e3)) {
                var_87583859f07b58e3.contents = var_4ff6e95896e65939;
                if (istrue(level.var_f478c1f94caa7e9) && istrue(level.var_a3499c286ac570e4)) {
                    if (namespace_aead94004cf4c147::function_efab78b72d131d76(victim)) {
                        var_87583859f07b58e3.var_4f6cde716e0c3d7 = function_d9b1550011525161(victim);
                        var_87583859f07b58e3.var_6fb67c8525b1d79e = function_2985254128b1c262(victim);
                        var_87583859f07b58e3.var_3ef503345dc57957 = ter_op(isdefined(victim.var_3ef503345dc57957), victim.var_3ef503345dc57957, weaponclipsize(var_87583859f07b58e3.var_6fb67c8525b1d79e));
                        var_87583859f07b58e3.var_275f4441ab7920c8 = function_86a5c7670325346b(victim, 2);
                        if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
                            var_87583859f07b58e3.metadata = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, 2);
                        }
                        if (var_87583859f07b58e3.var_6fb67c8525b1d79e.hasalternate) {
                            var_b6ff735c3690cc44 = var_87583859f07b58e3.var_6fb67c8525b1d79e getaltweapon();
                            var_87583859f07b58e3.var_86b32aff94b5714e = ter_op(isdefined(victim.var_86b32aff94b5714e), victim.var_86b32aff94b5714e, weaponclipsize(var_b6ff735c3690cc44));
                        }
                        if (namespace_68e641469fde3fa7::isakimbo(var_87583859f07b58e3.var_6fb67c8525b1d79e)) {
                            var_87583859f07b58e3.var_ad7897ecdbcb63 = ter_op(isdefined(victim.var_ad7897ecdbcb63), victim.var_ad7897ecdbcb63, weaponclipsize(var_87583859f07b58e3.var_6fb67c8525b1d79e));
                        }
                    }
                }
                var_87583859f07b58e3.var_46a3a8565ac0c17c = 6;
                var_87583859f07b58e3.owner = victim;
                var_87583859f07b58e3.var_846a20d8e6f30b8e = namespace_85cd45b4fe0d86fb::function_fb2923d9d7eb7aac(victim);
                victim.var_6a4360dcf2a8f3d4 = var_87583859f07b58e3;
                foreach (item in var_87583859f07b58e3.contents) {
                    namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2(item["lootID"], "addedToContainer", var_87583859f07b58e3, victim);
                }
            }
        }
    }
    if (isdefined(victim.attached_bag) && !istrue(level.useLootableCorpse)) {
        victim namespace_d696adde758cbe79::function_6d569066ac5f3df0();
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53d6
// Size: 0x2ec
function function_ae287e5eb2024104(victim, dropstruct) {
    victim.var_d2dbb2fa012e6d9c = victim namespace_aead94004cf4c147::function_88a168912191ec3e();
    if (istrue(level.var_51225d738094457d) && isdefined(victim.var_d2dbb2fa012e6d9c)) {
        var_c2fc8bf80c1b0aa2 = victim.attached_bag;
        if (!isdefined(var_c2fc8bf80c1b0aa2)) {
            var_c2fc8bf80c1b0aa2 = "brloot_backpack";
        }
        var_bf23a60678978c19 = [];
        index = 0;
        var_7803c95645e637e1 = 1;
        var_4f6cde716e0c3d7 = undefined;
        var_6fb67c8525b1d79e = undefined;
        foreach (indextype, itemtype in victim.var_d2dbb2fa012e6d9c) {
            if (!itemtype.size) {
                continue;
            }
            foreach (slot in itemtype) {
                if (!isdefined(slot)) {
                    continue;
                }
                lootid = slot[0];
                quantity = slot[1];
                if (!istrue(lootid) || !istrue(quantity)) {
                    continue;
                }
                if (indextype == 1) {
                    if (itemtype.size > 1) {
                        if (!var_7803c95645e637e1) {
                            var_4f6cde716e0c3d7 = lootid;
                            var_6fb67c8525b1d79e = slot[2];
                        }
                        var_7803c95645e637e1 = 0;
                    }
                } else {
                    var_bf23a60678978c19[index] = [];
                    var_bf23a60678978c19[index]["lootID"] = lootid;
                    var_bf23a60678978c19[index]["quantity"] = quantity;
                    index++;
                }
            }
        }
        if (isdefined(var_bf23a60678978c19) && var_bf23a60678978c19.size > 0) {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, victim.origin, victim.angles, victim);
            teamindex = namespace_3c37cb17ade254d::array_find(level.allteamnamelist, victim.team);
            squadindex = victim.var_3f78c6a0862f9e25;
            var_874b2676837cf5a1 = namespace_cb965d2f71fefddc::spawnpickup(function_432475069c798ddc(var_c2fc8bf80c1b0aa2), var_cb4fad49263e20c4, 1, undefined, undefined, undefined, teamindex, squadindex);
            if (!isdefined(var_874b2676837cf5a1)) {
                return;
            }
            if (isdefined(var_4f6cde716e0c3d7) && isdefined(var_6fb67c8525b1d79e)) {
                var_874b2676837cf5a1.var_4f6cde716e0c3d7 = var_4f6cde716e0c3d7;
                var_874b2676837cf5a1.var_6fb67c8525b1d79e = var_6fb67c8525b1d79e;
                if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
                    var_874b2676837cf5a1.metadata = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, 1);
                }
            }
            var_874b2676837cf5a1.contents = var_bf23a60678978c19;
            var_874b2676837cf5a1.var_46a3a8565ac0c17c = 6;
            var_874b2676837cf5a1.owner = victim;
            var_874b2676837cf5a1.var_846a20d8e6f30b8e = namespace_85cd45b4fe0d86fb::function_fb2923d9d7eb7aac(victim);
            victim.var_77893f01ee39c62e = var_874b2676837cf5a1;
        }
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56c9
// Size: 0x154
function function_1db038329eb56917(player, lootid, quantity, var_3e99c0842e4ccfa7) {
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
    teamindex = namespace_3c37cb17ade254d::array_find(level.allteamnamelist, player.team);
    squadindex = player.var_3f78c6a0862f9e25;
    var_87583859f07b58e3 = namespace_cb965d2f71fefddc::spawnpickup(function_432475069c798ddc(self.attached_bag), var_cb4fad49263e20c4, 1, undefined, undefined, undefined, teamindex, squadindex);
    if (isdefined(var_87583859f07b58e3)) {
        var_4ff6e95896e65939 = [];
        for (var_f45699551971765c = 0; var_f45699551971765c < var_3e99c0842e4ccfa7; var_f45699551971765c++) {
            var_4ff6e95896e65939[var_f45699551971765c] = [];
            var_4ff6e95896e65939[var_f45699551971765c]["lootID"] = lootid;
            var_4ff6e95896e65939[var_f45699551971765c]["quantity"] = quantity;
        }
        var_87583859f07b58e3.contents = var_4ff6e95896e65939;
        var_87583859f07b58e3.var_46a3a8565ac0c17c = 6;
        var_87583859f07b58e3.owner = player;
        player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(19, var_87583859f07b58e3.origin, var_87583859f07b58e3.index);
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5824
// Size: 0x79
function function_432475069c798ddc(var_4f08e017049ad3cb) {
    if (isdefined(var_4f08e017049ad3cb)) {
        switch (var_4f08e017049ad3cb) {
        case #"hash_dca6f419e607e1f7":
            return "brloot_backpack_player_small";
        case #"hash_d9938108fa8eb85f":
            return "brloot_backpack_player_medium";
        case #"hash_e3731b91d944f82f":
            return "brloot_backpack_player_large";
        case #"hash_e6d61aa8716cb5e3":
            return "brloot_backpack_player_secure";
        case #"hash_1dc65c7b5858c244":
            return "brloot_backpack_player_scav";
            break;
        }
    }
    return "brloot_backpack";
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58a5
// Size: 0x119
function function_565cbea3437267d9(player) {
    var_f6af44bb087c3da5 = function_102abd6883c5f9bf(player);
    if (var_f6af44bb087c3da5 != 0) {
        var_14ab898d93fd9b3f = function_2c4cee072c4426c4(var_f6af44bb087c3da5);
        switch (var_14ab898d93fd9b3f) {
        case 1:
            return "parts_backpack_inventory_medium";
        case 2:
            return "parts_backpack_inventory_large";
        case 3:
            return "dmz_backpack_secured";
        case 4:
            return "dmz_backpack_scavenger";
        default:
            return "parts_backpack_inventory_small";
            break;
        }
        return "parts_backpack_inventory_small";
    }
    size = function_b13e35608b336d65(player);
    switch (size) {
    case 5:
        return "parts_backpack_inventory_small";
    case 7:
        return "parts_backpack_inventory_medium";
    case 9:
        return "parts_backpack_inventory_large";
    case 11:
        return "dmz_backpack_scavenger";
    default:
        return "parts_backpack_inventory_small";
        break;
    }
    return "parts_backpack_inventory_small";
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59c6
// Size: 0x6a
function function_3188d9c94b3d56c2(var_a1093166de09e6b8) {
    if (!isdefined(var_a1093166de09e6b8)) {
        return 5;
    }
    switch (var_a1093166de09e6b8) {
    case #"hash_75ca97f27fab119c":
        return 7;
    case #"hash_5cdbaa0bf3e5ebfe":
        return 9;
    case #"hash_7e7616dbf5a436f2":
        return 5;
    case #"hash_c2b5d7ec929a9d4a":
        return 11;
    default:
        break;
    }
    return 5;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a38
// Size: 0x68
function function_cb9faea721c36499(size) {
    if (isdefined(size)) {
        switch (size) {
        case 5:
            return undefined;
        case 7:
            return namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_backpack_medium");
        case 9:
            return namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_backpack_large");
        default:
            break;
        }
    }
    return undefined;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aa8
// Size: 0x80
function function_2c4cee072c4426c4(lootid) {
    if (!isdefined(lootid)) {
        return 0;
    }
    scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (!isdefined(scriptablename)) {
        return 0;
    }
    switch (scriptablename) {
    case #"hash_75ca97f27fab119c":
        return 1;
    case #"hash_5cdbaa0bf3e5ebfe":
        return 2;
    case #"hash_7e7616dbf5a436f2":
        return 3;
    case #"hash_c2b5d7ec929a9d4a":
        return 4;
    default:
        return 0;
        break;
    }
    return 0;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b30
// Size: 0x6d
function function_41b6bff9497a60d9(lootid) {
    if (!isdefined(lootid)) {
        return 0;
    }
    scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (!isdefined(scriptablename)) {
        return 0;
    }
    switch (scriptablename) {
    case #"hash_5cdbaa0bf3e5ebfe":
    case #"hash_75ca97f27fab119c":
        return 1;
    case #"hash_7e7616dbf5a436f2":
        return 0;
    default:
        return 0;
        break;
    }
    return 0;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ba5
// Size: 0x4e
function function_c4f1bd7a01a307fa(player) {
    if (istrue(player.extracted)) {
        return function_f41d7258200e1d08(player);
    }
    return (function_f41d7258200e1d08(player) || istrue(player.var_4f7710ecff5b1619)) && getdvarint(@"hash_ff574f42cbb4f9f7", 1);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bfb
// Size: 0x46
function function_f41d7258200e1d08(player) {
    var_f6af44bb087c3da5 = function_102abd6883c5f9bf(player);
    if (var_f6af44bb087c3da5 == 0) {
        return 0;
    }
    var_88b0df56aedaf993 = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7("brloot_backpack_secure");
    if (!isdefined(var_88b0df56aedaf993)) {
        return 0;
    }
    return var_f6af44bb087c3da5 == var_88b0df56aedaf993;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c49
// Size: 0x28
function function_102abd6883c5f9bf(player) {
    if (!isdefined(player.var_cda8c241effb412a)) {
        return 0;
    }
    return player.var_cda8c241effb412a;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c79
// Size: 0x2d
function function_91c1be871300a518(lootid) {
    var_2713f4a3502d1624 = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (!isdefined(var_2713f4a3502d1624)) {
        var_2713f4a3502d1624 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    }
    return var_2713f4a3502d1624;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cae
// Size: 0x95
function function_f87e08a944ad2c57(array, compare_func) {
    /#
        assertex(isdefined(array), "Array not defined.");
    #/
    /#
        assertex(isdefined(compare_func), "Compare function not defined.");
    #/
    for (j = 1; j < array.size; j++) {
        key = array[j];
        for (i = j - 1; i >= 0 && ![[ compare_func ]](array[i], key); i--) {
            array[i + 1] = array[i];
        }
        array[i + 1] = key;
    }
    return array;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d4b
// Size: 0x18
function function_a40546ed395d06c8(var_1c311a2add5fab38) {
    return function_f87e08a944ad2c57(var_1c311a2add5fab38, &function_6f3fb8a752376eb2);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d6b
// Size: 0x17
function function_6f3fb8a752376eb2(a, b) {
    return a <= b;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d8a
// Size: 0x2d
function isBackpackInventoryEnabled() {
    if (!isdefined(level.var_c59c301eaabc2e32)) {
        return 0;
    }
    if (!namespace_ad49798629176e96::function_c84e254980c7c8ed()) {
        return 0;
    }
    if (!level.var_c59c301eaabc2e32) {
        return 1;
    }
    return 0;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dbf
// Size: 0x3f
function function_7e103028c464ab9a(itemname) {
    var_2c155eac30eee07 = isBackpackInventoryEnabled();
    if (var_2c155eac30eee07 && namespace_71073fa38f11492::isbrgametypefuncdefined("lootAllowedInBackpack")) {
        var_2c155eac30eee07 = namespace_71073fa38f11492::runbrgametypefunc("lootAllowedInBackpack", itemname);
    }
    return var_2c155eac30eee07;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e06
// Size: 0x73
function function_9ac2038430604b09(player) {
    for (weaponindex = 0; weaponindex < 3; weaponindex++) {
        var_2b3e04e32a6a0c4c = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(player, weaponindex);
        if (isdefined(var_2b3e04e32a6a0c4c) && !namespace_68e641469fde3fa7::isfistsonly(var_2b3e04e32a6a0c4c) && !namespace_68e641469fde3fa7::isgunlessweapon(var_2b3e04e32a6a0c4c)) {
            rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(var_2b3e04e32a6a0c4c);
            if (rootname != "none") {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e81
// Size: 0x617
function function_cf1bef64e94f2d1a(itemtype, itemindex, var_a548a6c15ceb9e8c, var_616ab931ecba446b, var_51844d2ee50a997b) {
    var_a548a6c15ceb9e8c = istrue(var_a548a6c15ceb9e8c);
    switch (itemtype) {
    case 0:
        if (istrue(level.var_b75e093e97f9e931)) {
            plundercount = 0;
            if (isdefined(self.plundercount) && self.plundercount > 0) {
                plundercount = namespace_cb965d2f71fefddc::getquickdropplundercount(!istrue(var_51844d2ee50a997b));
            }
            if (plundercount <= 0) {
                if (var_a548a6c15ceb9e8c) {
                    return [0:8395, 1:0];
                } else {
                    return undefined;
                }
            }
            if (!istrue(var_616ab931ecba446b)) {
                namespace_c6ccccd95254983f::playersetplundercount(0);
            }
            return [0:8395, 1:plundercount];
        }
        var_cb4fad49263e20c4 = namespace_c6ccccd95254983f::function_79275e2fab13f54d();
        var_6aee9c9054f09ed5 = var_cb4fad49263e20c4.var_6aee9c9054f09ed5;
        var_b64f283113c99581 = var_cb4fad49263e20c4.var_b64f283113c99581;
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("playerPlunderModifyInventoryDrop")) {
            var_bffcb26249870cb0 = namespace_71073fa38f11492::runbrgametypefunc("playerPlunderModifyInventoryDrop", var_6aee9c9054f09ed5, var_b64f283113c99581);
            var_b64f283113c99581 = var_bffcb26249870cb0[1];
            var_6aee9c9054f09ed5 = var_bffcb26249870cb0[0];
        }
        self.plundercountondeath = var_6aee9c9054f09ed5;
        namespace_c6ccccd95254983f::playersetplundercount(var_6aee9c9054f09ed5);
        if (var_b64f283113c99581 <= 0) {
            if (var_a548a6c15ceb9e8c) {
                return [0:8395, 1:0];
            } else {
                return undefined;
            }
        }
        return [0:8395, 1:var_b64f283113c99581];
    case 1:
        if (itemindex == 2) {
            if (!namespace_aead94004cf4c147::function_efab78b72d131d76(self)) {
                return [0:0, 1:0, 2:undefined];
            }
            lootid = self getplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "lootItemID");
            var_ec22a950f210e39 = namespace_aead94004cf4c147::function_2985254128b1c262(self);
            return [0:lootid, 1:self getweaponammoclip(var_ec22a950f210e39), 2:var_ec22a950f210e39];
        }
        var_ec22a950f210e39 = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(self, itemindex);
        if (!isdefined(var_ec22a950f210e39)) {
            if (var_a548a6c15ceb9e8c) {
                return [0:0, 1:0, 2:undefined];
            } else {
                return undefined;
            }
        }
        rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(var_ec22a950f210e39);
        variantid = var_ec22a950f210e39.variantid;
        if (!isdefined(var_ec22a950f210e39.variantid)) {
            variantid = 0;
        }
        lootid = namespace_e0ee43ef2dddadaa::function_79d6e6c22245687a(rootname, variantid);
        return [0:lootid, 1:self getweaponammoclip(var_ec22a950f210e39), 2:var_ec22a950f210e39];
    case 10:
        return function_6738846da50730f1(itemindex);
    case 2:
        slot = namespace_1a507865f681850e::function_4967838290cb31b9(itemindex);
        if (!isdefined(self.equipment[slot])) {
            if (var_a548a6c15ceb9e8c) {
                return [0:0, 1:0];
            } else {
                return undefined;
            }
        }
        ref = self.equipment[slot];
        var_feb782334dd23a66 = array_find(level.br_pickups.br_equipname, self.equipment[slot]);
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_feb782334dd23a66);
        ammocount = 0;
        if (ref == "equip_hb_sensor") {
            ammocount = namespace_8a392daf295e43f8::function_db61876aca4e4cd3();
        } else if (istrue(var_51844d2ee50a997b)) {
            ammocount = 1;
        } else {
            ammocount = namespace_1a507865f681850e::getequipmentslotammo(slot);
        }
        return [0:lootid, 1:ammocount];
    case 3:
        if (!isdefined(self.streakdata.streaks[1])) {
            if (var_a548a6c15ceb9e8c) {
                return [0:0, 1:0];
            } else {
                return undefined;
            }
        }
        scriptable = level.br_pickups.var_838863c4848d4c26[self.streakdata.streaks[1].streakname];
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptable);
        return [0:lootid, 1:1];
    case 4:
        if (!isdefined(self.equipment["super"])) {
            if (var_a548a6c15ceb9e8c) {
                return [0:0, 1:0];
            } else {
                return undefined;
            }
        }
        var_feb782334dd23a66 = array_find(level.br_pickups.br_equipname, self.equipment["super"]);
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_feb782334dd23a66);
        ammocount = namespace_cb965d2f71fefddc::function_fcde72dcbcec206b();
        if (isdefined(ammocount) && ammocount == 0) {
            if (istrue(self.var_1066fbd86c88a6df) || namespace_282db5a41b643e19::function_66f0cbd5ff8458fe() && namespace_85d036cb78063c4a::issuperready()) {
                ammocount = 1;
            }
        }
        ammocount = function_53c4c53197386572(ammocount, 0);
        return [0:lootid, 1:ammocount];
    case 6:
        if (!namespace_9c6cddd872ad75f7::hasgasmask(self) || istrue(self.gasmaskswapinprogress)) {
            if (var_a548a6c15ceb9e8c) {
                return [0:0, 1:0];
            } else {
                return undefined;
            }
        }
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(self.gasmasktype);
        quantity = int(self.gasmaskhealth);
        return [0:lootid, 1:quantity];
    case 7:
        if (!namespace_d3d40f75bb4e4c32::hasselfrevivetoken()) {
            if (var_a548a6c15ceb9e8c) {
                return [0:0, 1:0];
            } else {
                return undefined;
            }
        }
        if (namespace_cd0b2d039510b38d::getsubgametype() == "resurgence") {
            if (level.br_circle.circleindex == 0) {
                if (!isdefined(self.var_ad98d6456993dafe)) {
                    self.var_ad98d6456993dafe = 1;
                    if (var_a548a6c15ceb9e8c) {
                        return [0:0, 1:0];
                    } else {
                        return undefined;
                    }
                }
            }
        }
        var_d11137e58d02736c = namespace_d3d40f75bb4e4c32::function_791e72676cd7b544(self);
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_d11137e58d02736c);
        return [0:lootid, 1:1];
    case 13:
        if (var_a548a6c15ceb9e8c) {
            return [0:0, 1:0];
            goto LOC_00000588;
        }
        return undefined;
    default:
    LOC_00000588:
        /#
            assertmsg("Invalid quick drop item type: " + itemtype);
        #/
        return;
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x649f
// Size: 0x2a
function function_b13e35608b336d65(player) {
    backpackSize = function_684ef6e1c75b5518(player);
    if (isdefined(backpackSize)) {
        return backpackSize;
    } else {
        return 0;
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64d0
// Size: 0x59
function function_684ef6e1c75b5518(player) {
    if (istrue(level.var_a7f81dfdc88e53e6)) {
        return level.var_e247454ac2869696;
    }
    if (!isdefined(level.var_5d69837cf4db0407) || !isdefined(level.backpackSize)) {
        return undefined;
    }
    return player getplayerdata(level.var_5d69837cf4db0407, level.backpackSize);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6531
// Size: 0xc3
function function_d28f52da6ede0191(player, size, var_cb6cd39e3733b463, var_cda8c241effb412a) {
    player.var_cda8c241effb412a = var_cda8c241effb412a;
    if (!isdefined(var_cda8c241effb412a)) {
        player.var_cda8c241effb412a = function_cb9faea721c36499(size);
    }
    var_14ab898d93fd9b3f = function_2c4cee072c4426c4(player.var_cda8c241effb412a);
    player setclientomnvar("ui_loot_backpack_type", var_14ab898d93fd9b3f);
    player setplayerdata(level.var_5d69837cf4db0407, level.backpackSize, size);
    player setplayerdata(level.var_5d69837cf4db0407, "backpackSize", size);
    if (istrue(var_cb6cd39e3733b463)) {
        return;
    }
    var_8f24a28261fb9da3 = namespace_aead94004cf4c147::function_565cbea3437267d9(player);
    player namespace_d696adde758cbe79::function_c3f3fceeddda6f6(var_8f24a28261fb9da3);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65fb
// Size: 0xd8
function function_6491bd812bb47efb(player, var_a0d21fdd38f60ecf, var_2713f4a3502d1624) {
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    for (i = var_a0d21fdd38f60ecf; i < 11; i++) {
        var_bffcb36249870ee3 = function_6738846da50730f1(i);
        _ = var_bffcb36249870ee3[2];
        quantity = var_bffcb36249870ee3[1];
        lootid = var_bffcb36249870ee3[0];
        if (!isdefined(lootid) || !isdefined(quantity)) {
            continue;
        }
        if (lootid == 0 || quantity == 0) {
            continue;
        }
        namespace_cb965d2f71fefddc::function_6f62cb4fc113349c(player, 10, i, 1);
    }
    if (!function_18e2d7a6912b1d07(var_2713f4a3502d1624) && function_efab78b72d131d76(player)) {
        namespace_cb965d2f71fefddc::function_62f068cec343a111(player, 1, 2);
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66da
// Size: 0x60
function function_18e2d7a6912b1d07(var_2713f4a3502d1624) {
    if (!isdefined(var_2713f4a3502d1624)) {
        return 0;
    }
    switch (var_2713f4a3502d1624) {
    case #"hash_5cdbaa0bf3e5ebfe":
    case #"hash_75ca97f27fab119c":
        return 1;
    case #"hash_7e7616dbf5a436f2":
    case #"hash_c2b5d7ec929a9d4a":
        return 0;
    default:
        return 0;
        break;
    }
    return 0;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6742
// Size: 0x7f
function function_69a380e3f9c37cc7(player) {
    foreach (weaponobj in player.primaryinventory) {
        if (weaponobj.basename == "iw9_me_fists_mp") {
            return 0;
        }
    }
    if (!namespace_aead94004cf4c147::function_efab78b72d131d76(player)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67c9
// Size: 0xac
function function_631fd0855c653a68(player, onconnect) {
    level endon("game_ended");
    player endon("disconnect");
    while (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7() && !istrue(self function_f6c07d6ea7d83a5a())) {
        waitframe();
    }
    Restored = namespace_a38a2e1fe7519183::function_c241fbc63120cfc4(player, onconnect);
    if (!istrue(level.var_a7f81dfdc88e53e6)) {
        backpackSize = namespace_aead94004cf4c147::function_b13e35608b336d65(player);
        var_cda8c241effb412a = ter_op(istrue(Restored), player.var_cda8c241effb412a, undefined);
        namespace_aead94004cf4c147::function_d28f52da6ede0191(player, backpackSize, 1, var_cda8c241effb412a);
    }
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    Restored = namespace_a38a2e1fe7519183::function_fc56050bd3dcea6c(player);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x687c
// Size: 0x10b
function function_88a168912191ec3e(var_73957fa8e31562b2, var_a548a6c15ceb9e8c, var_616ab931ecba446b) {
    var_bf23a60678978c19 = [];
    var_bf23a60678978c19[0] = [];
    var_bf23a60678978c19[0][0] = function_cf1bef64e94f2d1a(0, 0, var_a548a6c15ceb9e8c, var_616ab931ecba446b);
    var_bf23a60678978c19[1] = [];
    var_bf23a60678978c19[1][0] = function_cf1bef64e94f2d1a(1, 0, var_a548a6c15ceb9e8c);
    var_bf23a60678978c19[1][1] = function_cf1bef64e94f2d1a(1, 1, var_a548a6c15ceb9e8c);
    var_bf23a60678978c19[2] = [];
    var_bf23a60678978c19[2][0] = function_cf1bef64e94f2d1a(2, 0, var_a548a6c15ceb9e8c);
    var_bf23a60678978c19[2][1] = function_cf1bef64e94f2d1a(2, 1, var_a548a6c15ceb9e8c);
    var_bf23a60678978c19[2][2] = function_cf1bef64e94f2d1a(2, 2, var_a548a6c15ceb9e8c);
    var_bf23a60678978c19[3] = [];
    if (istrue(var_73957fa8e31562b2)) {
        var_bf23a60678978c19[3][0] = function_cf1bef64e94f2d1a(3, 0, var_a548a6c15ceb9e8c);
    }
    var_bf23a60678978c19[4] = [];
    var_bf23a60678978c19[4][0] = function_cf1bef64e94f2d1a(4, 0, var_a548a6c15ceb9e8c);
    if (istrue(var_73957fa8e31562b2)) {
        var_bf23a60678978c19[6] = [];
        var_bf23a60678978c19[6][0] = function_cf1bef64e94f2d1a(6, 0, var_a548a6c15ceb9e8c);
        var_bf23a60678978c19[7] = [];
        var_bf23a60678978c19[7][0] = function_cf1bef64e94f2d1a(7, 0, var_a548a6c15ceb9e8c);
    }
    return var_bf23a60678978c19;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x698f
// Size: 0x6d
function function_b4f4561fdb86fa25(player) {
    if (!istrue(level.var_d034183abf2e274d) || namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7() || istrue(level.var_b4f4561fdb86fa25)) {
        player function_bab1a10b3fdaae51();
        function_590202daf6a1d4d7(player);
        function_d28f52da6ede0191(player, 5, 1);
        player setplayerdata(level.var_5d69837cf4db0407, "dmzPlateCarrierLevel", 1);
        function_590202daf6a1d4d7(player);
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a03
// Size: 0xa0
function function_f1f10297297d06c8() {
    /#
        for (i = 0; i < 50; i++) {
            lootid = self getplayerdata(level.var_5d69837cf4db0407, "<unknown string>", i, "<unknown string>");
            quantity = self getplayerdata(level.var_5d69837cf4db0407, "<unknown string>", i, "<unknown string>");
            ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
            println("<unknown string>" + i + "<unknown string>" + lootid + "<unknown string>" + ref + "<unknown string>" + quantity);
        }
    #/
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6aaa
// Size: 0x31
function function_720d227d0e55a960() {
    if (!isdefined(level.var_7d17e26667be2792)) {
        level.var_7d17e26667be2792 = getdvarint(@"hash_55d9444d8a3ce31a", 0);
    }
    return level.var_7d17e26667be2792;
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ae3
// Size: 0x85
function function_5323bef1ad6244b9(damagetick) {
    var_e32ed31bf12217d2 = [];
    var_e32ed31bf12217d2 = function_5915bdbc5f6302b6(level.var_534e97d34ef9fa29);
    foreach (var_a58c1fca5d8a5b2 in var_e32ed31bf12217d2) {
        function_e900e7e66383ad97(self, var_a58c1fca5d8a5b2, int(function_897b29adb37f06a7(var_a58c1fca5d8a5b2) - damagetick));
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b6f
// Size: 0x53
function function_e25e584cac984a5d(itemtype) {
    if (!isdefined(itemtype)) {
        return 0;
    }
    itemtype = function_1823ff50bb28148d(itemtype);
    return itemtype == #"plunder" || itemtype == #"hash_c583d0faabb7fa37" || itemtype == #"personal" || itemtype == #"dogtag";
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bca
// Size: 0x6d
function function_f4fc5c80c4d45c10(backpack) {
    if (isdefined(self.var_901a9107ce867b4c)) {
        self.var_901a9107ce867b4c.var_bbc200bc77c5db2b = undefined;
        self.var_901a9107ce867b4c notify("end_backpack_empty_watcher");
    }
    self.var_901a9107ce867b4c = backpack;
    self.var_901a9107ce867b4c.var_bbc200bc77c5db2b = 1;
    self.var_901a9107ce867b4c thread function_7f924754a3da2a62();
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c3e
// Size: 0x9d
function function_7f924754a3da2a62() {
    level endon("game_ended");
    self endon("end_backpack_empty_watcher");
    while (isdefined(self) && !isdefined(self.var_bf23a60678978c19)) {
        wait(0.05);
    }
    while (isdefined(self) && isdefined(self.var_bf23a60678978c19)) {
        var_1866e32d84cb48a7 = 1;
        for (i = 0; i < self.var_bf23a60678978c19.size - 1; i++) {
            if (self.var_bf23a60678978c19[i]["quantity"]) {
                var_1866e32d84cb48a7 = 0;
            }
        }
        if (var_1866e32d84cb48a7) {
            self.var_bbc200bc77c5db2b = undefined;
            return;
        }
        wait(1);
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ce2
// Size: 0x164
function function_68bca2c2e9f0a1d3(var_47868f432c8fcb6b, var_5e7ce68553217eaf) {
    backpackSize = function_b13e35608b336d65(self);
    if (var_47868f432c8fcb6b < 0 || var_47868f432c8fcb6b >= backpackSize || var_5e7ce68553217eaf < 0 || var_5e7ce68553217eaf >= backpackSize) {
        return;
    }
    var_c0014462498c439d = function_6738846da50730f1(var_47868f432c8fcb6b);
    var_ed4dabc339a6141 = var_c0014462498c439d[2];
    var_c1500f171aeb561a = var_c0014462498c439d[1];
    var_26e51dc5f1cc490 = var_c0014462498c439d[0];
    var_c0014362498c416a = function_6738846da50730f1(var_5e7ce68553217eaf);
    var_6448cb914c5afd45 = var_c0014362498c416a[2];
    var_4819afa0c5073b0e = var_c0014362498c416a[1];
    var_41dcbc4d3302f6dc = var_c0014362498c416a[0];
    if (isdefined(var_26e51dc5f1cc490) && isdefined(var_c1500f171aeb561a) && isdefined(var_41dcbc4d3302f6dc) && isdefined(var_4819afa0c5073b0e)) {
        function_a0ccc23064473a05(self, var_5e7ce68553217eaf, var_26e51dc5f1cc490, var_c1500f171aeb561a, var_ed4dabc339a6141);
        function_a0ccc23064473a05(self, var_47868f432c8fcb6b, var_41dcbc4d3302f6dc, var_4819afa0c5073b0e, var_6448cb914c5afd45);
        if (namespace_cb965d2f71fefddc::function_9b77601837f66e32(var_26e51dc5f1cc490) || namespace_cb965d2f71fefddc::function_9b77601837f66e32(var_41dcbc4d3302f6dc)) {
            namespace_6c622b52017c6808::function_6d070b6ad87fc4a2(self, var_26e51dc5f1cc490, var_41dcbc4d3302f6dc, var_47868f432c8fcb6b, var_5e7ce68553217eaf);
        }
        if (namespace_cb965d2f71fefddc::function_b605a733974c2ff5(var_26e51dc5f1cc490) && namespace_c39580665208f0a4::function_8e1f9b3b6c83372d(var_47868f432c8fcb6b)) {
            namespace_c39580665208f0a4::function_9ee717001acd63a0(var_5e7ce68553217eaf);
        } else if (namespace_cb965d2f71fefddc::function_b605a733974c2ff5(var_41dcbc4d3302f6dc) && namespace_c39580665208f0a4::function_8e1f9b3b6c83372d(var_5e7ce68553217eaf)) {
            namespace_c39580665208f0a4::function_9ee717001acd63a0(var_47868f432c8fcb6b);
        }
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e4d
// Size: 0x1fe
function function_ce92a41b8f3b666f(var_65b695f0c0d909ed, var_d54a79024c228770) {
    backpackSize = function_b13e35608b336d65(self);
    container = self.var_2fa5b49969def47;
    if (var_65b695f0c0d909ed < 0 || var_65b695f0c0d909ed >= backpackSize) {
        return;
    }
    var_c0014262498c3f37 = function_6738846da50730f1(var_65b695f0c0d909ed);
    _ = var_c0014262498c3f37[2];
    var_dfab44d4d8d10b36 = var_c0014262498c3f37[1];
    var_f27898e4afd922b4 = var_c0014262498c3f37[0];
    var_c0014162498c3d04 = namespace_3f0ea7483345a2c0::function_edb397974ae6ee68(self, container, var_d54a79024c228770, 0);
    var_ea1dcc638e88b8c9 = var_c0014162498c3d04[1];
    var_879d3e9d5c72b703 = var_c0014162498c3d04[0];
    scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(var_f27898e4afd922b4);
    if (isdefined(var_f27898e4afd922b4) && isdefined(var_dfab44d4d8d10b36) && isdefined(var_879d3e9d5c72b703) && isdefined(var_ea1dcc638e88b8c9)) {
        var_da5c10799c16c24f = 8569;
        if (var_879d3e9d5c72b703 == var_da5c10799c16c24f) {
            namespace_3f0ea7483345a2c0::function_f0617ad70b7e7792(var_d54a79024c228770, var_65b695f0c0d909ed, container);
            return;
        } else {
            function_a0ccc23064473a05(self, var_65b695f0c0d909ed, var_879d3e9d5c72b703, var_ea1dcc638e88b8c9);
        }
        if (var_f27898e4afd922b4 == 0 || function_5b7e9a4c946f3a13(container.var_46a3a8565ac0c17c, [0:13, 1:15])) {
            namespace_3f0ea7483345a2c0::function_153d3281e46e14da(self, container, var_d54a79024c228770, var_f27898e4afd922b4, var_dfab44d4d8d10b36);
        } else {
            namespace_3f0ea7483345a2c0::function_153d3281e46e14da(self, container, var_d54a79024c228770, 0, 0);
            dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
            item = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, var_dfab44d4d8d10b36, 1);
            namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2(scriptablename, "dropped", item, self, var_cb4fad49263e20c4.origin);
        }
        var_2789584b4d4cb228 = namespace_38b993c4618e76cd::getScriptableFromLootID(var_f27898e4afd922b4);
        if (namespace_cb965d2f71fefddc::function_282d89f7705a2d63(var_2789584b4d4cb228)) {
            namespace_cb965d2f71fefddc::function_bfc82c27ed3d9308(var_f27898e4afd922b4, var_dfab44d4d8d10b36, var_2789584b4d4cb228, var_65b695f0c0d909ed);
        }
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7052
// Size: 0x187
function function_1d982e57487b7efe() {
    startweapon = self getcurrentweapon();
    primaryweapon = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(self, 0);
    secondaryweapon = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(self, 1);
    if (namespace_68e641469fde3fa7::function_1e9278ba699927f7(primaryweapon) || namespace_68e641469fde3fa7::function_1e9278ba699927f7(secondaryweapon)) {
        return;
    }
    var_f5e71c4df042fa27 = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(primaryweapon);
    var_4cc9e4d0a2b19a67 = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(secondaryweapon);
    var_1ab509d42abd4c39 = self getweaponammoclip(primaryweapon);
    var_f877d26184fc0d79 = self getweaponammoclip(secondaryweapon);
    var_dcf6299535b22f5e = 0;
    var_2e177550d1cc0f9e = 0;
    if (primaryweapon.basename != "iw9_me_fists_mp") {
        var_dcf6299535b22f5e = self.br_ammo[var_f5e71c4df042fa27];
    }
    if (secondaryweapon.basename != "iw9_me_fists_mp") {
        var_2e177550d1cc0f9e = self.br_ammo[var_4cc9e4d0a2b19a67];
    }
    self switchtoweaponimmediate(ter_op(issameweapon(startweapon, primaryweapon), secondaryweapon, primaryweapon));
    self takeweapon(primaryweapon);
    self takeweapon(secondaryweapon);
    self giveweapon(secondaryweapon);
    self giveweapon(primaryweapon);
    if (primaryweapon.basename != "iw9_me_fists_mp") {
        namespace_3bcd40a3005712ec::br_ammo_update_ammotype_weapons(self, var_f5e71c4df042fa27, var_dcf6299535b22f5e);
        self setweaponammoclip(primaryweapon, var_1ab509d42abd4c39);
    }
    if (secondaryweapon.basename != "iw9_me_fists_mp") {
        namespace_3bcd40a3005712ec::br_ammo_update_ammotype_weapons(self, var_4cc9e4d0a2b19a67, var_2e177550d1cc0f9e);
        self setweaponammoclip(secondaryweapon, var_f877d26184fc0d79);
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71e0
// Size: 0x19c
function function_51301c83420d42b4(var_3de70f4007ca2c9, var_d54a79024c228770) {
    container = self.var_2fa5b49969def47;
    var_c0013862498c2939 = namespace_3f0ea7483345a2c0::function_775a7fc396485a9a(self, container, var_d54a79024c228770);
    var_cf4fd93a53325100 = var_c0013862498c2939[6];
    var_18c2c5b0a787d075 = var_c0013862498c2939[5];
    quantity = var_c0013862498c2939[4];
    metadata = var_c0013862498c2939[3];
    var_e1147886ccf51970 = var_c0013862498c2939[2];
    var_6fb67c8525b1d79e = var_c0013862498c2939[1];
    _ = var_c0013862498c2939[0];
    weapon = var_6fb67c8525b1d79e;
    if (namespace_68e641469fde3fa7::function_1e9278ba699927f7(weapon)) {
        return;
    }
    quantity = function_53c4c53197386572(quantity, weaponclipsize(weapon));
    if (namespace_68e641469fde3fa7::isakimbo(weapon)) {
        var_cf4fd93a53325100 = function_53c4c53197386572(var_cf4fd93a53325100, weaponclipsize(weapon));
    }
    var_cda8c241effb412a = function_102abd6883c5f9bf(self);
    var_2713f4a3502d1624 = function_91c1be871300a518(var_cda8c241effb412a);
    var_44ee85dcf52b4001 = function_18e2d7a6912b1d07(var_2713f4a3502d1624) && !function_efab78b72d131d76(self);
    self.lastdroppableweaponobj = self.primaryweapons[var_3de70f4007ca2c9];
    success = namespace_cb965d2f71fefddc::function_e5845ff9b61ac5d7(weapon, quantity, undefined, var_18c2c5b0a787d075, var_44ee85dcf52b4001, undefined, metadata, undefined, undefined, var_e1147886ccf51970, var_cf4fd93a53325100);
    if (success) {
        if (namespace_3f0ea7483345a2c0::function_54066dbd8ef44fe1(container) || container.var_46a3a8565ac0c17c == 15) {
            namespace_3f0ea7483345a2c0::function_505e8eb7e77704c5(self, container);
        } else {
            namespace_3f0ea7483345a2c0::function_153d3281e46e14da(self, container, var_d54a79024c228770, 0, 0);
        }
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7383
// Size: 0x1f8
function function_9f1f9042105e4240(itemtype, itemindex, var_65b695f0c0d909ed) {
    if (!namespace_d20f8ef223912e12::function_420ec7054801a5bd(itemtype, itemindex)) {
        return;
    }
    loadoutdata = function_cf1bef64e94f2d1a(itemtype, itemindex);
    if (!isdefined(loadoutdata)) {
        return;
    }
    var_10e2428105250e94 = loadoutdata[0];
    var_e0628a07e9d30516 = loadoutdata[1];
    var_c0013762498c2706 = function_6738846da50730f1(var_65b695f0c0d909ed);
    _ = var_c0013762498c2706[2];
    var_dfab44d4d8d10b36 = var_c0013762498c2706[1];
    var_f27898e4afd922b4 = var_c0013762498c2706[0];
    var_fe868233e98e9d8b = namespace_38b993c4618e76cd::getScriptableFromLootID(var_f27898e4afd922b4);
    var_ecbfb8d6f45ca36b = namespace_38b993c4618e76cd::getScriptableFromLootID(var_10e2428105250e94);
    var_3a83234b1fa4439d = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_10e2428105250e94);
    var_b3fccfb5ca1d6ea8 = var_f27898e4afd922b4 == 0;
    if (!var_b3fccfb5ca1d6ea8) {
        var_128a351cea87d140 = namespace_cb965d2f71fefddc::issuperpickup(var_fe868233e98e9d8b) && namespace_cb965d2f71fefddc::issuperpickup(var_ecbfb8d6f45ca36b);
        var_bb9a27098c4e4de9 = var_3a83234b1fa4439d != "super_stimpistol" || var_3a83234b1fa4439d != "super_oxygen_mask";
        if (var_128a351cea87d140 && var_bb9a27098c4e4de9) {
            thread namespace_cb965d2f71fefddc::function_cab3366841d709aa(var_65b695f0c0d909ed);
            return;
        }
    }
    if (var_10e2428105250e94 == var_f27898e4afd922b4 && namespace_aead94004cf4c147::function_e01d9736b2d100ac(var_10e2428105250e94, var_e0628a07e9d30516)) {
        namespace_cb965d2f71fefddc::function_d8cd9c1941a88194(var_10e2428105250e94, var_e0628a07e9d30516, undefined, 1, 1, 1);
        thread namespace_cb965d2f71fefddc::quickdropall(itemtype, itemindex, 1);
        return;
    }
    function_a0ccc23064473a05(self, var_65b695f0c0d909ed, var_10e2428105250e94, var_e0628a07e9d30516);
    thread namespace_cb965d2f71fefddc::quickdropall(itemtype, itemindex, 1);
    if (!var_b3fccfb5ca1d6ea8 && !namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(self, var_fe868233e98e9d8b, 1, var_dfab44d4d8d10b36)) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
        item = namespace_cb965d2f71fefddc::spawnpickup(var_fe868233e98e9d8b, var_cb4fad49263e20c4, var_dfab44d4d8d10b36, 1);
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7582
// Size: 0x58d
function function_a763f6f503206771(player, scriptable, lootid) {
    if (!isdefined(scriptable) || !isdefined(player)) {
        return;
    }
    var_60227bff1e9478cc = spawnstruct();
    var_60227bff1e9478cc.scriptablename = namespace_cb965d2f71fefddc::lootGetScriptableName(scriptable);
    var_60227bff1e9478cc.count = scriptable.count;
    var_a08d277f2971b749 = 0;
    if (namespace_cb965d2f71fefddc::isweaponpickup(var_60227bff1e9478cc.scriptablename)) {
        if (namespace_aead94004cf4c147::function_b13e35608b336d65(player) <= 5) {
            return;
        }
        if (istrue(player.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
            player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
            return;
        }
        weaponpickup = namespace_3bcd40a3005712ec::function_55c5d35c8c76a95b(scriptable);
        newweapon = weaponpickup[0];
        var_a08d277f2971b749 = 0;
        foreach (weap in player.primaryweapons) {
            if (issameweapon(weap, newweapon)) {
                var_60227bff1e9478cc.scriptablename = br_ammo_type_for_weapon(newweapon);
                var_60227bff1e9478cc.count = weaponclipsize(newweapon);
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_60227bff1e9478cc.scriptablename);
                var_a08d277f2971b749 = 1;
            }
        }
        if (namespace_aead94004cf4c147::function_efab78b72d131d76(player) && !var_a08d277f2971b749) {
            var_9ac5e72784815708 = namespace_aead94004cf4c147::function_2985254128b1c262(player);
            if (issameweapon(var_9ac5e72784815708, newweapon)) {
                var_60227bff1e9478cc.scriptablename = br_ammo_type_for_weapon(newweapon);
                var_60227bff1e9478cc.count = weaponclipsize(newweapon);
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_60227bff1e9478cc.scriptablename);
                var_a08d277f2971b749 = 1;
            } else {
                dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
                var_facc6a1a18b419f0 = player namespace_cb965d2f71fefddc::dropbrweapon(var_9ac5e72784815708, dropstruct, scriptable.origin);
                itemcount = function_53c4c53197386572(player.var_3ef503345dc57957, 0);
                var_59bd51afc73df2cd = function_53c4c53197386572(player.var_ad7897ecdbcb63, 0);
                namespace_cb965d2f71fefddc::loot_setitemcount(var_facc6a1a18b419f0, itemcount, var_59bd51afc73df2cd, player.var_86b32aff94b5714e);
                if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
                    var_facc6a1a18b419f0.metadata = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(player, 2);
                }
                namespace_aead94004cf4c147::function_954372d604277278(player);
            }
        }
        if (!var_a08d277f2971b749) {
            var_bada25504e8844d7 = spawnstruct();
            newcount = namespace_cb965d2f71fefddc::loot_getitemcount(scriptable);
            var_bada25504e8844d7.scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
            var_bada25504e8844d7.origin = player.origin;
            var_bada25504e8844d7.count = newcount;
            var_bada25504e8844d7.weapon = newweapon;
            var_bada25504e8844d7.var_4a08890fd43d6bc7 = 1;
            var_bada25504e8844d7.countlefthand = 0;
            var_bada25504e8844d7.var_e97d731bedd44c63 = scriptable.var_e97d731bedd44c63;
            var_bada25504e8844d7.metadata = scriptable.metadata;
            var_bada25504e8844d7.customweaponname = scriptable.customweaponname;
            var_bada25504e8844d7.var_e1147886ccf51970 = scriptable.var_e1147886ccf51970;
            [[ namespace_3c37cb17ade254d::getsharedfunc("pmc_missions", "onPickupWeapon") ]](player, newweapon, var_bada25504e8844d7.metadata);
            namespace_cb965d2f71fefddc::function_60234aa487445085(var_bada25504e8844d7, player, 0, scriptable);
            return;
        }
    }
    results = namespace_cb965d2f71fefddc::cantakepickup(var_60227bff1e9478cc);
    if (results == 1 && (namespace_aead94004cf4c147::function_e01d9736b2d100ac(lootid, var_60227bff1e9478cc.count) || namespace_cb965d2f71fefddc::isplunder(var_60227bff1e9478cc.scriptablename)) || results == 20) {
        var_5a88dbc7a4ed6e63 = 1 && !namespace_cb965d2f71fefddc::isplunder(var_60227bff1e9478cc.scriptablename) && !namespace_d3d40f75bb4e4c32::isammo(var_60227bff1e9478cc.scriptablename) && !namespace_d3d40f75bb4e4c32::function_e62085e15d2da8f6(var_60227bff1e9478cc.scriptablename);
        namespace_cb965d2f71fefddc::lootused(scriptable, undefined, undefined, player, undefined, undefined, 1, var_5a88dbc7a4ed6e63);
        if (namespace_a548bd428a566cf3::isarmorplate(var_60227bff1e9478cc.scriptablename)) {
            player armor::function_50deea7508dbf174();
        }
        return;
    }
    if (!player namespace_d20f8ef223912e12::function_1c7f3f4e23f94f86(var_60227bff1e9478cc.scriptablename)) {
        return;
    }
    if (namespace_cb965d2f71fefddc::isplunder(var_60227bff1e9478cc.scriptablename)) {
        return;
    }
    if (var_a08d277f2971b749) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.br_pickupdenyalreadyhaveweapon);
        return;
    }
    if (namespace_cb965d2f71fefddc::function_df3f5431c93ed5a1(lootid)) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_61251ef22efa8d15);
        return;
    }
    var_491c9b4e02748831 = scriptable;
    var_491c9b4e02748831.contents = [];
    var_491c9b4e02748831.var_46a3a8565ac0c17c = 14;
    var_491c9b4e02748831.contents[0] = [];
    var_491c9b4e02748831.contents[0]["quantity"] = scriptable.count;
    var_491c9b4e02748831.contents[0]["lootID"] = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_60227bff1e9478cc.scriptablename);
    namespace_3f0ea7483345a2c0::function_68ca06034b8aaccd(player, var_491c9b4e02748831);
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b16
// Size: 0xe4
function function_c2f16e2bbb4e38c0(var_4185480fa177ddb5, quantity) {
    if (!isdefined(quantity)) {
        quantity = 1;
    }
    items = strtok(var_4185480fa177ddb5, ",");
    foreach (itemname in items) {
        var_65b695f0c0d909ed = namespace_aead94004cf4c147::getAvailableDMZBackpackIndex();
        if (!isdefined(var_65b695f0c0d909ed)) {
            break;
        }
        var_60227bff1e9478cc = spawnstruct();
        var_60227bff1e9478cc.scriptablename = itemname;
        var_60227bff1e9478cc.count = quantity;
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_60227bff1e9478cc.scriptablename);
        namespace_aead94004cf4c147::addItemToBackpack(lootid, var_60227bff1e9478cc);
    }
}

// Namespace namespace_e50e624d9af51c8c/namespace_aead94004cf4c147
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7c01
// Size: 0x52
function function_dee7316da051a630(var_a1093166de09e6b8) {
    if (isdefined(var_a1093166de09e6b8) && isdefined(level.br_pickups) && isdefined(level.br_pickups.var_4138f9ddc1cd22d)) {
        return level.br_pickups.var_4138f9ddc1cd22d[var_a1093166de09e6b8];
    } else {
        return undefined;
    }
}

