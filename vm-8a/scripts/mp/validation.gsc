#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\class.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_5c80e17482acb972;
#using scripts\mp\equipment.gsc;
#using scripts\mp\loot.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;

#namespace validation;

// Namespace validation / scripts\mp\validation
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66b
// Size: 0xa1
function validationerror(errortype, slot, item) {
    errorstring = errortype;
    if (isdefined(slot)) {
        errorstring = errorstring + "_" + slot;
    }
    if (isdefined(item)) {
        errorstring = errorstring + " - " + item;
    }
    /#
        if (getdvarint(@"hash_58bbcc3e1ff538d1", 0) == 1) {
            println(errorstring);
        }
    #/
    if (getdvarint(@"hash_49f347129c31c40c", 0) == 1) {
        assertmsg(errorstring);
    }
    if (getdvarint(@"hash_93c750a2b4a79e93", 0) == 1) {
        scripts\mp\class::recordvalidationinfraction();
    }
}

// Namespace validation / scripts\mp\validation
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x714
// Size: 0x3f
function isvalidattachmentunlock(var_49e6ef3edadd524e, attachmentbasename) {
    var_338c04a2f19ba8b6 = getdvarint(@"hash_464624f0183de3d0", 0) == 1;
    if (var_338c04a2f19ba8b6) {
        return attachmentisselectablerootname(var_49e6ef3edadd524e, attachmentbasename);
    }
    return 1;
}

// Namespace validation / scripts\mp\validation
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75c
// Size: 0x1d9
function function_f6d25a34b1d286b1() {
    var_cfbd5dfab1e96cb1 = getdvarint(@"hash_838359d5ebdcc7e0", 0);
    if (var_cfbd5dfab1e96cb1 == 0) {
        return;
    }
    for (loadoutindex = 0; loadoutindex < 12; loadoutindex++) {
        loadoutisinuse = self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", loadoutindex, "inUse");
        if (loadoutisinuse == 1) {
            for (weaponindex = 0; weaponindex < 2; weaponindex++) {
                weaponname = scripts\mp\class::cac_getweapon(loadoutindex, weaponindex);
                var_fedb77aad2340743 = scripts\mp\class::cac_getweaponvariantid(loadoutindex, weaponindex);
                var_2f36f150e9c51cb5 = scripts\mp\class::cac_getweaponlootitemid(loadoutindex, weaponindex);
                attachments = [];
                attachmentsids = [];
                maxattachments = ter_op(weaponindex == 0, scripts\mp\class::getmaxprimaryattachments(), scripts\mp\class::getmaxsecondaryattachments());
                var_6c85232fcab7882d = ter_op(weaponindex == 0, scripts\mp\class::function_ed8babbe1912171f(), scripts\mp\class::function_fba1013e19eb56c3());
                for (attachmentindex = 0; attachmentindex < maxattachments; attachmentindex++) {
                    attachmentname = scripts\mp\class::cac_getweaponattachment(loadoutindex, weaponindex, attachmentindex);
                    attachments[attachmentindex] = attachmentname;
                    attachmentsids[attachmentindex] = scripts\mp\class::cac_getweaponattachmentid(loadoutindex, weaponindex, attachmentindex);
                }
                camoname = scripts\mp\class::cac_getweaponcamo(loadoutindex, weaponindex);
                var_bd1db6dd9710a427 = scripts\mp\class::cac_getweaponcosmeticattachment(loadoutindex, weaponindex);
                stickers = [];
                for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < var_6c85232fcab7882d; var_36d2abbdcbcb186c++) {
                    stickers[var_36d2abbdcbcb186c] = scripts\mp\class::cac_getweaponsticker(loadoutindex, weaponindex, var_36d2abbdcbcb186c);
                }
                function_503f87754be2d15c(weaponname, var_fedb77aad2340743, var_2f36f150e9c51cb5, attachments, attachmentsids, camoname, var_bd1db6dd9710a427, stickers);
            }
        }
    }
}

