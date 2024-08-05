#using scripts\engine\utility.gsc;

#namespace namespace_2b1145f62aa835b8;

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x108d
// Size: 0x37
function function_c7f98a48eeddbf2f(animname, notifystring, var_d3a7686bdb2b1c76, blendtype) {
    return utility::function_f3bb4f4911a1beb2("anim", "scriptModelPlayAnimDeltaMotion", animname, notifystring, var_d3a7686bdb2b1c76, blendtype);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10cd
// Size: 0x41
function function_87072b42853a9c58(perkname) {
    has_perk = 0;
    if (utility::issharedfuncdefined("perk", "hasPerk")) {
        has_perk = self [[ utility::getsharedfunc("perk", "hasPerk") ]](perkname);
    }
    return has_perk;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1117
// Size: 0x33
function function_cc76abced8a70f47(perkname) {
    if (issharedfuncdefined("perk", "activatePerk")) {
        self [[ getsharedfunc("perk", "activatePerk") ]](perkname);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1152
// Size: 0x3c
function function_690e9e142ebc1c69(fieldupgrade1, var_7e39824ce66c0669) {
    if (utility::issharedfuncdefined("perk", "perkpackage_giveOverrideFieldUpgrades")) {
        self [[ utility::getsharedfunc("perk", "perkpackage_giveOverrideFieldUpgrades") ]](fieldupgrade1, var_7e39824ce66c0669);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1196
// Size: 0x33
function function_5942f6cdbb6cb63b(perkname) {
    if (utility::issharedfuncdefined("perk", "givePerk")) {
        self [[ utility::getsharedfunc("perk", "givePerk") ]](perkname);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11d1
// Size: 0x33
function function_edbac3224d97a666(perkname) {
    if (utility::issharedfuncdefined("perk", "removePerk")) {
        self [[ utility::getsharedfunc("perk", "removePerk") ]](perkname);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x120c
// Size: 0x57
function function_234f5394668ed388(ref, optionalnumber, playerforplayercard, altdisplayindex, var_ef4849b4cb3ac7e2) {
    if (utility::issharedfuncdefined("hud", "showSplash")) {
        self [[ utility::getsharedfunc("hud", "showSplash") ]](ref, optionalnumber, playerforplayercard, altdisplayindex, var_ef4849b4cb3ac7e2);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x126b
// Size: 0x45
function function_ced51005e26102fa(funcname, param1, param2) {
    if (utility::issharedfuncdefined("hud", "showErrorMessage")) {
        self [[ utility::getsharedfunc("hud", "showErrorMessage") ]](funcname, param1, param2);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12b8
// Size: 0x37
function function_946938d9fde4bdce(featurename) {
    if (utility::issharedfuncdefined("game", "isFeatureDisabled")) {
        return [[ utility::getsharedfunc("game", "isFeatureDisabled") ]](featurename);
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12f7
// Size: 0x29
function checkforactiveobjicon() {
    if (utility::issharedfuncdefined("game", "checkForActiveObjIcon")) {
        self [[ utility::getsharedfunc("game", "checkForActiveObjIcon") ]]();
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1328
// Size: 0x29
function deletequestobjicon() {
    if (utility::issharedfuncdefined("game", "deleteQuestObjIcon")) {
        self [[ utility::getsharedfunc("game", "deleteQuestObjIcon") ]]();
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1359
// Size: 0x73
function function_9d6d4c76abc82cf(pickupname, dropinfo, count, showtrail, weaponobj, allowautopickup, countlefthand, var_e97d731bedd44c63) {
    if (utility::issharedfuncdefined("game", "spawnPickup")) {
        [[ utility::getsharedfunc("game", "spawnPickup") ]](pickupname, dropinfo, count, showtrail, weaponobj, allowautopickup, countlefthand, var_e97d731bedd44c63);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13d4
// Size: 0x44
function function_aa6b52df8080cac7(var_e31d665c86f80a86, count, origin) {
    if (utility::issharedfuncdefined("game", "spawnPickupFromList")) {
        [[ utility::getsharedfunc("game", "spawnPickupFromList") ]](var_e31d665c86f80a86, count, origin);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1420
// Size: 0x33
function function_e0a57e47b2947bc(lootid) {
    if (utility::issharedfuncdefined("game", "getScriptableFromLootID")) {
        return [[ utility::getsharedfunc("game", "getScriptableFromLootID") ]](lootid);
    }
    return undefined;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x145c
// Size: 0x69
function function_38e113a4c30f6c0d(scriptablename, itemorigin, itemangles, itemindex, totalitemcount, var_14c85b39207719b8, var_57266f5ca6feebd7) {
    if (utility::issharedfuncdefined("game", "spawnNewItemFromScriptable")) {
        return [[ utility::getsharedfunc("game", "spawnNewItemFromScriptable") ]](scriptablename, itemorigin, itemangles, itemindex, totalitemcount, var_14c85b39207719b8, var_57266f5ca6feebd7);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x14cd
// Size: 0x73
function function_bb87cfae1e28e70b(index, baseorigin, baseangles, ignoreent, var_8a600b6102da9f9b, var_f71d4f78d508da69, var_6fe2ff802d5192d4, var_3ace5ac9c7d6fa44) {
    if (utility::issharedfuncdefined("game", "getItemDropOriginAndAngles")) {
        [[ utility::getsharedfunc("game", "getItemDropOriginAndAngles") ]](index, baseorigin, baseangles, ignoreent, var_8a600b6102da9f9b, var_f71d4f78d508da69, var_6fe2ff802d5192d4, var_3ace5ac9c7d6fa44);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1548
// Size: 0x5f
function function_e2db59d7677bfceb(player, scriptablename, var_43fb3d97abb79854, countoverride, fromkiosk, droppurchased) {
    if (utility::issharedfuncdefined("game", "br_forceGiveCustomPickupItem")) {
        return [[ utility::getsharedfunc("game", "br_forceGiveCustomPickupItem") ]](player, scriptablename, var_43fb3d97abb79854, countoverride, fromkiosk, droppurchased);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x15af
// Size: 0x4d
function function_98bd9179435d1557(player, plunderspent, purchasetype, itemname) {
    if (utility::issharedfuncdefined("game", "brAnalytics_kiosk_purchaseItem")) {
        return [[ utility::getsharedfunc("game", "brAnalytics_kiosk_purchaseItem") ]](player, plunderspent, purchasetype, itemname);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1604
// Size: 0x45
function function_25fb9a3b7ee98d69(funcname, param1, param2) {
    if (utility::issharedfuncdefined("game", "runBrGametypeFunc")) {
        self [[ utility::getsharedfunc("game", "runBrGametypeFunc") ]](funcname, param1, param2);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1651
// Size: 0x32
function function_be79dba5f7b2a51b(scriptablename) {
    if (utility::issharedfuncdefined("game", "isKiosk")) {
        return [[ utility::getsharedfunc("game", "isKiosk") ]](scriptablename);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x168b
// Size: 0x32
function function_76ae39f27ed53321(pickupent) {
    if (utility::issharedfuncdefined("game", "canTakePickup")) {
        return [[ utility::getsharedfunc("game", "canTakePickup") ]](pickupent);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16c5
// Size: 0x44
function function_e667d74ecc894ceb(player, menuevent, var_6c457c5f341beb23) {
    if (utility::issharedfuncdefined("game", "brAnalytics_kiosk_menu_event")) {
        [[ utility::getsharedfunc("game", "brAnalytics_kiosk_menu_event") ]](player, menuevent, var_6c457c5f341beb23);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1711
// Size: 0x45
function function_f4c2d922e3610d74(iconref, state, var_38116998df9814d4) {
    if (utility::issharedfuncdefined("game", "createQuestObjIcon")) {
        self [[ utility::getsharedfunc("game", "createQuestObjIcon") ]](iconref, state, var_38116998df9814d4);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x175e
// Size: 0x33
function function_46f7ad16e39b4e0d(player) {
    if (utility::issharedfuncdefined("game", "showQuestObjIconToPlayer")) {
        self [[ utility::getsharedfunc("game", "showQuestObjIconToPlayer") ]](player);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1799
// Size: 0x33
function function_2f0d084017095d28(eventtype) {
    if (utility::issharedfuncdefined("game", "isPublicEventOfTypeActive")) {
        return [[ utility::getsharedfunc("game", "isPublicEventOfTypeActive") ]](eventtype);
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17d5
// Size: 0x33
function function_601b78b411b7479(player) {
    if (utility::issharedfuncdefined("game", "hideQuestObjIconFromPlayer")) {
        self [[ utility::getsharedfunc("game", "hideQuestObjIconFromPlayer") ]](player);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1810
// Size: 0x32
function function_1a0bffd69502c210(player) {
    if (utility::issharedfuncdefined("game", "isBrPracticeMode")) {
        return [[ utility::getsharedfunc("game", "isBrPracticeMode") ]]();
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x184b
// Size: 0x29
function function_f41fe8dc1d31d5bf() {
    if (utility::issharedfuncdefined("game", "respawnTokenDisabled")) {
        return [[ utility::getsharedfunc("game", "respawnTokenDisabled") ]]();
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x187d
// Size: 0x2a
function function_c8dfc3feceeb2896() {
    if (utility::issharedfuncdefined("game", "hasSelfReviveToken")) {
        return self [[ utility::getsharedfunc("game", "hasSelfReviveToken") ]]();
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x18b0
// Size: 0x57
function function_da31e13c27a6acf4(killstreakref, dropcurrent, fromkiosk, droppurchased, var_db943473454f6ea6) {
    if (utility::issharedfuncdefined("game", "forceGiveKillstreak")) {
        return self [[ utility::getsharedfunc("game", "forceGiveKillstreak") ]](killstreakref, dropcurrent, fromkiosk, droppurchased, var_db943473454f6ea6);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1910
// Size: 0x33
function function_5c8ad6e89a9f7b73(location) {
    if (utility::issharedfuncdefined("game", "traceSelectedMapLocation")) {
        return [[ utility::getsharedfunc("game", "traceSelectedMapLocation") ]](location);
    }
    return undefined;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x194c
// Size: 0x3b
function function_cfb85293f9660751(weapon, maxammo) {
    if (utility::issharedfuncdefined("game", "getDefaultWeaponAmmo")) {
        return [[ utility::getsharedfunc("game", "getDefaultWeaponAmmo") ]](weapon, maxammo);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1990
// Size: 0x29
function function_83e3b506365bafc5() {
    if (utility::issharedfuncdefined("game", "isBackpackInventoryEnabled")) {
        return [[ utility::getsharedfunc("game", "isBackpackInventoryEnabled") ]]();
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19c2
// Size: 0x29
function function_67386b14d0c7d1ee() {
    if (utility::issharedfuncdefined("game", "getGameType")) {
        return [[ utility::getsharedfunc("game", "getGameType") ]]();
    }
    return undefined;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19f4
// Size: 0x33
function function_3d48da36c7fd0fdb(plunderspent) {
    if (utility::issharedfuncdefined("game", "calculatePurchaseXp")) {
        return [[ utility::getsharedfunc("game", "calculatePurchaseXp") ]](plunderspent);
    }
    return undefined;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a30
// Size: 0x29
function function_a8a68668a0b2c9c4() {
    if (utility::issharedfuncdefined("game", "isAnyTutorialOrBotPracticeMatch")) {
        return [[ utility::getsharedfunc("game", "isAnyTutorialOrBotPracticeMatch") ]]();
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a62
// Size: 0x33
function function_9bc69c26770d9533(callback) {
    if (utility::issharedfuncdefined("game", "registerOnLuiEventCallback")) {
        level [[ utility::getsharedfunc("game", "registerOnLuiEventCallback") ]](callback);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a9d
// Size: 0x33
function function_496ba4f72ba5e5d1(index) {
    if (utility::issharedfuncdefined("game", "isLoadoutIndexDefault")) {
        return [[ utility::getsharedfunc("game", "isLoadoutIndexDefault") ]](index);
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad9
// Size: 0x33
function function_6a38b44a9a4e8761(menuindex) {
    if (utility::issharedfuncdefined("game", "getClassChoice")) {
        return [[ utility::getsharedfunc("game", "getClassChoice") ]](menuindex);
    }
    return undefined;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b15
// Size: 0x33
function function_3fcb060110170ac9(funcname) {
    if (utility::issharedfuncdefined("game", "isBrGametypeFuncDefined")) {
        return [[ utility::getsharedfunc("game", "isBrGametypeFuncDefined") ]](funcname);
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b51
// Size: 0x3d
function function_188f8c265a7ef6ea(spawn_origin, flaretype) {
    if (utility::issharedfuncdefined("game", "utilFlare_shootFlare")) {
        level thread [[ utility::getsharedfunc("game", "utilFlare_shootFlare") ]](spawn_origin, flaretype);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b96
// Size: 0x45
function function_9cb5f84f96e33914(point, var_ae913f2dc0534b48, var_498e4e279fb8ed85) {
    if (utility::issharedfuncdefined("game", "isValidPointInBounds")) {
        return [[ utility::getsharedfunc("game", "isValidPointInBounds") ]](point, var_ae913f2dc0534b48, var_498e4e279fb8ed85);
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1be4
// Size: 0x4d
function function_fa5baabe8489e675(origin, var_8f6402ad8e91da6a, startcircleindex, var_26189638809f7b88) {
    if (utility::issharedfuncdefined("game", "initCirclePostStartToCircleIndex")) {
        [[ utility::getsharedfunc("game", "initCirclePostStartToCircleIndex") ]](origin, var_8f6402ad8e91da6a, startcircleindex, var_26189638809f7b88);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c39
// Size: 0x33
function function_9d18a22123e54d05(featurename) {
    if (utility::issharedfuncdefined("game", "isFeatureEnabled")) {
        return [[ utility::getsharedfunc("game", "isFeatureEnabled") ]](featurename);
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c75
// Size: 0x28
function function_baf6855827fe902() {
    if (utility::issharedfuncdefined("game", "spectate_init")) {
        [[ utility::getsharedfunc("game", "spectate_init") ]]();
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ca5
// Size: 0x50
function function_560b2e700ce084a2(v_origin) {
    if (utility::issharedfuncdefined("game", "roundNumberDifficulty")) {
        return [[ utility::getsharedfunc("game", "roundNumberDifficulty") ]](v_origin);
    }
    assertmsg("Define a function for gametype " + level.gametype + " using scripts\engine\utility::registerSharedFunc( \"game\", \"roundNumberDifficulty\", func ) to get the round number difficulty");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cfd
// Size: 0x3c
function function_9563f2d4e690856d(team, property) {
    if (utility::issharedfuncdefined("game", "getTeamData")) {
        return [[ utility::getsharedfunc("game", "getTeamData") ]](team, property);
    }
    return [];
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d42
// Size: 0x2e
function function_83823ec7b243d291(type, category, value) {
    return utility::function_f3bb4f4911a1beb2("game", "registerScoreInfo", type, category, value);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1d79
// Size: 0x40
function function_414c67fb50cf15b8(player, soundtype, targetent, delay, location) {
    return utility::function_f3bb4f4911a1beb2("game", "trySayLocalSound", player, soundtype, targetent, delay, location);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc2
// Size: 0x1c
function function_d73502b54466bc10(data) {
    return utility::function_f3bb4f4911a1beb2("game", "handlemovingplatforms", data);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1de7
// Size: 0x12
function function_61575e37b9200c0d() {
    return utility::function_f3bb4f4911a1beb2("game", "isTeamReviveEnabled");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1e02
// Size: 0x53
function function_978c422352ec22bc(var_21323aee11762c98, showto, tomark, groupowner, friendlymarker, markonspawn, var_262f4b55aa151de1) {
    return utility::function_f3bb4f4911a1beb2("game", "targetMarkerGroup_on", var_21323aee11762c98, showto, tomark, groupowner, friendlymarker, markonspawn, var_262f4b55aa151de1);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5e
// Size: 0x1c
function function_a24feab7513ef158(var_4226c12910d867d4) {
    return utility::function_f3bb4f4911a1beb2("game", "targetMarkerGroup_off", var_4226c12910d867d4);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1e83
// Size: 0x49
function function_e09c803c659910d1(threatbiasgroup, var_5c00772332ce642c, islethal, var_5f6534ad3a0a1fa2, var_719c179eabb70b31, var_8928fdf873929e88) {
    return utility::function_f3bb4f4911a1beb2("game", "registerSentient", threatbiasgroup, var_5c00772332ce642c, islethal, var_5f6534ad3a0a1fa2, var_719c179eabb70b31, var_8928fdf873929e88);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed5
// Size: 0x25
function function_1882e2b280ff6e57(ent, ref) {
    return utility::function_f3bb4f4911a1beb2("game", "registerEntForOOB", ent, ref);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f03
// Size: 0x25
function function_366da6404beaf71d(ent, fromdeath) {
    return utility::function_f3bb4f4911a1beb2("game", "clearOOB", ent, fromdeath);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f31
// Size: 0x1c
function function_6a067ab37ac2c0c2(entity) {
    return utility::function_f3bb4f4911a1beb2("game", "addSpawnViewer", entity);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f56
// Size: 0x1c
function function_7d39bf4c0d07e091(entity) {
    return utility::function_f3bb4f4911a1beb2("game", "removeSpawnViewer", entity);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f7b
// Size: 0x1d
function function_cea710f9d017694a(set) {
    utility::function_f3bb4f4911a1beb2("game", "ForceNetfieldHighLoD", set);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa0
// Size: 0x25
function function_73f2baa01fa2b921(var_863c619037f3ac74, var_da8cec9bce12f9cb) {
    return utility::function_f3bb4f4911a1beb2("game", "isPointInOutOfBounds", var_863c619037f3ac74, var_da8cec9bce12f9cb);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fce
// Size: 0x12
function function_b1412f0ab907bab7() {
    return function_f3bb4f4911a1beb2("game", "isBRStyleGameType");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe9
// Size: 0x1c
function function_2284137aa92dbd16(duration) {
    return utility::function_f3bb4f4911a1beb2("hostmigration", "waitLongDurationWithPause", duration);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x200e
// Size: 0x25
function waittill_notify_or_timeout_hostmigration_pause(msg, duration) {
    return utility::function_f3bb4f4911a1beb2("hostmigration", "waittillNotifyOrTimeoutPause", msg, duration);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x203c
// Size: 0x40
function function_300f8bd96a4461ff(objweapon, start, end, owner, event_ent) {
    return utility::function_f3bb4f4911a1beb2("weapons", "magicBullet", objweapon, start, end, owner, event_ent);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2085
// Size: 0x1c
function function_6262c3a1ef0924d(set) {
    return function_f3bb4f4911a1beb2("weapons", "setMissileMinimapVisible", set);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x20aa
// Size: 0x7b
function function_7a0d2d9d94d820ae(position, duration, scalemax, scalemid, scalemin, radiusmax, radiusmid, radiusmin, ignoreclients, playrumble, var_a03583ed539bdb39) {
    return utility::function_f3bb4f4911a1beb2("shellshock", "artillery_earthQuake", position, duration, scalemax, scalemid, scalemin, radiusmax, radiusmid, radiusmin, ignoreclients, playrumble, var_a03583ed539bdb39);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x212e
// Size: 0x4e
function function_74efaa97ebfec5df(points, scoreevent, var_b4b593facaa83af7, pointsmultiplier) {
    if (utility::issharedfuncdefined("supers", "giveSuperPoints")) {
        self [[ utility::getsharedfunc("supers", "giveSuperPoints") ]](points, scoreevent, var_b4b593facaa83af7, pointsmultiplier);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2184
// Size: 0x29
function function_19dd797e5d48d987() {
    if (utility::issharedfuncdefined("supers", "getSuperPointsNeeded")) {
        self [[ utility::getsharedfunc("supers", "getSuperPointsNeeded") ]]();
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x21b5
// Size: 0x4e
function function_4f2bd7da634cba24(superref, var_6c70bf5ad211f464, immediate, blueprintindex) {
    if (utility::issharedfuncdefined("supers", "giveSuper")) {
        self [[ utility::getsharedfunc("supers", "giveSuper") ]](superref, var_6c70bf5ad211f464, immediate, blueprintindex);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x220b
// Size: 0x34
function function_77986db57958b676(killstreakref) {
    if (utility::issharedfuncdefined("player", "hasKillstreak")) {
        return self [[ utility::getsharedfunc("player", "hasKillstreak") ]](killstreakref);
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2248
// Size: 0x2a
function function_3f422a1c87bd2809() {
    if (utility::issharedfuncdefined("player", "isSuperInUse")) {
        return self [[ utility::getsharedfunc("player", "isSuperInUse") ]]();
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x227b
// Size: 0x29
function function_97fac14206681b1f() {
    if (utility::issharedfuncdefined("player", "getCurrentSuperRef")) {
        return self [[ utility::getsharedfunc("player", "getCurrentSuperRef") ]]();
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22ac
// Size: 0x2a
function function_eceea793e05658bd() {
    if (utility::issharedfuncdefined("player", "br_ammo_player_is_maxed_out")) {
        return self [[ utility::getsharedfunc("player", "br_ammo_player_is_maxed_out") ]]();
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x22df
// Size: 0x3c
function function_6e3db23952f2e451(pickupent, var_db943473454f6ea6) {
    if (utility::issharedfuncdefined("player", "takeWeaponPickup")) {
        self [[ utility::getsharedfunc("player", "takeWeaponPickup") ]](pickupent, var_db943473454f6ea6);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2323
// Size: 0x57
function function_eb96721d13c5f3df(targetsupername, dropcurrent, fromkiosk, droppurchased, var_db943473454f6ea6) {
    if (utility::issharedfuncdefined("player", "forceGiveSuper")) {
        self [[ utility::getsharedfunc("player", "forceGiveSuper") ]](targetsupername, dropcurrent, fromkiosk, droppurchased, var_db943473454f6ea6);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2382
// Size: 0x29
function function_836c7d119e02d1d5() {
    if (utility::issharedfuncdefined("player", "br_ammo_player_max_out")) {
        self [[ utility::getsharedfunc("player", "br_ammo_player_max_out") ]]();
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23b3
// Size: 0x33
function function_c00f90a28c41febe(skipsplash) {
    if (utility::issharedfuncdefined("player", "addRespawnToken")) {
        self [[ utility::getsharedfunc("player", "addRespawnToken") ]](skipsplash);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23ee
// Size: 0x33
function function_2d5a30d6fe54567b(skipsplash) {
    if (utility::issharedfuncdefined("player", "addSelfReviveToken")) {
        self [[ utility::getsharedfunc("player", "addSelfReviveToken") ]](skipsplash);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x2429
// Size: 0x5d
function updatehitmarker_sharedfunc(markertype, killingblow, headshot, nonplayer, icontype, targetentnum, var_f7ea2887b1e3535b, var_203066c6662e1f2d) {
    return utility::function_f3bb4f4911a1beb2("hitmarker", "updateHitMarker_SharedFunc", markertype, killingblow, headshot, nonplayer, icontype, targetentnum, var_f7ea2887b1e3535b, var_203066c6662e1f2d);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x248f
// Size: 0x1c
function updateDamageFeedback_SharedFunc(icontype) {
    return utility::function_f3bb4f4911a1beb2("hitmarker", "updateDamageFeedback_SharedFunc", icontype);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24b4
// Size: 0x2e
function function_c4d8558fc1592cd6() {
    if (utility::issharedfuncdefined("player", "isJuggernaut")) {
        return self [[ utility::getsharedfunc("player", "isJuggernaut") ]]();
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x24ea
// Size: 0x4f
function function_ef240aa7c1052d13(lootid, pickup, var_70e660487c2924ec, param4) {
    if (utility::issharedfuncdefined("player", "addItemToBackpack")) {
        return self [[ utility::getsharedfunc("player", "addItemToBackpack") ]](lootid, pickup, var_70e660487c2924ec, param4);
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2542
// Size: 0x29
function function_507b98884b41cc8e() {
    if (utility::issharedfuncdefined("player", "getAvailableDMZBackpackIndex")) {
        return [[ utility::getsharedfunc("player", "getAvailableDMZBackpackIndex") ]]();
    }
    return undefined;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x2574
// Size: 0x88
function function_e800498086e36c29(event, objweapon, pointsoverride, xpoverride, victim, var_51bdae03b05bc75e, dontwait, cankillchain, streakinfo, var_827c276da1cdcf23) {
    if (utility::issharedfuncdefined("player", "doScoreEvent")) {
        return [[ utility::getsharedfunc("player", "doScoreEvent") ]](event, objweapon, pointsoverride, xpoverride, victim, var_51bdae03b05bc75e, dontwait, cankillchain, streakinfo, var_827c276da1cdcf23);
    }
    return undefined;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2605
// Size: 0x3d
function function_a4968a44b192f2ed(class, var_1dce12d4eaf02799) {
    if (utility::issharedfuncdefined("player", "preloadAndQueueClass")) {
        return self [[ utility::getsharedfunc("player", "preloadAndQueueClass") ]](class, var_1dce12d4eaf02799);
    }
    return undefined;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x264b
// Size: 0x3b
function function_be7af2b74939c9b5(player, dropcurrent) {
    if (utility::issharedfuncdefined("player", "br_giveSelectedClass")) {
        [[ utility::getsharedfunc("player", "br_giveSelectedClass") ]](player, dropcurrent);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x268e
// Size: 0x2a
function function_b71e2f7afd69d580() {
    if (utility::issharedfuncdefined("player", "isEligibleForTeamRevive")) {
        return self [[ utility::getsharedfunc("player", "isEligibleForTeamRevive") ]]();
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26c1
// Size: 0x33
function function_f6c807a601f8a34d(player) {
    if (utility::issharedfuncdefined("player", "isRespawningFromToken")) {
        return [[ utility::getsharedfunc("player", "isRespawningFromToken") ]](player);
    }
    return 0;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x26fd
// Size: 0x53
function function_8bd31d20349aa464(sponsor, tokenused, var_5806c4765695a2f4, var_74af5908127b6729) {
    if (utility::issharedfuncdefined("player", "playerGulagAutoWin")) {
        self [[ utility::getsharedfunc("player", "playerGulagAutoWin") ]]("", sponsor, tokenused, var_5806c4765695a2f4, var_74af5908127b6729);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2758
// Size: 0x34
function function_20071a4b90f92b46(spawnpoint) {
    if (utility::issharedfuncdefined("player", "playerPrestreamRespawnOrigin")) {
        return self [[ utility::getsharedfunc("player", "playerPrestreamRespawnOrigin") ]](spawnpoint);
    }
    return undefined;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2795
// Size: 0x33
function function_a39e8a33d7378f08(fadespectators) {
    if (utility::issharedfuncdefined("player", "gulagFadeToBlack")) {
        self [[ utility::getsharedfunc("player", "gulagFadeToBlack") ]](fadespectators);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27d0
// Size: 0x29
function function_92e04b29006f91c() {
    if (utility::issharedfuncdefined("player", "gulagStreamExit")) {
        self [[ utility::getsharedfunc("player", "gulagStreamExit") ]]();
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2801
// Size: 0x3c
function function_2cea92d21876a90a(origin, angles) {
    if (utility::issharedfuncdefined("player", "gulagStreamExit")) {
        self [[ utility::getsharedfunc("player", "gulagStreamExit") ]](origin, angles);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2845
// Size: 0x33
function function_1f5865aab1fdafd(ent) {
    if (utility::issharedfuncdefined("player", "gulagStreamExit")) {
        self [[ utility::getsharedfunc("player", "gulagStreamExit") ]](ent);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2880
// Size: 0x29
function function_b4e05f84b56c7bbf() {
    if (utility::issharedfuncdefined("player", "playerWaittillStreamHintComplete")) {
        self [[ utility::getsharedfunc("player", "playerWaittillStreamHintComplete") ]]();
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28b1
// Size: 0x29
function function_ba38e09a56256701() {
    if (utility::issharedfuncdefined("player", "playerClearStreamHintOrigin")) {
        self [[ utility::getsharedfunc("player", "playerClearStreamHintOrigin") ]]();
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28e2
// Size: 0x29
function function_4ec23357b146259c() {
    if (utility::issharedfuncdefined("player", "resetPlayerMoveSpeedScale")) {
        self [[ utility::getsharedfunc("player", "resetPlayerMoveSpeedScale") ]]();
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2913
// Size: 0x29
function function_b17054c9879ea13b() {
    if (utility::issharedfuncdefined("player", "gulagFadeFromBlack")) {
        self [[ utility::getsharedfunc("player", "gulagFadeFromBlack") ]]();
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2944
// Size: 0x3c
function function_78a18c3b6dbfb0a5(amount, data) {
    if (utility::issharedfuncdefined("player", "playerPlunderKioskPurchase")) {
        self [[ utility::getsharedfunc("player", "playerPlunderKioskPurchase") ]](amount, data);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2988
// Size: 0x2e
function function_11ab60f2ec5f498a(player, fadetoblack, fadetime) {
    return utility::function_f3bb4f4911a1beb2("player", "fadeToBlackForPlayer", player, fadetoblack, fadetime);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x29bf
// Size: 0x40
function function_e65042177e4ef1be(name, category, duration, animationresponse, interruptdelayms) {
    return utility::function_f3bb4f4911a1beb2("player", "shellShock", name, category, duration, animationresponse, interruptdelayms);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a08
// Size: 0x1c
function function_35dc5da55bba8f1e(fromdeath) {
    return utility::function_f3bb4f4911a1beb2("player", "stopShellShock", fromdeath);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a2d
// Size: 0x12
function function_c0954ceff138883b() {
    return utility::function_f3bb4f4911a1beb2("player", "setDOF_cruiseFirst");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2a48
// Size: 0x2e
function function_bb10f30a40421b3f(frozen, force, debug) {
    return utility::function_f3bb4f4911a1beb2("player", "freezeControls", frozen, force, debug);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a7f
// Size: 0x1c
function function_ff961ce881949b90(player) {
    return utility::function_f3bb4f4911a1beb2("player", "getSuperFaction", player);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2aa4
// Size: 0x12
function function_287a1854579369f5() {
    return utility::function_f3bb4f4911a1beb2("player", "_isAlive");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2abf
// Size: 0x37
function function_883458a342af3041(origin, radius, desiredteam, excludeent) {
    return utility::function_f3bb4f4911a1beb2("player", "getPlayersInRadius", origin, radius, desiredteam, excludeent);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2aff
// Size: 0x25
function function_3ce030587f143c98(frozen, force) {
    return utility::function_f3bb4f4911a1beb2("player", "freezeLookControls", frozen, force);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2d
// Size: 0x3b
function function_90ca6872b70e4c2e(player, reason) {
    if (utility::issharedfuncdefined("dlog", "brAnalytics_inventory_snapshot")) {
        [[ utility::getsharedfunc("dlog", "brAnalytics_inventory_snapshot") ]](player, reason);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b70
// Size: 0x44
function function_3cf2d6ddf853bdee(player, plunderspent, loadoutdata) {
    if (utility::issharedfuncdefined("dlog", "brAnalytics_kiosk_purchaseLoadout")) {
        [[ utility::getsharedfunc("dlog", "brAnalytics_kiosk_purchaseLoadout") ]](player, plunderspent, loadoutdata);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2bbc
// Size: 0x46
function function_88cafec24778c70c(confirmstring, cancelstring, endstring) {
    if (utility::issharedfuncdefined("killstreak", "waittill_confirm_or_cancel")) {
        return self [[ utility::getsharedfunc("killstreak", "waittill_confirm_or_cancel") ]](confirmstring, cancelstring, endstring);
    }
    return undefined;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c0b
// Size: 0x25
function function_f8f5d33ba1c643df(bundle, killstreak) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "killstreak_registerMinimapInfo", bundle, killstreak);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x2c39
// Size: 0x71
function function_2c47324e96a0854a(streakname, killstreakvehicle, scorepopup, vodestroyed, destroyedsplash, var_8dfc256103cce53e, var_191284e2e2837328, var_bacc6dd14316758c, var_7da88d9c69433487, deathcallback) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "killstreak_setupVehicleDamageFunctionality", streakname, killstreakvehicle, scorepopup, vodestroyed, destroyedsplash, var_8dfc256103cce53e, var_191284e2e2837328, var_bacc6dd14316758c, var_7da88d9c69433487, deathcallback);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x2cb3
// Size: 0x7b
function function_d055c8fd735fd960(attacker, objweapon, meansofdeath, amount, maxhealth, var_cb15fa5174e71840, var_be7c04516c5d9ccd, var_ca960a517459fe15, var_8aceb016baaf67af, var_64103c6b531d18f0, explodeoverride) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "getModifiedAntiKillstreakDamage", attacker, objweapon, meansofdeath, amount, maxhealth, var_cb15fa5174e71840, var_be7c04516c5d9ccd, var_ca960a517459fe15, var_8aceb016baaf67af, var_64103c6b531d18f0, explodeoverride);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d37
// Size: 0x1c
function function_ea1962c946f018b2(currenthealth) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "killstreak_updateDamageState", currenthealth);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x2d5c
// Size: 0x5d
function function_de31b76c1bf488e8(streakinfo, weaponobj, firednotify, var_bdffc63c4171c131, var_8fd4d93dd619da88, weaponfiredcallback, var_91f739c2c51347d4, var_d55d8445518099b) {
    return function_f3bb4f4911a1beb2("killstreak", "streakDeploy_doWeaponFiredDeploy", streakinfo, weaponobj, firednotify, var_bdffc63c4171c131, var_8fd4d93dd619da88, weaponfiredcallback, var_91f739c2c51347d4, var_d55d8445518099b);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dc2
// Size: 0x27
function function_b01aad7f0553d2c8() {
    if (issharedfuncdefined("killstreak", "playerKillstreakGetOwnerLookAtIgnoreEnts")) {
        return function_f3bb4f4911a1beb2("killstreak", "playerKillstreakGetOwnerLookAtIgnoreEnts");
    }
    return undefined;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2df2
// Size: 0x40
function function_940b2080e171a9d3(owner, ownerteam, range, streakname, location) {
    return function_f3bb4f4911a1beb2("killstreak", "killstreak_dangerNotifyPlayersInRange", owner, ownerteam, range, streakname, location);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2e3b
// Size: 0x37
function function_62de81d97c7d9e49(streakname, triggeredfunc, availablefunc, var_b1469bcdaec75a9) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "registerKillstreak", streakname, triggeredfunc, availablefunc, var_b1469bcdaec75a9);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2e7b
// Size: 0x2e
function function_a41e3a211a9e37a4(streakname, var_d8a64ed9bcdf7185, damagesize) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "registerKillstreakDamageDealingWeapon", streakname, var_d8a64ed9bcdf7185, damagesize);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2eb2
// Size: 0x2e
function function_80dd0a6b17291eb3(streakname, var_3e99c59055b3de67, var_5c9ddcf56d36f133) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "registerVisibilityOmnvarForKillstreak", streakname, var_3e99c59055b3de67, var_5c9ddcf56d36f133);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ee9
// Size: 0x25
function function_bc5bcad4a3bbd734(streakname, owner) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "createStreakInfo", streakname, owner);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x2f17
// Size: 0x71
function function_63046c2c6bbd3868(streakinfo, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b, var_f6a32dcc4b19aad9, var_67a06b4ea269058e, var_afe464c242489272, var_818a18147626dfbf, var_c2a00d4f077ebd87) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "streakDeploy_doWeaponTabletDeploy", streakinfo, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b, var_f6a32dcc4b19aad9, var_67a06b4ea269058e, var_afe464c242489272, var_818a18147626dfbf, var_c2a00d4f077ebd87);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f91
// Size: 0x12
function function_b00fe2fecfa420d0() {
    return utility::function_f3bb4f4911a1beb2("killstreak", "getKillstreakAirStrikeHeightEnt");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2fac
// Size: 0x40
function function_d1b8339c6ab7b1fa(streakname, dialog, var_db68eeda63af9504, delaytime, charactersuffix) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "playKillstreakOperatorDialog", streakname, dialog, var_db68eeda63af9504, delaytime, charactersuffix);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ff5
// Size: 0x34
function function_25c4c34d6c3dd08a(killstreakref) {
    if (utility::issharedfuncdefined("killstreak", "forceUseKillstreak")) {
        return self [[ utility::getsharedfunc("killstreak", "forceUseKillstreak") ]](killstreakref);
    }
    return undefined;
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3032
// Size: 0x46
function function_f5e58b5375381386(splashref, streakval, fromcarepackage) {
    if (utility::issharedfuncdefined("airdrop", "showKillstreakSplash")) {
        self thread [[ utility::getsharedfunc("airdrop", "showKillstreakSplash") ]](splashref, streakval, fromcarepackage);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x3080
// Size: 0x6a
function function_f87529d7af4978b(streakname, source, overridelifeid, var_722764086bd2150d, overrideowner, var_546f4a2e8b131d3f, blueprintindex) {
    if (utility::issharedfuncdefined("killstreak", "awardKillstreak")) {
        self [[ utility::getsharedfunc("killstreak", "awardKillstreak") ]](streakname, source, overridelifeid, var_722764086bd2150d, overrideowner, var_546f4a2e8b131d3f, blueprintindex);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30f2
// Size: 0x25
function function_6741f10c19432885(streakname, var_b677bbe2241c4e3f) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "setVisibiilityOmnvarForKillstreak", streakname, var_b677bbe2241c4e3f);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3120
// Size: 0x1c
function function_37b26588f564813d(player) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "restoreKillstreakPlayerAngles", player);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3145
// Size: 0x1c
function function_fd8ddf2e23d31475(streakinfo) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "recordKillstreakEndStats", streakinfo);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x316a
// Size: 0x1c
function function_b23ab1c04cc7fea2(visionsetname) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "killstreak_setMainVision", visionsetname);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x318f
// Size: 0x1c
function function_a271c8ce1dd6c1b1(visionsetinfo) {
    return utility::function_f3bb4f4911a1beb2("killstreak", "killstreak_setSubVision", visionsetinfo);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31b4
// Size: 0x1c
function function_2470b047f8e10642(count) {
    return utility::function_f3bb4f4911a1beb2("vehicle", "reserveVehicle", count);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31d9
// Size: 0x1c
function function_49d5647f46bfe073(count) {
    return utility::function_f3bb4f4911a1beb2("vehicle", "clearVehicleReservation", count);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31fe
// Size: 0x1c
function function_10498f0a8127ad3a(bool) {
    return utility::function_f3bb4f4911a1beb2("vehicle", "vehicle_damage_setCanDamage", bool);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3223
// Size: 0x25
function function_3c16f3b83d60acbb(ref, minradius) {
    return utility::function_f3bb4f4911a1beb2("vehicle", "vehicle_spawn_setClearanceCheckMinRadius", ref, minradius);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3251
// Size: 0x2e
function function_b2db3eefeaba048f(data, changed, fromdeath) {
    return utility::function_f3bb4f4911a1beb2("vehicle", "vehicle_damage_clearVisuals", data, changed, fromdeath);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3288
// Size: 0x12
function function_d7d7db3140b95ce3() {
    return function_f3bb4f4911a1beb2("vehicle", "vehicleCanFly");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x32a3
// Size: 0x25
function function_1a9f6dcef6e686ab(spawndata, faildata) {
    return utility::function_f3bb4f4911a1beb2("vehicle", "spawnVehicle", spawndata, faildata);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32d1
// Size: 0x1c
function function_2b2ae7070b2e47d(vehicle) {
    return utility::function_f3bb4f4911a1beb2("vehicle", "deleteVehicle", vehicle);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x32f6
// Size: 0x2e
function function_84cc2da11f01ae43(vehicle, owner, team) {
    return utility::function_f3bb4f4911a1beb2("vehicle", "registerInstance", vehicle, owner, team);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x332d
// Size: 0x1c
function function_239d68eacdce9d10(vehicle) {
    return utility::function_f3bb4f4911a1beb2("vehicle", "deregisterInstance", vehicle);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3352
// Size: 0x1c
function function_97e107d1361352a9(position) {
    return utility::function_f3bb4f4911a1beb2("event", "predatorMissileImpact", position);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3377
// Size: 0x1c
function function_1d266a4cf6b48ffa(position) {
    return utility::function_f3bb4f4911a1beb2("event", "largeVehicleExplosion", position);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x339c
// Size: 0x1c
function function_60a28142eebe56eb(damagedata) {
    return utility::function_f3bb4f4911a1beb2("event", "vehicleKilled", damagedata);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33c1
// Size: 0x1c
function function_f03259645f5df6c0(missile) {
    return utility::function_f3bb4f4911a1beb2("event", "missileFired", missile);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x33e6
// Size: 0x3f
function function_641996b5e113c5c6(entity, applycallback, startcallback, clearcallback) {
    return utility::function_f3bb4f4911a1beb2(#"emp", #"hash_a865e3770eb96298", entity, applycallback, startcallback, clearcallback);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x342e
// Size: 0x1c
function function_83cebe0ae5318a7f(entity) {
    return utility::function_f3bb4f4911a1beb2("emp", "emp_debuff_deregister", entity);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3453
// Size: 0x1c
function function_940c49da06910de0(fromdeath) {
    return utility::function_f3bb4f4911a1beb2("emp", "clear_emp", fromdeath);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3478
// Size: 0x1c
function function_72b03e277d253250(status) {
    return utility::function_f3bb4f4911a1beb2("emp", "allow_emp", status);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x349d
// Size: 0x12
function function_8e610f938a53a07d() {
    return utility::function_f3bb4f4911a1beb2("emp", "emp_debuff_get_emp_count");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34b8
// Size: 0x12
function function_f3890748bda5f813() {
    return function_f3bb4f4911a1beb2("emp", "is_empd");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x34d3
// Size: 0x25
function function_345d613203ca10d8(var_fa88f8af6b2f44d0, isjammer) {
    return utility::function_f3bb4f4911a1beb2("emp", "play_scramble", var_fa88f8af6b2f44d0, isjammer);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3501
// Size: 0x25
function function_ea96a5c13167a126(var_fa88f8af6b2f44d0, isjammer) {
    return utility::function_f3bb4f4911a1beb2("emp", "stop_scramble", var_fa88f8af6b2f44d0, isjammer);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x352f
// Size: 0x2e
function function_2ad34da25e5bdd45(aliasname, player, srcentity) {
    return utility::function_f3bb4f4911a1beb2("sound", "playSoundToPlayer", aliasname, player, srcentity);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3566
// Size: 0x40
function function_1f9d1f30f6845dd(fxid, position, player, forward, up) {
    return utility::function_f3bb4f4911a1beb2("fx", "SpawnFXForClient", fxid, position, player, forward, up);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35af
// Size: 0x13
function function_e531ef189c6c5d1d() {
    utility::function_f3bb4f4911a1beb2("fx", "SetFXKillDefOnDelete");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x35ca
// Size: 0x25
function function_2611d163b331ae1d(scriptbundle_name, current_round) {
    return utility::function_f3bb4f4911a1beb2("zombie", "health_scaling_get_starting_health", scriptbundle_name, current_round);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35f8
// Size: 0x12
function function_f1810da227cb50f9() {
    return utility::function_f3bb4f4911a1beb2("zombie", "ammo_mod_cooldown_init");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3613
// Size: 0x1c
function function_2e380dedfcfc7972(w_current) {
    return utility::function_f3bb4f4911a1beb2("zombie", "has_ammo_mod", w_current);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3638
// Size: 0x1c
function function_87b7af080857567f(w_current) {
    return utility::function_f3bb4f4911a1beb2("zombie", "get_ammo_mod_name", w_current);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x365d
// Size: 0x1c
function function_ed7c10f78d0598f2(weapon) {
    return utility::function_f3bb4f4911a1beb2("zombie", "GetPlayerWeaponRarity", weapon);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3682
// Size: 0x1c
function function_af5127390d3221e9(weapon) {
    return utility::function_f3bb4f4911a1beb2("zombie", "get_pap_level", weapon);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x36a7
// Size: 0x71
function onHumanoidAgentKilledCommon_SharedFunc(einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration, dropweapons) {
    return utility::function_f3bb4f4911a1beb2("ai", "onHumanoidAgentKilledCommon_SharedFunc", einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration, dropweapons);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3721
// Size: 0x40
function spawnnewaitype_sharedfunc(aitype, position, angles, team, var_42e5c77b1d7fe6e7) {
    return utility::function_f3bb4f4911a1beb2("ai", "spawnNewAIType_SharedFunc", aitype, position, angles, team, var_42e5c77b1d7fe6e7);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x376a
// Size: 0x40
function Animscripted_SharedFunc(anime, anim_string, org, var_8c94765ca587f86c, anim_flag) {
    return utility::function_f3bb4f4911a1beb2("ai", "Animscripted_SharedFunc", anime, anim_string, org, var_8c94765ca587f86c, anim_flag);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37b3
// Size: 0x1c
function get_aitype_by_subclass_sharedfunc(subclass) {
    return utility::function_f3bb4f4911a1beb2("ai", "get_aitype_by_subclass_SharedFunc", subclass);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37d8
// Size: 0x12
function get_aitype_default_spawn_team_SharedFunc() {
    return utility::function_f3bb4f4911a1beb2("ai", "get_aitype_default_spawn_team_SharedFunc");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x37f3
// Size: 0x7b
function displaydamagenumber_sharedfunc(eattacker, etargethit, shitloc, smeansofdeath, sweapon, idamage, vpoint, var_da71c7321bc0a0f6, selement, var_14edc6d1db3695bc, var_feef4b237a6beb07) {
    return utility::function_f3bb4f4911a1beb2("ai", "displayDamageNumber_SharedFunc", eattacker, etargethit, shitloc, smeansofdeath, sweapon, idamage, vpoint, var_da71c7321bc0a0f6, selement, var_14edc6d1db3695bc, var_feef4b237a6beb07);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3877
// Size: 0x1c
function function_ae4755f24321c4dc(weapname) {
    return utility::function_f3bb4f4911a1beb2("ai", "giveAIWeapon", weapname);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x389c
// Size: 0x12
function function_c9eebf69d9a55148() {
    return utility::function_f3bb4f4911a1beb2("ai", "GetFreeAICount");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38b7
// Size: 0x12
function function_2f8556207c6fd79f() {
    return function_f3bb4f4911a1beb2("cameras", "GetCameraThirdPerson");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38d2
// Size: 0x12
function function_aef9ca498b472945() {
    return function_f3bb4f4911a1beb2("cameras", "GetCameraThirdPersonOrigin");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x38ed
// Size: 0x3c
function function_a93fbc5ac33fc2f2(powerupname, lifetime) {
    if (utility::issharedfuncdefined("powerups", "showPowerupHud")) {
        self [[ utility::getsharedfunc("powerups", "showPowerupHud") ]](powerupname, lifetime);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3931
// Size: 0x29
function function_990cf49669e49965() {
    if (utility::issharedfuncdefined("powerups", "doPowerupScoreEvent")) {
        self [[ utility::getsharedfunc("powerups", "doPowerupScoreEvent") ]]();
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3962
// Size: 0x45
function function_f4927f5a7aa5c6ab(powerupname, spawnpos, lifetimeOverride) {
    if (utility::issharedfuncdefined("powerups", "dropPowerup")) {
        return self [[ utility::getsharedfunc("powerups", "dropPowerup") ]](powerupname, spawnpos, lifetimeOverride);
    }
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39af
// Size: 0x12
function function_fc2ee23e4402d457() {
    return utility::function_f3bb4f4911a1beb2("points", "get_points");
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39ca
// Size: 0x1c
function function_993919ed9d35feeb(points) {
    return utility::function_f3bb4f4911a1beb2("points", "set_points", points);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39ef
// Size: 0x1c
function function_36a28b99ec0f7fd8(points) {
    return utility::function_f3bb4f4911a1beb2("points", "add_points", points);
}

// Namespace namespace_2b1145f62aa835b8 / namespace_53fc9ddbb516e6e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a14
// Size: 0x1c
function function_88137cfcbacc59b2(points) {
    return utility::function_f3bb4f4911a1beb2("points", "take_points", points);
}