// Namespace validation / scripts\mp\validation
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93d
// Size: 0x17d
function function_18b8c4c4fa0f6d1c(weaponname, weaponcamo) {
    category = getscriptbundlefieldvalue(hashcat(%"hash_1345cc24140e89b8", weaponcamo), #"camocategory");
    if (isdefined(category) && category == "camo_category_completion") {
        if (isdefined(level.var_305637ed4e3e8513[weaponname]) && isdefined(level.var_305637ed4e3e8513[weaponname][weaponcamo])) {
            return level.var_305637ed4e3e8513[weaponname][weaponcamo];
        } else {
            lootid = namespace_38b993c4618e76cd::getlootidfromref(weaponcamo);
            if (lootid == 0) {
                scripts\mp\utility\script::demoforcesre("getCamoLootID: weaponName/weaponCamo [" + weaponname + "/" + weaponcamo + "] not in level.weaponMappedCamos");
            }
            return lootid;
        }
        return;
    }
    if (isdefined(category) && category == "camo_category_events") {
        weaponclass = "";
        weaponscriptbundle = namespace_e0ee43ef2dddadaa::function_8477d8595e0364a7(weaponname, [#"menuclass"]);
        if (isdefined(weaponscriptbundle)) {
            weaponclass = weaponscriptbundle.menuclass;
        }
        if (weaponclass != "" && isdefined(level.var_305637ed4e3e8513[weaponclass]) && isdefined(level.var_305637ed4e3e8513[weaponclass][weaponcamo])) {
            return level.var_305637ed4e3e8513[weaponclass][weaponcamo];
        } else {
            lootid = namespace_38b993c4618e76cd::getlootidfromref(weaponcamo);
            if (lootid == 0) {
                scripts\mp\utility\script::demoforcesre("getCamoLootID: weaponName/weaponCamo [" + weaponname + "/" + weaponcamo + "] not in level.weaponMappedCamos");
            }
            return lootid;
        }
        return;
    }
    return namespace_38b993c4618e76cd::getlootidfromref(weaponcamo);
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac2
// Size: 0x1a5
function function_2c4d04305e3c9601(weaponlootid) {
    if (getdvarint(@"hash_272c95c93da464bb", 0) == 0) {
        return false;
    }
    var_e7a7288f46dee8e7 = [11354, 11344, 11338, 11352, 11318, 11337, 11340, 11323, 11331, 11307, 11317, 11324, 11328, 11351, 11357, 11355, 11315, 11367, 11320, 11353];
    var_4b40391f47f1d3ea = [11354, 11356, 11374, 11344, 11317, 11352];
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        foreach (var_8c996f399d5e3282 in var_e7a7288f46dee8e7) {
            if (var_8c996f399d5e3282 == weaponlootid) {
                return true;
            }
        }
    } else if (scripts\common\utility::ismp() || scripts\common\utility::iscp()) {
        foreach (var_8c996f399d5e3282 in var_4b40391f47f1d3ea) {
            if (var_8c996f399d5e3282 == weaponlootid) {
                return true;
            }
        }
    }
    return false;
}

// Namespace validation / scripts\mp\validation
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc70
// Size: 0x456
function function_503f87754be2d15c(weaponname, var_fedb77aad2340743, var_2f36f150e9c51cb5, attachments, attachmentsids, camoname, var_bd1db6dd9710a427, stickers) {
    var_4a654bd9a395c1ff = [];
    var_a4146e4eaf636ef2 = getdvarint(@"hash_c876f19dd06eb2cf", 0);
    var_989c8eafe834f9de = var_fedb77aad2340743 != 0;
    var_928c1cac31ea99e5 = weaponname + "|" + var_fedb77aad2340743;
    var_fe506348d9341132 = 0;
    if (var_2f36f150e9c51cb5 != 0) {
        var_fe506348d9341132 = var_2f36f150e9c51cb5;
    } else if (isdefined(level.weaponmapdata[weaponname])) {
        var_fe506348d9341132 = level.weaponmapdata[weaponname].weaponlootid;
    }
    if (!function_2c4d04305e3c9601(var_fe506348d9341132)) {
        var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = var_fe506348d9341132;
    }
    weaponclass = "";
    weaponscriptbundle = namespace_e0ee43ef2dddadaa::function_8477d8595e0364a7(weaponname, [#"menuclass"]);
    if (isdefined(weaponscriptbundle)) {
        weaponclass = weaponscriptbundle.menuclass;
    }
    if (isdefined(weaponclass) && weaponclass != "weapon_melee" && weaponclass != "weapon_melee2") {
        var_ad61ffb38ec2a6b0 = function_6527364c1ecca6c6(getdefaultweaponbasename(weaponname));
        foreach (attachmentindex, attachmentname in attachments) {
            if (attachmentname != "none") {
                var_763d626a0644c430 = 1;
                if (var_a4146e4eaf636ef2 == 1 && function_975e31b63f01fbcc(attachmentname)) {
                    continue;
                }
                if (attachmentsids[attachmentindex] != 0) {
                    weaponbasename = getdefaultweaponbasename(weaponname);
                    blueprints = function_4527f44d851c9afd(weaponbasename, attachmentname);
                    foreach (variantindex, attachmentdata in blueprints) {
                        if (variantindex == attachmentsids[attachmentindex] && isdefined(attachmentdata)) {
                            var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = attachmentdata.lootid;
                            if (var_989c8eafe834f9de && isdefined(level.weaponlootmapdata) && isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5]) && isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5].attachdefaulttoidmap[attachmentname]) && level.weaponlootmapdata[var_928c1cac31ea99e5].attachdefaulttoidmap[attachmentname] == variantindex) {
                                var_763d626a0644c430 = 0;
                            }
                            break;
                        }
                    }
                }
                if (var_763d626a0644c430) {
                    attachmentcategory = getscriptbundlefieldvalue(hashcat(%"hash_3c2c9813bb16552f", attachmentname), #"category");
                    if (attachmentcategory == "RECEIVER") {
                        continue;
                    }
                    var_1c34cb85a2bc9baf = 0;
                    foreach (var_c7b8980d348eb4dc in var_ad61ffb38ec2a6b0) {
                        if (var_c7b8980d348eb4dc == attachmentname) {
                            var_1c34cb85a2bc9baf = 1;
                            break;
                        }
                    }
                    if (var_1c34cb85a2bc9baf) {
                        continue;
                    }
                    attachmentscriptbundle = getscriptbundle(hashcat(%"hash_3c2c9813bb16552f", attachmentname));
                    if (isdefined(attachmentscriptbundle)) {
                        var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = attachmentscriptbundle.lootid;
                    }
                }
            }
        }
    }
    camoid = function_18b8c4c4fa0f6d1c(weaponname, camoname);
    var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = camoid;
    charmid = namespace_38b993c4618e76cd::getlootidfromref(var_bd1db6dd9710a427);
    var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = charmid;
    foreach (sticker in stickers) {
        if (sticker != "none") {
            stickerlootid = namespace_38b993c4618e76cd::getlootidfromref(sticker);
            var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = stickerlootid;
        }
    }
    self function_616c0ca219597829(var_4a654bd9a395c1ff);
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ce
// Size: 0x132
function function_5a92673db4ece37f(classstruct) {
    var_cfbd5dfab1e96cb1 = getdvarint(@"hash_838359d5ebdcc7e0", 0);
    if (var_cfbd5dfab1e96cb1 == 0) {
        return;
    }
    if (utility::iscp() || scripts\cp_mp\utility\game_utility::isbrstylegametype() || level.var_ec2fb549b15ad827 || !level.rankedmatch || !level.matchmakingmatch || !level.onlinestatsenabled) {
        return;
    }
    function_503f87754be2d15c(classstruct.loadoutprimary, classstruct.loadoutprimaryvariantid, classstruct.loadoutprimarylootitemid, classstruct.loadoutprimaryattachments, classstruct.loadoutprimaryattachmentids, classstruct.loadoutprimarycamo, classstruct.loadoutprimarycosmeticattachment, classstruct.loadoutprimarystickers);
    function_503f87754be2d15c(classstruct.loadoutsecondary, classstruct.loadoutsecondaryvariantid, classstruct.loadoutsecondarylootitemid, classstruct.loadoutsecondaryattachments, classstruct.loadoutsecondaryattachmentids, classstruct.loadoutsecondarycamo, classstruct.loadoutsecondarycosmeticattachment, classstruct.loadoutsecondarystickers);
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1208
// Size: 0x1281
function validateloadout(loadout) {
    if (getdvarint(@"hash_955ca650f9a9bdef", 0) == 1) {
        return loadout;
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && (getsubgametype() == "dmz" || getsubgametype() == "exgm") && getdvarint(@"hash_65f0ea4ff58c3fa0", 0) == 1) {
        return loadout;
    }
    var_8b3060936146ce59 = isdefined(level.gamemodebundle) && istrue(level.gamemodebundle.var_e12ed09bf2e43167);
    var_60dc2c23348c27e = 0;
    if (var_8b3060936146ce59) {
        loadout = namespace_89e4915e27d8b4fc::overrideweapons(loadout);
        vestperk = namespace_89e4915e27d8b4fc::function_ec995ec88ab7fb6c(loadout);
        if (vestperk == "specialty_null" && istrue(level.allowperks)) {
            var_60dc2c23348c27e = 1;
        }
    }
    fallbackloadout = function_9480a79a4852090f();
    function_5a92673db4ece37f(loadout);
    replaceweapon = 0;
    if (!function_89497fa763d431c0(loadout.loadoutprimary)) {
        replaceweapon = 1;
    } else if (isweaponuihidden(loadout.loadoutprimary)) {
        replaceweapon = 1;
    }
    var_de6cf437be756ee1 = istrue(getdvarint(@"hash_576703ba86051da6", 0));
    if (var_de6cf437be756ee1 && namespace_38b993c4618e76cd::function_8c610908c0e9c6e4(loadout.loadoutprimary)) {
        replaceweapon = 1;
    }
    underkillperkname = "specialty_underkill";
    var_6940a6d9400f329b = !perkisrestricted(underkillperkname) && array_contains(loadout.loadoutperks, underkillperkname);
    if (var_8b3060936146ce59 && loadout.loadoutprimary != "none" && level.perkbundles[vestperk].var_885724e5007453be.primary == 0) {
        var_60dc2c23348c27e = 1;
    }
    if (!var_8b3060936146ce59 && !iscacprimaryweapon(loadout.loadoutprimary) && !var_6940a6d9400f329b) {
        replaceweapon = 1;
    }
    var_bc72f32b1575d517 = 0;
    var_e1388376a5be9b75 = 0;
    primaryweaponclass = function_b8811a0fc04e4b9d(loadout.loadoutprimary, #"menuclass");
    if (weaponisrestricted(loadout.loadoutprimary) || isdefined(primaryweaponclass) && function_dc0d4632189b623a(primaryweaponclass)) {
        replaceweapon = 1;
        var_bc72f32b1575d517 = 1;
    }
    if (replaceweapon) {
        loadout = replaceprimaryweapon(loadout);
    } else {
        if (isweaponvariantlocked(loadout.loadoutprimary, loadout.loadoutprimaryvariantid)) {
            loadout.loadoutprimaryvariantid = -1;
        }
        for (i = 0; i < loadout.loadoutprimaryattachments.size; i++) {
            attachment = loadout.loadoutprimaryattachments[i];
            if (attachment != "none" && attachmentisrestricted(attachment, loadout.loadoutprimary)) {
                attachmentscriptbundle = getscriptbundle(hashcat(%"hash_3c2c9813bb16552f", attachment));
                if (isdefined(attachmentscriptbundle) && attachmentscriptbundle.var_f0e7c0926c0962e5) {
                    for (j = 0; j < loadout.loadoutprimaryattachments.size; j++) {
                        loadout.loadoutprimaryattachments[j] = "none";
                    }
                    break;
                }
                loadout.loadoutprimaryattachments[i] = "none";
                var_e1388376a5be9b75 = 1;
            }
        }
    }
    replaceweapon = 0;
    if (!function_89497fa763d431c0(loadout.loadoutsecondary)) {
        replaceweapon = 1;
    } else if (isweaponuihidden(loadout.loadoutsecondary)) {
        replaceweapon = 1;
    }
    if (var_8b3060936146ce59 && loadout.loadoutsecondary != "none" && level.perkbundles[vestperk].var_885724e5007453be.secondary == 0) {
        var_60dc2c23348c27e = 1;
    }
    if (var_de6cf437be756ee1 && namespace_38b993c4618e76cd::function_8c610908c0e9c6e4(loadout.loadoutsecondary)) {
        replaceweapon = 1;
    }
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype() && !var_8b3060936146ce59) {
        overkillperkname = "specialty_munitions_2";
        var_df3d6a2ffc2e83c1 = !perkisrestricted(overkillperkname) && array_contains(loadout.loadoutperks, overkillperkname);
        if (iscacprimaryweapon(loadout.loadoutsecondary) && !var_df3d6a2ffc2e83c1) {
            replaceweapon = 1;
        }
    }
    secondaryweaponclass = function_b8811a0fc04e4b9d(loadout.loadoutsecondary, #"menuclass");
    if (weaponisrestricted(loadout.loadoutsecondary) || isdefined(secondaryweaponclass) && function_dc0d4632189b623a(secondaryweaponclass)) {
        replaceweapon = 1;
        var_bc72f32b1575d517 = 1;
    }
    if (replaceweapon) {
        loadout = replacesecondaryweapon(loadout);
    } else {
        if (isweaponvariantlocked(loadout.loadoutsecondary, loadout.loadoutsecondaryvariantid)) {
            loadout.loadoutsecondaryvariantid = -1;
        }
        for (i = 0; i < loadout.loadoutsecondaryattachments.size; i++) {
            attachment = loadout.loadoutsecondaryattachments[i];
            if (attachment != "none" && attachmentisrestricted(attachment, loadout.loadoutsecondary)) {
                attachmentscriptbundle = getscriptbundle(hashcat(%"hash_3c2c9813bb16552f", attachment));
                if (isdefined(attachmentscriptbundle) && attachmentscriptbundle.var_f0e7c0926c0962e5) {
                    for (j = 0; j < loadout.loadoutsecondaryattachments.size; j++) {
                        loadout.loadoutsecondaryattachments[j] = "none";
                    }
                    break;
                }
                loadout.loadoutsecondaryattachments[i] = "none";
                var_e1388376a5be9b75 = 1;
            }
        }
    }
    if (istrue(level.var_9e090a159cb48220)) {
    }
    var_5e76ad052ba12845 = 0;
    var_a0f3cd42271b8f4a = getmatchrulesdata("commonOption", "replaceIndividualRestrictedPerks");
    var_cf6e4e07bffcbf2e = 0;
    var_cd857b8539e7f332 = 0;
    var_3e44eb1af492ae49 = 0;
    var_55b5518be09f25f5 = 0;
    var_5e6c1f1aa70d60ce = 0;
    var_442df125f92806b2 = [];
    foreach (idx, perk in loadout.loadoutperks) {
        if (!function_f45c19871b412ea5(perk)) {
            continue;
        }
        slot = scripts\mp\perks\perks::getperkslot(perk);
        if (var_8b3060936146ce59 && isdefined(perk) && isdefined(level.perkbundles[perk])) {
            if (!namespace_89e4915e27d8b4fc::function_8cdbad2a3681247e(perk, vestperk)) {
                var_60dc2c23348c27e = 1;
                var_5e6c1f1aa70d60ce = 1;
                break;
            }
            if (level.perkbundles[perk].var_70774aeb81261100 == "vest") {
                var_cf6e4e07bffcbf2e += 1;
            } else if (level.perkbundles[perk].var_70774aeb81261100 == "gloves") {
                var_cd857b8539e7f332 += 1;
            } else if (level.perkbundles[perk].var_70774aeb81261100 == "footwear") {
                var_3e44eb1af492ae49 += 1;
            } else if (level.perkbundles[perk].var_70774aeb81261100 == "gear") {
                var_55b5518be09f25f5 += 1;
                var_442df125f92806b2[var_442df125f92806b2.size] = perk;
            }
        }
        if (isdefined(fallbackloadout.perks) && !isdefined(slot)) {
            var_5e76ad052ba12845 = 1;
            break;
        }
        if (perkisrestricted(perk)) {
            if (var_a0f3cd42271b8f4a) {
                if (idx < fallbackloadout.perks.size) {
                    loadout.loadoutperks[idx] = fallbackloadout.perks[idx];
                }
                continue;
            }
            var_5e76ad052ba12845 = 1;
            break;
        }
    }
    if (var_8b3060936146ce59) {
        if (var_cf6e4e07bffcbf2e > 1 || var_cd857b8539e7f332 > 1 || var_3e44eb1af492ae49 > 1 || var_55b5518be09f25f5 > 2) {
            var_60dc2c23348c27e = 1;
            var_5e6c1f1aa70d60ce = 1;
        } else if (var_55b5518be09f25f5 == 2 && (level.perkbundles[vestperk].var_885724e5007453be.gearone == 0 || level.perkbundles[vestperk].var_885724e5007453be.geartwo == 0)) {
            if (level.perkbundles[vestperk].var_885724e5007453be.gearone == 0 && level.perkbundles[vestperk].var_885724e5007453be.geartwo == 0) {
                loadout.loadoutperks = array_remove(loadout.loadoutperks, var_442df125f92806b2[0]);
                loadout.loadoutperks = array_remove(loadout.loadoutperks, var_442df125f92806b2[1]);
            } else {
                loadout.loadoutperks = array_remove(loadout.loadoutperks, var_442df125f92806b2[1]);
            }
        }
    }
    if (!isdefined(loadout.loadoutperks) || var_5e76ad052ba12845 == 1) {
        if (var_8b3060936146ce59) {
            var_60dc2c23348c27e = 1;
            var_5e6c1f1aa70d60ce = 1;
        } else {
            loadout = function_5e76ad052ba12845(loadout);
        }
    }
    if (var_8b3060936146ce59 && var_5e6c1f1aa70d60ce) {
        msg = "Replace FLC Loadout set due to Perks. replacePerks = " + var_5e76ad052ba12845 + " ";
        for (i = 0; i < loadout.loadoutperks.size; i++) {
            msg += "Perk " + i + ": " + loadout.loadoutperks[i] + " ";
        }
        assertmsg(msg);
    }
    if (killstreakisrestricted("specialist_perk_1") || killstreakisrestricted("specialist_perk_2") || killstreakisrestricted("specialist_perk_3")) {
        loadout.loadoutusingspecialist = 0;
    }
    if (var_8b3060936146ce59) {
        if (loadout.loadoutequipmentprimary != "none") {
            if (level.perkbundles[vestperk].var_885724e5007453be.lethal == 0) {
                var_60dc2c23348c27e = 1;
            } else if (!scripts\mp\equipment::isequipmentprimary(loadout.loadoutequipmentprimary) || !scripts\mp\equipment::isequipmentselectable(loadout.loadoutequipmentprimary) || equipmentisrestricted(loadout.loadoutequipmentprimary)) {
                loadout = namespace_89e4915e27d8b4fc::function_625a1bdd25647c6b(loadout);
            }
        } else if (loadout.loadoutextraequipmentprimary != 0) {
            if (level.perkbundles[vestperk].var_885724e5007453be.lethaltwo == 0) {
                var_60dc2c23348c27e = 1;
            } else if (!scripts\mp\equipment::isequipmentprimary(loadout.loadoutextraequipmentprimary) || !scripts\mp\equipment::isequipmentselectable(loadout.loadoutextraequipmentprimary) || equipmentisrestricted(loadout.loadoutextraequipmentprimary)) {
                loadout = namespace_89e4915e27d8b4fc::function_625a1bdd25647c6b(loadout);
            }
        }
    } else if (!scripts\mp\equipment::isequipmentprimary(loadout.loadoutequipmentprimary) || !scripts\mp\equipment::isequipmentselectable(loadout.loadoutequipmentprimary)) {
        loadout.loadoutequipmentprimary = fallbackloadout.var_223912952e2fcaa5;
    } else if (equipmentisrestricted(loadout.loadoutequipmentprimary)) {
        loadout.loadoutequipmentprimary = fallbackloadout.var_223912952e2fcaa5;
        var_bc72f32b1575d517 = 1;
    }
    if (var_8b3060936146ce59) {
        if (loadout.loadoutequipmentsecondary != "none") {
            if (level.perkbundles[vestperk].var_885724e5007453be.tactical == 0) {
                var_60dc2c23348c27e = 1;
            } else if (!scripts\mp\equipment::isequipmentsecondary(loadout.loadoutequipmentsecondary) || !scripts\mp\equipment::isequipmentselectable(loadout.loadoutequipmentsecondary) || equipmentisrestricted(loadout.loadoutequipmentsecondary)) {
                loadout = namespace_89e4915e27d8b4fc::function_1ccfa7dccda7da0f(loadout);
            }
        } else if (loadout.loadoutextraequipmentsecondary != 0) {
            if (level.perkbundles[vestperk].var_885724e5007453be.tacticaltwo == 0) {
                var_60dc2c23348c27e = 1;
            } else if (!scripts\mp\equipment::isequipmentsecondary(loadout.loadoutextraequipmentsecondary) || !scripts\mp\equipment::isequipmentselectable(loadout.loadoutextraequipmentsecondary) || equipmentisrestricted(loadout.loadoutextraequipmentsecondary)) {
                loadout = namespace_89e4915e27d8b4fc::function_1ccfa7dccda7da0f(loadout);
            }
        }
    } else if (!scripts\mp\equipment::isequipmentsecondary(loadout.loadoutequipmentsecondary) || !scripts\mp\equipment::isequipmentselectable(loadout.loadoutequipmentsecondary)) {
        loadout.loadoutequipmentsecondary = fallbackloadout.var_56507f15843909c5;
    } else if (equipmentisrestricted(loadout.loadoutequipmentsecondary)) {
        loadout.loadoutequipmentsecondary = fallbackloadout.var_56507f15843909c5;
        var_bc72f32b1575d517 = 1;
    }
    if (var_8b3060936146ce59 && loadout.loadoutfieldupgrade1 != "none" && level.perkbundles[vestperk].var_885724e5007453be.super == 0) {
        var_60dc2c23348c27e = 1;
    }
    replacekillstreaks = 0;
    for (i = 0; i < 3; i++) {
        if (killstreakisrestricted(fallbackloadout.fallbackkillstreaks[i])) {
            var_35bd18d6d22e7106[i] = "none";
        }
    }
    if (!isanymlgmatch() && (loadout.loadoutkillstreak1 == "none" || loadout.loadoutkillstreak2 == "none" || loadout.loadoutkillstreak3 == "none")) {
        replacekillstreaks = 1;
    }
    if (!replacekillstreaks) {
        bundle = level.streakglobals.streakbundles[loadout.loadoutkillstreak1];
        if (!(isanymlgmatch() && loadout.loadoutkillstreak1 == "none") && (!isdefined(bundle) || !isdefined(bundle.var_594af43597023062) || !bundle.var_594af43597023062)) {
            replacekillstreaks = 1;
        }
        bundle = level.streakglobals.streakbundles[loadout.loadoutkillstreak2];
        if (!(isanymlgmatch() && loadout.loadoutkillstreak2 == "none") && (!isdefined(bundle) || !isdefined(bundle.var_594af43597023062) || !bundle.var_594af43597023062)) {
            replacekillstreaks = 1;
        }
        bundle = level.streakglobals.streakbundles[loadout.loadoutkillstreak3];
        if (!(isanymlgmatch() && loadout.loadoutkillstreak3 == "none") && (!isdefined(bundle) || !isdefined(bundle.var_594af43597023062) || !bundle.var_594af43597023062)) {
            replacekillstreaks = 1;
        }
    }
    if (!replacekillstreaks) {
        if (killstreakisrestricted(loadout.loadoutkillstreak1)) {
            loadout.loadoutkillstreak1 = fallbackloadout.fallbackkillstreaks[0];
            var_bc72f32b1575d517 = 1;
        }
        if (killstreakisrestricted(loadout.loadoutkillstreak2)) {
            loadout.loadoutkillstreak2 = fallbackloadout.fallbackkillstreaks[1];
            var_bc72f32b1575d517 = 1;
        }
        if (killstreakisrestricted(loadout.loadoutkillstreak3)) {
            loadout.loadoutkillstreak3 = fallbackloadout.fallbackkillstreaks[2];
            var_bc72f32b1575d517 = 1;
        }
    }
    if (!replacekillstreaks) {
        if (loadout.loadoutkillstreak1 == loadout.loadoutkillstreak2 && loadout.loadoutkillstreak1 != "none") {
            replacekillstreaks = 1;
        } else if (loadout.loadoutkillstreak1 == loadout.loadoutkillstreak3 && loadout.loadoutkillstreak1 != "none") {
            replacekillstreaks = 1;
        } else if (loadout.loadoutkillstreak2 == loadout.loadoutkillstreak3 && loadout.loadoutkillstreak2 != "none") {
            replacekillstreaks = 1;
        }
    }
    if (!replacekillstreaks) {
        bundle = level.streakglobals.streakbundles[loadout.loadoutkillstreak1];
        if (isdefined(bundle) && isdefined(bundle.kills)) {
            cost1 = bundle.kills;
        } else {
            cost1 = 0;
        }
        bundle = level.streakglobals.streakbundles[loadout.loadoutkillstreak2];
        if (isdefined(bundle) && isdefined(bundle.kills)) {
            cost2 = bundle.kills;
        } else {
            cost2 = 0;
        }
        bundle = level.streakglobals.streakbundles[loadout.loadoutkillstreak3];
        if (isdefined(bundle) && isdefined(bundle.kills)) {
            cost3 = bundle.kills;
        } else {
            cost3 = 0;
        }
        if (cost1 != 0 && cost1 == cost2) {
            replacekillstreaks = 1;
        } else if (cost1 != 0 && cost1 == cost3) {
            replacekillstreaks = 1;
        } else if (cost2 != 0 && cost2 == cost3) {
            replacekillstreaks = 1;
        }
    }
    if (replacekillstreaks) {
        loadout.loadoutkillstreak1 = fallbackloadout.fallbackkillstreaks[0];
        loadout.loadoutkillstreak2 = fallbackloadout.fallbackkillstreaks[1];
        loadout.loadoutkillstreak3 = fallbackloadout.fallbackkillstreaks[2];
    }
    if (var_8b3060936146ce59 && var_60dc2c23348c27e) {
        loadout = namespace_89e4915e27d8b4fc::function_2981e0130f5d0598(loadout);
    }
    if (level.gametype == "conf_v") {
        loadout.loadoutkillstreak1 = "none";
        loadout.loadoutkillstreak2 = "electric_discharge";
        loadout.loadoutkillstreak3 = "laser_charge";
    }
    return loadout;
}

// Namespace validation / scripts\mp\validation
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x2492
// Size: 0x2e3
function validateweapon(validationdata, weapon, attachments, camo, reticle, lootItemID, variantid, issecondary) {
    rootweaponname = getweaponrootname(weapon);
    var_99c561069f2eb71 = iscacsecondaryweapon(weapon);
    weaponslot = ter_op(issecondary, "secondary", "primary");
    itemslot = ter_op(issecondary, 4, 1);
    if (isdefined(weapon) && weapon != "none" && weapon != "iw9_me_fists") {
        validationdata.pointcost++;
        if (issecondary) {
            if (!var_99c561069f2eb71) {
                validationdata.pointcost++;
                validationdata.wildcards["overkill"] = 1;
            }
        } else if (var_99c561069f2eb71) {
            validationerror("secondaryAsPrimary", undefined, weapon);
            validationdata.invaliditems[itemslot] = 1;
        }
        if (!function_89497fa763d431c0(rootweaponname)) {
            validationerror("unknownWeapon", weaponslot, weapon);
            validationdata.invaliditems[itemslot] = 1;
        } else if (istrue(level.weaponmapdata[rootweaponname].uihidden)) {
            validationerror("unreleasedWeapon", weaponslot, weapon);
            validationdata.invaliditems[itemslot] = 1;
        }
        if (!self isitemunlocked(rootweaponname, "weapon") && !weaponunlocksvialoot(rootweaponname)) {
            validationerror("lockedWeapon", weaponslot, weapon);
            validationdata.invaliditems[itemslot] = 1;
        }
        if (lootItemID == 0) {
            if (variantid != -1) {
                validationerror("emptyItemIDMismatch", weaponslot, weapon);
                validationdata.invaliditems[itemslot] = 1;
            }
        } else if (variantid == -1) {
            validationerror("emptyVariantIDMismatch", weaponslot, weapon);
            validationdata.invaliditems[itemslot] = 1;
        } else {
            if (!scripts\mp\loot::isweaponitem(lootItemID)) {
                validationerror("nonWeaponLootItemID", weaponslot, weapon);
                validationdata.invaliditems[itemslot] = 1;
            }
            var_157c94951634cbc9 = scripts\mp\loot::getlootweaponref(lootItemID);
            if (!isdefined(var_157c94951634cbc9)) {
                validationerror("badLootItemID", weaponslot, weapon);
                validationdata.invaliditems[itemslot] = 1;
            } else {
                variantref = scripts\mp\loot::lookupvariantref(weapon, variantid);
                if (!isdefined(variantref)) {
                    validationerror("badVariantRef", weaponslot, weapon);
                    validationdata.invaliditems[itemslot] = 1;
                } else if (variantref != var_157c94951634cbc9) {
                    validationerror("lootDataMismatch", weaponslot, weapon);
                    validationdata.invaliditems[itemslot] = 1;
                }
            }
        }
        validateattachments(validationdata, attachments, weapon, rootweaponname, weaponslot);
    }
}

// Namespace validation / scripts\mp\validation
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x277d
// Size: 0x2a5
function validateattachments(validationdata, attachments, weapon, rootweaponname, weaponslot) {
    weapongroup = weapongroupmap(weapon);
    unlockcategory = getsubstr(weapongroup, 7) + "Attach";
    itemslot = ter_op(weaponslot == "primary", 2, 5);
    var_80553b9ee292c3e6 = 0;
    var_38ce0ee62103d3fb = 0;
    var_2501ca5a023e0655 = ter_op(weaponslot == "primary", 2, 2);
    foreach (attachmentindex, attachment in attachments) {
        isoptic = 0;
        if (isdefined(attachment) && attachment != "none") {
            attachmenttype = scripts\mp\utility\weapon::getattachmenttype(attachment);
            if (isdefined(attachmenttype) && attachmenttype != "") {
                if (isdefined(attachment)) {
                    if (attachmenttype == "rail") {
                        isoptic = 1;
                    }
                }
            }
            unlockitem = rootweaponname + "+" + attachment;
            if (!self isitemunlocked(unlockitem, unlockcategory)) {
                validationerror("lockedAttachment", weaponslot, attachment);
                validationdata.invaliditems[itemslot][validationdata.invaliditems[itemslot].size] = attachmentindex;
            }
            if (!attachmentisselectable(rootweaponname, attachment)) {
                validationerror("nonSelectableAttachment", weaponslot, attachment);
                validationdata.invaliditems[itemslot][validationdata.invaliditems[itemslot].size] = attachmentindex;
            }
            if (isoptic) {
                var_80553b9ee292c3e6++;
                validationdata.pointcost++;
                continue;
            }
            var_38ce0ee62103d3fb++;
            if (var_38ce0ee62103d3fb <= var_2501ca5a023e0655) {
                validationdata.pointcost++;
                continue;
            }
            validationdata.wildcards[weaponslot + "_attachment_" + var_38ce0ee62103d3fb + 1] = 1;
            validationdata.pointcost += 2;
        }
    }
    if (var_38ce0ee62103d3fb > 5) {
        validationerror("tooManyAttachments", weaponslot, var_38ce0ee62103d3fb);
        validationdata.invaliditems[ter_op(weaponslot == "primary", 3, 6)] = 1;
    }
    if (var_80553b9ee292c3e6 > 1) {
        validationerror("tooManyOpticAttachments", weaponslot, var_80553b9ee292c3e6);
        validationdata.invaliditems[ter_op(weaponslot == "primary", 3, 6)] = 1;
    }
}

// Namespace validation / scripts\mp\validation
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2a2a
// Size: 0x162
function validatepower(validationdata, power, powerslot, hasextra) {
    itemslot = ter_op(powerslot == "primary", 7, 8);
    if (isdefined(power) && power != "none") {
        if (!isdefined(level.powers[power])) {
            validationerror("unknownPower", powerslot, power);
            validationdata.invaliditems[itemslot] = 1;
        }
        if (!self isitemunlocked(power, "power")) {
            validationerror("lockedPower", powerslot, power);
            validationdata.invaliditems[itemslot] = 1;
        }
        var_a9f5ef46ba07c23f = lookuppowerslot(power);
        if (!isdefined(var_a9f5ef46ba07c23f)) {
            validationerror("unknownMenuPower", powerslot, power);
            validationdata.invaliditems[itemslot] = 1;
        } else if (var_a9f5ef46ba07c23f != powerslot) {
            validationerror("powerInWrongSlot", powerslot, power);
            validationdata.invaliditems[itemslot] = 1;
        }
        validationdata.pointcost++;
    }
    if (istrue(hasextra)) {
        validationdata.pointcost += 2;
        wildcardname = ter_op(powerslot == "primary", "extra_lethal", "extra_tactical");
        validationdata.wildcards[wildcardname] = 1;
    }
}

// Namespace validation / scripts\mp\validation
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b94
// Size: 0x266
function validateperks(validationdata, perks, archetype) {
    perkcounts = [];
    perkcounts[1] = 0;
    perkcounts[2] = 0;
    perkcounts[3] = 0;
    foreach (perk in perks) {
        if (isdefined(perk) && perk != "none") {
            if (!function_f45c19871b412ea5(perk)) {
                validationerror("invalidPerk", undefined, perk);
                validationdata.invaliditems[9][validationdata.invaliditems[9].size] = perk;
            }
            slot = scripts\mp\perks\perks::getperkslot(perk);
            if (isdefined(slot)) {
                perkcounts[slot]++;
                if (perkcounts[slot] > 2) {
                    validationerror("tooManyPerks", slot, perk);
                    validationdata.invaliditems[9][validationdata.invaliditems[9].size] = perk;
                }
                if (!self isitemunlocked(perk, "perk")) {
                    validationerror("lockedPerk", slot, perk);
                    validationdata.invaliditems[9][validationdata.invaliditems[9].size] = perk;
                }
                if (perkcounts[slot] == 1) {
                    validationdata.pointcost++;
                } else {
                    validationdata.wildcards["extra_perk_" + slot] = 1;
                    validationdata.pointcost += 2;
                }
                continue;
            }
            if (isdefined(level.menurigperks[perk])) {
                if (level.menurigperks[perk].archetype != archetype) {
                    validationerror("rigPerkOnWrongRig", undefined, perk);
                    validationdata.invaliditems[9][validationdata.invaliditems[9].size] = perk;
                }
                if (!self isitemunlocked(perk, "trait")) {
                    validationerror("lockedRigPerk", slot, perk);
                    validationdata.invaliditems[9][validationdata.invaliditems[9].size] = perk;
                }
                continue;
            }
            validationerror("unknownPerkType", undefined, perk);
            validationdata.invaliditems[9][validationdata.invaliditems[9].size] = perk;
        }
    }
}

// Namespace validation / scripts\mp\validation
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2e02
// Size: 0x196
function validatestreaks(validationdata, streak1, streak2, streak3) {
    streaks = [streak1, streak2, streak3];
    foreach (streak in streaks) {
        if (streak == "none") {
            continue;
        }
        setupinfo = scripts\mp\killstreaks\killstreaks::getkillstreaksetupinfo(streak);
        if (!isdefined(setupinfo)) {
            validationerror("unknownStreak", undefined, streak);
            validationdata.invaliditems[12] = 1;
        }
        if (!self isitemunlocked(streak, "killstreak")) {
            validationerror("lockedStreak", undefined, streak);
            validationdata.invaliditems[12] = 1;
        }
    }
    if (streak1 == streak2 && streak1 != "none") {
        validationerror("duplicateStreak", undefined, streak1);
        validationdata.invaliditems[12] = 1;
        return;
    }
    if (streak1 == streak3 && streak1 != "none") {
        validationerror("duplicateStreak", undefined, streak1);
        validationdata.invaliditems[12] = 1;
        return;
    }
    if (streak2 == streak3 && streak2 != "none") {
        validationerror("duplicateStreak", undefined, streak2);
        validationdata.invaliditems[12] = 1;
    }
}

// Namespace validation / scripts\mp\validation
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2fa0
// Size: 0x6f
function validatearchetype(validationdata, archetype) {
    if (!isdefined(level.archetypeids[archetype])) {
        validationerror("unknownArchetype", undefined, archetype);
        validationdata.invaliditems[10] = 1;
    }
    if (!self isitemunlocked(archetype, "rig")) {
        validationerror("lockedArchetype", undefined, archetype);
        validationdata.invaliditems[10] = 1;
    }
}

// Namespace validation / scripts\mp\validation
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3017
// Size: 0x97
function validatesuper(validationdata, super) {
    if (!isdefined(super) || super == "none") {
        return;
    }
    superdata = level.superglobals.staticsuperdata[super];
    if (!isdefined(superdata)) {
        validationerror("unknownSuper", undefined, super);
        validationdata.invaliditems[11] = 1;
    }
    if (!self isitemunlocked(super, "super")) {
        validationerror("lockedSuper", undefined, super);
        validationdata.invaliditems[11] = 1;
    }
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30b6
// Size: 0xb
function validatewildcards(validationdata) {
    
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c9
// Size: 0x3f
function fixloadout(loadout) {
    newloadout = scripts\mp\class::loadout_getclassstruct();
    newloadout.loadoutarchetype = "archetype_assault";
    newloadout.loadoutprimary = "iw9_ar_mike4";
    return newloadout;
}

// Namespace validation / scripts\mp\validation
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3111
// Size: 0x1ac
function fixweapon(loadout, weaponslot) {
    assert(function_d03495fe6418377b(weaponslot));
    if (weaponslot == #"primary") {
        loadout.loadoutprimary = "iw9_ar_mike4";
        loadout.loadoutprimarycamo = "none";
        loadout.loadoutprimaryreticle = "none";
        loadout.loadoutprimarylootitemid = 0;
        loadout.loadoutprimaryvariantid = -1;
        for (attachindex = 0; attachindex < scripts\mp\class::getmaxprimaryattachments(); attachindex++) {
            loadout.loadoutprimaryattachments[attachindex] = "none";
        }
        return;
    }
    if (weaponslot == #"secondary") {
        loadout.loadoutsecondary = "none";
        loadout.loadoutsecondarycamo = "none";
        loadout.loadoutsecondaryreticle = "none";
        loadout.loadoutsecondarylootitemid = 0;
        loadout.loadoutsecondaryvariantid = -1;
        for (attachindex = 0; attachindex < scripts\mp\class::getmaxsecondaryattachments(); attachindex++) {
            loadout.loadoutsecondaryattachments[attachindex] = "none";
        }
        return;
    }
    loadout.loadoutTertiary = "none";
    loadout.loadouttertiarycamo = "none";
    loadout.loadouttertiaryreticle = "none";
    loadout.var_64e57707d385a2f5 = 0;
    loadout.loadouttertiaryvariantid = -1;
    for (attachindex = 0; attachindex < scripts\mp\class::function_4073b3f145413cd(); attachindex++) {
        loadout.var_494870a5978b5a09[attachindex] = "none";
    }
}

// Namespace validation / scripts\mp\validation
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32c5
// Size: 0x85
function fixattachment(loadout, weaponslot, attachmentindex) {
    assert(function_d03495fe6418377b(weaponslot));
    if (weaponslot == #"primary") {
        loadout.loadoutprimaryattachments[attachmentindex] = "none";
        return;
    }
    if (weaponslot == #"secondary") {
        loadout.loadoutsecondaryattachments[attachmentindex] = "none";
        return;
    }
    loadout.var_494870a5978b5a09[attachmentindex] = "none";
}

// Namespace validation / scripts\mp\validation
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3352
// Size: 0x5c
function fixpower(loadout, powerslot) {
    if (powerslot == "primary") {
        loadout.loadoutpowerprimary = "none";
        loadout.loadoutextrapowerprimary = 0;
        return;
    }
    loadout.loadoutpowersecondary = "none";
    loadout.loadoutextrapowersecondary = 0;
}

// Namespace validation / scripts\mp\validation
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33b6
// Size: 0x31
function fixperk(loadout, perk) {
    loadout.loadoutperks = array_remove(loadout.loadoutperks, perk);
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ef
// Size: 0x3e
function fixkillstreaks(loadout) {
    loadout.loadoutkillstreak1 = "none";
    loadout.loadoutkillstreak2 = "none";
    loadout.loadoutkillstreak3 = "none";
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3435
// Size: 0x8e
function fixarchetype(loadout) {
    loadout.loadoutarchetype = "archetype_assault";
    fixsuper(loadout);
    foreach (perk in loadout.loadoutperks) {
        if (isdefined(level.menurigperks[perk])) {
            fixperk(loadout, perk);
            break;
        }
    }
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34cb
// Size: 0x1c
function fixsuper(loadout) {
    loadout.loadoutsuper = "none";
}

// Namespace validation / scripts\mp\validation
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x34ef
// Size: 0x23b
function fixinvaliditems(loadout, invaliditems) {
    if (isdefined(invaliditems[0])) {
        loadout = fixloadout(loadout);
        return loadout;
    }
    if (isdefined(invaliditems[1])) {
        fixweapon(loadout, #"primary");
    } else if (isdefined(invaliditems[3])) {
        for (attachindex = 0; attachindex < scripts\mp\class::getmaxprimaryattachments(); attachindex++) {
            fixattachment(loadout, #"primary", attachindex);
        }
    } else {
        foreach (attachindex in invaliditems[2]) {
            fixattachment(loadout, #"primary", attachindex);
        }
    }
    if (isdefined(invaliditems[4])) {
        fixweapon(loadout, #"secondary");
    } else if (isdefined(invaliditems[6])) {
        for (attachindex = 0; attachindex < scripts\mp\class::getmaxsecondaryattachments(); attachindex++) {
            fixattachment(loadout, #"secondary", attachindex);
        }
    } else {
        foreach (attachindex in invaliditems[5]) {
            fixattachment(loadout, #"secondary", attachindex);
        }
    }
    if (istrue(level.var_9e090a159cb48220)) {
    }
    if (isdefined(invaliditems[7])) {
        fixpower(loadout, "primary");
    }
    if (isdefined(invaliditems[8])) {
        fixpower(loadout, "secondary");
    }
    foreach (perk in invaliditems[9]) {
        fixperk(loadout, perk);
    }
    if (isdefined(invaliditems[10])) {
        fixarchetype(loadout);
    } else if (isdefined(invaliditems[11])) {
        fixarchetype(loadout);
    }
    if (isdefined(invaliditems[12])) {
        fixkillstreaks(loadout);
    }
    return loadout;
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3733
// Size: 0x5a
function lookuppowerslot(powerref) {
    tableslot = tablelookup("mp/menuPowers.csv", 3, powerref, 2);
    if (!isdefined(tableslot) || tableslot != "1" && tableslot != "2") {
        return undefined;
    }
    return ter_op(tableslot == "1", "primary", "secondary");
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3796
// Size: 0xc
function weaponunlocksvialoot(weaponref) {
    return false;
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37ab
// Size: 0x31
function isweaponuihidden(var_49e6ef3edadd524e) {
    return isdefined(level.weaponmapdata[var_49e6ef3edadd524e]) && istrue(level.weaponmapdata[var_49e6ef3edadd524e].uihidden);
}

// Namespace validation / scripts\mp\validation
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e5
// Size: 0x68
function isweaponvariantlocked(var_49e6ef3edadd524e, variantid) {
    if (isanymlgmatch()) {
        return true;
    }
    if (!isdefined(variantid) || variantid <= 0) {
        return false;
    }
    variantkey = var_49e6ef3edadd524e + "|" + variantid;
    return isdefined(level.weaponlootmapdata[variantkey]) && istrue(level.weaponlootmapdata[variantkey].islocked);
}

// Namespace validation / scripts\mp\validation
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3856
// Size: 0x1b0
function isattachmentvariantinvalid(var_49e6ef3edadd524e, var_fedb77aad2340743, attachment, var_1708b873a34eeb50) {
    if (isanymlgmatch()) {
        return true;
    }
    var_c0123fb0fce151e5 = isdefined(var_1708b873a34eeb50) && var_1708b873a34eeb50 > 0 && attachment != "none";
    if (!var_c0123fb0fce151e5) {
        return false;
    }
    var_d54114842c617892 = getdvarint(@"hash_14e87ea13737cdbb", 1);
    isweaponvariant = isdefined(var_fedb77aad2340743) && var_fedb77aad2340743 > 0;
    if (!var_d54114842c617892 && !isweaponvariant) {
        return true;
    }
    var_e88b89f1334a1506 = var_49e6ef3edadd524e + "|" + var_fedb77aad2340743;
    attachmentisvalid = 0;
    for (variantindex = 1; true; variantindex++) {
        variantkey = var_49e6ef3edadd524e + "|" + variantindex;
        if (!isdefined(level.weaponlootmapdata[variantkey])) {
            break;
        }
        if (var_d54114842c617892 || variantkey == var_e88b89f1334a1506) {
            if (!istrue(level.weaponlootmapdata[variantkey].islocked)) {
                if (isdefined(level.weaponlootmapdata[variantkey].attachcustomtoidmap)) {
                    foreach (key, id in level.weaponlootmapdata[variantkey].attachcustomtoidmap) {
                        if (var_1708b873a34eeb50 == id && attachment == key) {
                            attachmentisvalid = 1;
                            break;
                        }
                    }
                }
                if (attachmentisvalid) {
                    break;
                }
            }
        }
    }
    return !attachmentisvalid;
}

// Namespace validation / scripts\mp\validation
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a0f
// Size: 0x8f0
function function_9480a79a4852090f() {
    fallbackloadout = spawnstruct();
    var_59896658f6aa750c = getdvarint(@"hash_1c46edd4b28ec23", 32081);
    var_9e921d97a928ff80 = getdvarint(@"hash_3ac8e9ebdf483563", 17211);
    if (getgametype() == "war_snipers" || getgametype() == "dom_snipers") {
        var_9e921d97a928ff80 = getdvarint(@"hash_3ac8e9ebdf483563", 11370);
    }
    fallbackloadout.fallbackprimary = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_59896658f6aa750c);
    fallbackloadout.var_2aabec7bb44d89cb = [];
    fallbackloadout.var_2aabec7bb44d89cb[0] = "none";
    fallbackloadout.var_2aabec7bb44d89cb[1] = "none";
    fallbackloadout.var_2aabec7bb44d89cb[2] = "none";
    fallbackloadout.var_2aabec7bb44d89cb[3] = "none";
    fallbackloadout.var_2aabec7bb44d89cb[4] = "none";
    fallbackloadout.var_2aabec7bb44d89cb[5] = "none";
    fallbackloadout.var_606482762a976e6b = "none";
    fallbackloadout.fallbackprimaryreticle = "none";
    fallbackloadout.var_a2746a3326ffd02d = -1;
    fallbackloadout.var_dbd72ebf429c33cc = [];
    fallbackloadout.var_ab71722736d6300d = "none";
    fallbackloadout.var_21edf78f47f80693[0] = "none";
    fallbackloadout.var_21edf78f47f80693[1] = "none";
    fallbackloadout.var_21edf78f47f80693[2] = "none";
    fallbackloadout.var_21edf78f47f80693[3] = "none";
    fallbackloadout.var_21edf78f47f80693[4] = "none";
    fallbackloadout.fallbacksecondary = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_9e921d97a928ff80);
    fallbackloadout.var_8db17208eee8983f = [];
    fallbackloadout.var_8db17208eee8983f[0] = "none";
    fallbackloadout.var_8db17208eee8983f[1] = "none";
    fallbackloadout.var_8db17208eee8983f[2] = "none";
    fallbackloadout.var_8db17208eee8983f[3] = "none";
    fallbackloadout.var_8db17208eee8983f[4] = "none";
    fallbackloadout.var_fe85ac60e4c42827 = "none";
    fallbackloadout.fallbacksecondaryreticle = "none";
    fallbackloadout.var_5ccacfeceb8f0b91 = -1;
    fallbackloadout.var_541023c8262ad6a8 = [];
    fallbackloadout.var_28c73c08c5f76289 = "none";
    fallbackloadout.var_6ff9bdde98b6c7af[0] = "none";
    fallbackloadout.var_6ff9bdde98b6c7af[1] = "none";
    fallbackloadout.var_6ff9bdde98b6c7af[2] = "none";
    fallbackloadout.var_6ff9bdde98b6c7af[3] = "none";
    fallbackloadout.var_6ff9bdde98b6c7af[4] = "none";
    fallbackloadout.baseperks = [];
    fallbackloadout.baseperks[0] = "specialty_scavenger_br";
    fallbackloadout.baseperks[1] = "specialty_tac_resist_br";
    fallbackloadout.bonusperk = "specialty_contract_payout";
    fallbackloadout.ultimateperk = "specialty_combat_scout";
    fallbackloadout.perks = [];
    fallbackloadout.perks[0] = fallbackloadout.baseperks[0];
    fallbackloadout.perks[1] = fallbackloadout.baseperks[1];
    fallbackloadout.perks[2] = fallbackloadout.bonusperk;
    fallbackloadout.perks[3] = fallbackloadout.ultimateperk;
    fallbackloadout.var_223912952e2fcaa5 = "equip_frag";
    fallbackloadout.var_56507f15843909c5 = "equip_flash";
    fallbackloadout.fallbackkillstreaks = [];
    fallbackloadout.fallbackkillstreaks[0] = "uav";
    fallbackloadout.fallbackkillstreaks[1] = "cruise_predator";
    fallbackloadout.fallbackkillstreaks[2] = "fuel_airstrike";
    if (isanymlgmatch()) {
        leagueplaybundle = getscriptbundle("leagueplaybundle:" + level.projectbundle.var_b1e3933dec92ebff);
        var_effe6f81e1a11b81 = getscriptbundle("classtableentry:" + leagueplaybundle.fallbackloadout);
        var_9f9e341110bf6f8e = getscriptbundle("killstreaklist:" + leagueplaybundle.fallbackkillstreaks);
        fallbackloadout.fallbackprimary = var_effe6f81e1a11b81.primaryweapon.weapon;
        fallbackloadout.var_2aabec7bb44d89cb = [];
        fallbackloadout.var_2aabec7bb44d89cb[0] = var_effe6f81e1a11b81.primaryweapon.attachment1;
        fallbackloadout.var_2aabec7bb44d89cb[1] = var_effe6f81e1a11b81.primaryweapon.attachment2;
        fallbackloadout.var_2aabec7bb44d89cb[2] = var_effe6f81e1a11b81.primaryweapon.attachment3;
        fallbackloadout.var_2aabec7bb44d89cb[3] = var_effe6f81e1a11b81.primaryweapon.attachment4;
        fallbackloadout.var_2aabec7bb44d89cb[4] = var_effe6f81e1a11b81.primaryweapon.attachment5;
        fallbackloadout.var_2aabec7bb44d89cb[5] = var_effe6f81e1a11b81.primaryweapon.attachment6;
        fallbackloadout.var_606482762a976e6b = var_effe6f81e1a11b81.primaryweapon.camo;
        fallbackloadout.var_5a68d67fc469e1e7 = var_effe6f81e1a11b81.primaryweapon.reticle;
        fallbackloadout.var_a2746a3326ffd02d = ter_op(isdefined(var_effe6f81e1a11b81.primaryweapon.variantid), int(var_effe6f81e1a11b81.primaryweapon.variantid), -1);
        fallbackloadout.fallbacksecondary = var_effe6f81e1a11b81.secondaryweapon.weapon;
        fallbackloadout.var_8db17208eee8983f = [];
        fallbackloadout.var_8db17208eee8983f[0] = var_effe6f81e1a11b81.secondaryweapon.attachment1;
        fallbackloadout.var_8db17208eee8983f[1] = var_effe6f81e1a11b81.secondaryweapon.attachment2;
        fallbackloadout.var_8db17208eee8983f[2] = var_effe6f81e1a11b81.secondaryweapon.attachment3;
        fallbackloadout.var_8db17208eee8983f[3] = var_effe6f81e1a11b81.secondaryweapon.attachment4;
        fallbackloadout.var_8db17208eee8983f[4] = var_effe6f81e1a11b81.secondaryweapon.attachment5;
        fallbackloadout.var_fe85ac60e4c42827 = var_effe6f81e1a11b81.secondaryweapon.camo;
        fallbackloadout.fallbacksecondaryreticle = var_effe6f81e1a11b81.secondaryweapon.reticle;
        fallbackloadout.var_5ccacfeceb8f0b91 = ter_op(isdefined(var_effe6f81e1a11b81.secondaryweapon.variantid), int(var_effe6f81e1a11b81.secondaryweapon.variantid), -1);
        fallbackloadout.var_541023c8262ad6a8 = [];
        fallbackloadout.baseperks = [];
        fallbackloadout.baseperks[0] = var_effe6f81e1a11b81.perks.perk1;
        fallbackloadout.baseperks[1] = var_effe6f81e1a11b81.perks.perk2;
        fallbackloadout.bonusperk = var_effe6f81e1a11b81.perks.perk3;
        fallbackloadout.ultimateperk = var_effe6f81e1a11b81.extraperks.perk1;
        fallbackloadout.var_223912952e2fcaa5 = var_effe6f81e1a11b81.equipment.primary;
        fallbackloadout.var_56507f15843909c5 = var_effe6f81e1a11b81.equipment.secondary;
        fallbackloadout.fallbackkillstreaks[0] = var_9f9e341110bf6f8e.killstreak_list[0].ref;
        fallbackloadout.fallbackkillstreaks[1] = var_9f9e341110bf6f8e.killstreak_list[1].ref;
        fallbackloadout.fallbackkillstreaks[2] = var_9f9e341110bf6f8e.killstreak_list[2].ref;
    }
    return fallbackloadout;
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4308
// Size: 0x14d
function replaceprimaryweapon(loadout) {
    fallbackloadout = function_9480a79a4852090f();
    loadout.loadoutprimary = fallbackloadout.fallbackprimary;
    loadout.loadoutprimaryattachments = fallbackloadout.var_2aabec7bb44d89cb;
    loadout.loadoutprimarycamo = fallbackloadout.var_606482762a976e6b;
    loadout.loadoutprimaryreticle = fallbackloadout.fallbackprimaryreticle;
    loadout.loadoutprimaryvariantid = fallbackloadout.var_a2746a3326ffd02d;
    loadout.loadoutprimaryattachmentids = fallbackloadout.var_dbd72ebf429c33cc;
    loadout.loadoutprimarycosmeticattachment = fallbackloadout.var_ab71722736d6300d;
    loadout.loadoutprimarystickers[0] = fallbackloadout.var_21edf78f47f80693[0];
    loadout.loadoutprimarystickers[1] = fallbackloadout.var_21edf78f47f80693[1];
    loadout.loadoutprimarystickers[2] = fallbackloadout.var_21edf78f47f80693[2];
    loadout.loadoutprimarystickers[3] = fallbackloadout.var_21edf78f47f80693[3];
    loadout.loadoutprimarystickers[4] = fallbackloadout.var_21edf78f47f80693[4];
    return loadout;
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x445e
// Size: 0x14d
function replacesecondaryweapon(loadout) {
    fallbackloadout = function_9480a79a4852090f();
    loadout.loadoutsecondary = fallbackloadout.fallbacksecondary;
    loadout.loadoutsecondaryattachments = fallbackloadout.var_8db17208eee8983f;
    loadout.loadoutsecondarycamo = fallbackloadout.var_fe85ac60e4c42827;
    loadout.loadoutsecondaryreticle = fallbackloadout.fallbacksecondaryreticle;
    loadout.loadoutsecondaryvariantid = fallbackloadout.var_5ccacfeceb8f0b91;
    loadout.loadoutsecondaryattachmentids = fallbackloadout.var_541023c8262ad6a8;
    loadout.loadoutsecondarycosmeticattachment = fallbackloadout.var_28c73c08c5f76289;
    loadout.loadoutsecondarystickers[0] = fallbackloadout.var_6ff9bdde98b6c7af[0];
    loadout.loadoutsecondarystickers[1] = fallbackloadout.var_6ff9bdde98b6c7af[1];
    loadout.loadoutsecondarystickers[2] = fallbackloadout.var_6ff9bdde98b6c7af[2];
    loadout.loadoutsecondarystickers[3] = fallbackloadout.var_6ff9bdde98b6c7af[3];
    loadout.loadoutsecondarystickers[4] = fallbackloadout.var_6ff9bdde98b6c7af[4];
    return loadout;
}

// Namespace validation / scripts\mp\validation
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b4
// Size: 0x7d
function function_5e76ad052ba12845(loadout) {
    fallbackloadout = function_9480a79a4852090f();
    for (i = 0; i < loadout.loadoutperks.size; i++) {
        if (i >= fallbackloadout.perks.size) {
            println("<dev string:x1c>");
            continue;
        }
        loadout.loadoutperks[i] = fallbackloadout.perks[i];
    }
    return loadout;
}

