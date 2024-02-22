// mwiii decomp prototype
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

// Namespace validation/namespace_6502912624889105
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66b
// Size: 0xa2
function validationerror(errortype, slot, item) {
    var_b00cc25137fa2908 = errortype;
    if (isdefined(slot)) {
        var_b00cc25137fa2908 = var_b00cc25137fa2908 + "_" + slot;
    }
    if (isdefined(item)) {
        var_b00cc25137fa2908 = var_b00cc25137fa2908 + " - " + item;
    }
    /#
        if (getdvarint(@"hash_58bbcc3e1ff538d1", 0) == 1) {
            println(var_b00cc25137fa2908);
        }
    #/
    if (getdvarint(@"hash_49f347129c31c40c", 0) == 1) {
        /#
            assertmsg(var_b00cc25137fa2908);
        #/
    }
    if (getdvarint(@"hash_93c750a2b4a79e93", 0) == 1) {
        namespace_d19129e4fa5d176::recordvalidationinfraction();
    }
}

// Namespace validation/namespace_6502912624889105
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x714
// Size: 0x40
function isvalidattachmentunlock(var_49e6ef3edadd524e, var_55f8624e7216d9aa) {
    var_338c04a2f19ba8b6 = getdvarint(@"hash_464624f0183de3d0", 0) == 1;
    if (var_338c04a2f19ba8b6) {
        return attachmentisselectablerootname(var_49e6ef3edadd524e, var_55f8624e7216d9aa);
    }
    return 1;
}

// Namespace validation/namespace_6502912624889105
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75c
// Size: 0x1da
function function_f6d25a34b1d286b1() {
    var_cfbd5dfab1e96cb1 = getdvarint(@"hash_838359d5ebdcc7e0", 0);
    if (var_cfbd5dfab1e96cb1 == 0) {
        return;
    }
    for (loadoutindex = 0; loadoutindex < 12; loadoutindex++) {
        var_5d204f0befa309b = self getplayerdata(level.loadoutdata, "squadMembers", "loadouts", loadoutindex, "inUse");
        if (var_5d204f0befa309b == 1) {
            for (weaponindex = 0; weaponindex < 2; weaponindex++) {
                weaponname = namespace_d19129e4fa5d176::cac_getweapon(loadoutindex, weaponindex);
                var_fedb77aad2340743 = namespace_d19129e4fa5d176::cac_getweaponvariantid(loadoutindex, weaponindex);
                var_2f36f150e9c51cb5 = namespace_d19129e4fa5d176::cac_getweaponlootitemid(loadoutindex, weaponindex);
                attachments = [];
                var_3770967d73999eb9 = [];
                maxattachments = ter_op(weaponindex == 0, namespace_d19129e4fa5d176::getmaxprimaryattachments(), namespace_d19129e4fa5d176::getmaxsecondaryattachments());
                var_6c85232fcab7882d = ter_op(weaponindex == 0, namespace_d19129e4fa5d176::function_ed8babbe1912171f(), namespace_d19129e4fa5d176::function_fba1013e19eb56c3());
                for (attachmentindex = 0; attachmentindex < maxattachments; attachmentindex++) {
                    attachmentname = namespace_d19129e4fa5d176::cac_getweaponattachment(loadoutindex, weaponindex, attachmentindex);
                    attachments[attachmentindex] = attachmentname;
                    var_3770967d73999eb9[attachmentindex] = namespace_d19129e4fa5d176::cac_getweaponattachmentid(loadoutindex, weaponindex, attachmentindex);
                }
                camoname = namespace_d19129e4fa5d176::cac_getweaponcamo(loadoutindex, weaponindex);
                var_bd1db6dd9710a427 = namespace_d19129e4fa5d176::cac_getweaponcosmeticattachment(loadoutindex, weaponindex);
                stickers = [];
                for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < var_6c85232fcab7882d; var_36d2abbdcbcb186c++) {
                    stickers[var_36d2abbdcbcb186c] = namespace_d19129e4fa5d176::cac_getweaponsticker(loadoutindex, weaponindex, var_36d2abbdcbcb186c);
                }
                function_503f87754be2d15c(weaponname, var_fedb77aad2340743, var_2f36f150e9c51cb5, attachments, var_3770967d73999eb9, camoname, var_bd1db6dd9710a427, stickers);
            }
        }
    }
}

// Namespace validation/namespace_6502912624889105
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93d
// Size: 0x17e
function function_18b8c4c4fa0f6d1c(weaponname, weaponcamo) {
    category = function_6a36b14e6b79459(function_2ef675c13ca1c4af(%"hash_1345cc24140e89b8", weaponcamo), #"hash_1a86d464182edeb5");
    if (isdefined(category) && category == "camo_category_completion") {
        if (isdefined(level.var_305637ed4e3e8513[weaponname]) && isdefined(level.var_305637ed4e3e8513[weaponname][weaponcamo])) {
            return level.var_305637ed4e3e8513[weaponname][weaponcamo];
        } else {
            lootid = namespace_38b993c4618e76cd::getlootidfromref(weaponcamo);
            if (lootid == 0) {
                namespace_9c840bb9f2ecbf00::demoforcesre("getCamoLootID: weaponName/weaponCamo [" + weaponname + "/" + weaponcamo + "] not in level.weaponMappedCamos");
            }
            return lootid;
        }
    } else if (isdefined(category) && category == "camo_category_events") {
        weaponclass = "";
        var_255e0df33fae6d5a = namespace_e0ee43ef2dddadaa::function_8477d8595e0364a7(weaponname, [0:#"menuclass"]);
        if (isdefined(var_255e0df33fae6d5a)) {
            weaponclass = var_255e0df33fae6d5a.menuclass;
        }
        if (weaponclass != "" && isdefined(level.var_305637ed4e3e8513[weaponclass]) && isdefined(level.var_305637ed4e3e8513[weaponclass][weaponcamo])) {
            return level.var_305637ed4e3e8513[weaponclass][weaponcamo];
        } else {
            lootid = namespace_38b993c4618e76cd::getlootidfromref(weaponcamo);
            if (lootid == 0) {
                namespace_9c840bb9f2ecbf00::demoforcesre("getCamoLootID: weaponName/weaponCamo [" + weaponname + "/" + weaponcamo + "] not in level.weaponMappedCamos");
            }
            return lootid;
        }
    } else {
        return namespace_38b993c4618e76cd::getlootidfromref(weaponcamo);
    }
}

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac2
// Size: 0x1a6
function function_2c4d04305e3c9601(var_904c82687ddfeb02) {
    if (getdvarint(@"hash_272c95c93da464bb", 0) == 0) {
        return 0;
    }
    var_e7a7288f46dee8e7 = [0:11354, 1:11344, 2:11338, 3:11352, 4:11318, 5:11337, 6:11340, 7:11323, 8:11331, 9:11307, 10:11317, 11:11324, 12:11328, 13:11351, 14:11357, 15:11355, 16:11315, 17:11367, 18:11320, 19:11353];
    var_4b40391f47f1d3ea = [0:11354, 1:11356, 2:11374, 3:11344, 4:11317, 5:11352];
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        foreach (var_8c996f399d5e3282 in var_e7a7288f46dee8e7) {
            if (var_8c996f399d5e3282 == var_904c82687ddfeb02) {
                return 1;
            }
        }
    } else if (namespace_448ccf1ca136fbbe::ismp() || namespace_448ccf1ca136fbbe::iscp()) {
        foreach (var_8c996f399d5e3282 in var_4b40391f47f1d3ea) {
            if (var_8c996f399d5e3282 == var_904c82687ddfeb02) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace validation/namespace_6502912624889105
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc70
// Size: 0x457
function function_503f87754be2d15c(weaponname, var_fedb77aad2340743, var_2f36f150e9c51cb5, attachments, var_3770967d73999eb9, camoname, var_bd1db6dd9710a427, stickers) {
    var_4a654bd9a395c1ff = [];
    var_a4146e4eaf636ef2 = getdvarint(@"hash_c876f19dd06eb2cf", 0);
    var_989c8eafe834f9de = var_fedb77aad2340743 != 0;
    var_928c1cac31ea99e5 = weaponname + "|" + var_fedb77aad2340743;
    var_fe506348d9341132 = 0;
    if (var_2f36f150e9c51cb5 != 0) {
        var_fe506348d9341132 = var_2f36f150e9c51cb5;
    } else if (isdefined(level.weaponmapdata[weaponname])) {
        var_fe506348d9341132 = level.weaponmapdata[weaponname].var_904c82687ddfeb02;
    }
    if (!function_2c4d04305e3c9601(var_fe506348d9341132)) {
        var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = var_fe506348d9341132;
    }
    weaponclass = "";
    var_255e0df33fae6d5a = namespace_e0ee43ef2dddadaa::function_8477d8595e0364a7(weaponname, [0:#"menuclass"]);
    if (isdefined(var_255e0df33fae6d5a)) {
        weaponclass = var_255e0df33fae6d5a.menuclass;
    }
    if (isdefined(weaponclass) && weaponclass != "weapon_melee" && weaponclass != "weapon_melee2") {
        var_ad61ffb38ec2a6b0 = function_6527364c1ecca6c6(getdefaultweaponbasename(weaponname));
        foreach (attachmentindex, attachmentname in attachments) {
            if (attachmentname != "none") {
                var_763d626a0644c430 = 1;
                if (var_a4146e4eaf636ef2 == 1 && function_975e31b63f01fbcc(attachmentname)) {
                    continue;
                }
                if (var_3770967d73999eb9[attachmentindex] != 0) {
                    var_5c3f9357f11d2223 = getdefaultweaponbasename(weaponname);
                    blueprints = function_4527f44d851c9afd(var_5c3f9357f11d2223, attachmentname);
                    foreach (variantindex, attachmentdata in blueprints) {
                        if (variantindex == var_3770967d73999eb9[attachmentindex] && isdefined(attachmentdata)) {
                            var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = attachmentdata.lootid;
                            if (var_989c8eafe834f9de && isdefined(level.weaponlootmapdata) && isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5]) && isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5].attachdefaulttoidmap[attachmentname]) && level.weaponlootmapdata[var_928c1cac31ea99e5].attachdefaulttoidmap[attachmentname] == variantindex) {
                                var_763d626a0644c430 = 0;
                            }
                            break;
                        }
                    }
                }
                if (var_763d626a0644c430) {
                    var_2c4fc9c24ccfdf3c = function_6a36b14e6b79459(function_2ef675c13ca1c4af(%"hash_3c2c9813bb16552f", attachmentname), #"category");
                    if (var_2c4fc9c24ccfdf3c == "RECEIVER") {
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
                    var_3b55819c1ebec007 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_3c2c9813bb16552f", attachmentname));
                    if (isdefined(var_3b55819c1ebec007)) {
                        var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = var_3b55819c1ebec007.lootid;
                    }
                }
            }
        }
    }
    var_fefad7765ef87400 = function_18b8c4c4fa0f6d1c(weaponname, camoname);
    var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = var_fefad7765ef87400;
    var_8b245507630a7ba1 = namespace_38b993c4618e76cd::getlootidfromref(var_bd1db6dd9710a427);
    var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = var_8b245507630a7ba1;
    foreach (sticker in stickers) {
        if (sticker != "none") {
            var_c3c5d884c6b46717 = namespace_38b993c4618e76cd::getlootidfromref(sticker);
            var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = var_c3c5d884c6b46717;
        }
    }
    self function_616c0ca219597829(var_4a654bd9a395c1ff);
}

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ce
// Size: 0x133
function function_5a92673db4ece37f(classstruct) {
    var_cfbd5dfab1e96cb1 = getdvarint(@"hash_838359d5ebdcc7e0", 0);
    if (var_cfbd5dfab1e96cb1 == 0) {
        return;
    }
    if (utility::iscp() || namespace_36f464722d326bbe::isbrstylegametype() || level.var_ec2fb549b15ad827 || !level.rankedmatch || !level.matchmakingmatch || !level.onlinestatsenabled) {
        return;
    }
    function_503f87754be2d15c(classstruct.loadoutprimary, classstruct.loadoutprimaryvariantid, classstruct.loadoutprimarylootitemid, classstruct.loadoutprimaryattachments, classstruct.loadoutprimaryattachmentids, classstruct.loadoutprimarycamo, classstruct.loadoutprimarycosmeticattachment, classstruct.loadoutprimarystickers);
    function_503f87754be2d15c(classstruct.loadoutsecondary, classstruct.loadoutsecondaryvariantid, classstruct.loadoutsecondarylootitemid, classstruct.loadoutsecondaryattachments, classstruct.loadoutsecondaryattachmentids, classstruct.loadoutsecondarycamo, classstruct.loadoutsecondarycosmeticattachment, classstruct.loadoutsecondarystickers);
}

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1208
// Size: 0x1282
function validateloadout(loadout) {
    if (getdvarint(@"hash_955ca650f9a9bdef", 0) == 1) {
        return loadout;
    }
    if (namespace_36f464722d326bbe::isbrstylegametype() && (getsubgametype() == "dmz" || getsubgametype() == "exgm") && getdvarint(@"hash_65f0ea4ff58c3fa0", 0) == 1) {
        return loadout;
    }
    var_8b3060936146ce59 = isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_e12ed09bf2e43167);
    var_60dc2c23348c27e = 0;
    if (var_8b3060936146ce59) {
        loadout = namespace_89e4915e27d8b4fc::function_b51c1b732564e22a(loadout);
        var_47533ef376cbeb37 = namespace_89e4915e27d8b4fc::function_ec995ec88ab7fb6c(loadout);
        if (var_47533ef376cbeb37 == "specialty_null" && istrue(level.allowperks)) {
            var_60dc2c23348c27e = 1;
        }
    }
    var_6433b6e8ecde2ae9 = function_9480a79a4852090f();
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
    var_d70ebc5ce61f7ebe = "specialty_underkill";
    var_6940a6d9400f329b = !perkisrestricted(var_d70ebc5ce61f7ebe) && array_contains(loadout.loadoutperks, var_d70ebc5ce61f7ebe);
    if (var_8b3060936146ce59 && loadout.loadoutprimary != "none" && level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.primary == 0) {
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
        loadout = function_858d9cd34926a30f(loadout);
    } else {
        if (isweaponvariantlocked(loadout.loadoutprimary, loadout.loadoutprimaryvariantid)) {
            loadout.loadoutprimaryvariantid = -1;
        }
        for (i = 0; i < loadout.loadoutprimaryattachments.size; i++) {
            attachment = loadout.loadoutprimaryattachments[i];
            if (attachment != "none" && attachmentisrestricted(attachment, loadout.loadoutprimary)) {
                var_3b55819c1ebec007 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_3c2c9813bb16552f", attachment));
                if (isdefined(var_3b55819c1ebec007) && var_3b55819c1ebec007.var_f0e7c0926c0962e5) {
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
    if (var_8b3060936146ce59 && loadout.loadoutsecondary != "none" && level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.secondary == 0) {
        var_60dc2c23348c27e = 1;
    }
    if (var_de6cf437be756ee1 && namespace_38b993c4618e76cd::function_8c610908c0e9c6e4(loadout.loadoutsecondary)) {
        replaceweapon = 1;
    }
    if (!namespace_36f464722d326bbe::isbrstylegametype() && !var_8b3060936146ce59) {
        var_e825245f4893a9a0 = "specialty_munitions_2";
        var_df3d6a2ffc2e83c1 = !perkisrestricted(var_e825245f4893a9a0) && array_contains(loadout.loadoutperks, var_e825245f4893a9a0);
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
        loadout = function_31c670058673ec7b(loadout);
    } else {
        if (isweaponvariantlocked(loadout.loadoutsecondary, loadout.loadoutsecondaryvariantid)) {
            loadout.loadoutsecondaryvariantid = -1;
        }
        for (i = 0; i < loadout.loadoutsecondaryattachments.size; i++) {
            attachment = loadout.loadoutsecondaryattachments[i];
            if (attachment != "none" && attachmentisrestricted(attachment, loadout.loadoutsecondary)) {
                var_3b55819c1ebec007 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_3c2c9813bb16552f", attachment));
                if (isdefined(var_3b55819c1ebec007) && var_3b55819c1ebec007.var_f0e7c0926c0962e5) {
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
        slot = namespace_b6a8027f477010e1::getperkslot(perk);
        if (var_8b3060936146ce59 && isdefined(perk) && isdefined(level.var_a1ad2758fcbd2f5e[perk])) {
            if (!namespace_89e4915e27d8b4fc::function_8cdbad2a3681247e(perk, var_47533ef376cbeb37)) {
                var_60dc2c23348c27e = 1;
                var_5e6c1f1aa70d60ce = 1;
                break;
            }
            if (level.var_a1ad2758fcbd2f5e[perk].var_70774aeb81261100 == "vest") {
                var_cf6e4e07bffcbf2e = var_cf6e4e07bffcbf2e + 1;
            } else if (level.var_a1ad2758fcbd2f5e[perk].var_70774aeb81261100 == "gloves") {
                var_cd857b8539e7f332 = var_cd857b8539e7f332 + 1;
            } else if (level.var_a1ad2758fcbd2f5e[perk].var_70774aeb81261100 == "footwear") {
                var_3e44eb1af492ae49 = var_3e44eb1af492ae49 + 1;
            } else if (level.var_a1ad2758fcbd2f5e[perk].var_70774aeb81261100 == "gear") {
                var_55b5518be09f25f5 = var_55b5518be09f25f5 + 1;
                var_442df125f92806b2[var_442df125f92806b2.size] = perk;
            }
        }
        if (isdefined(var_6433b6e8ecde2ae9.perks) && !isdefined(slot)) {
            var_5e76ad052ba12845 = 1;
            break;
        }
        if (perkisrestricted(perk)) {
            if (var_a0f3cd42271b8f4a) {
                if (idx < var_6433b6e8ecde2ae9.perks.size) {
                    loadout.loadoutperks[idx] = var_6433b6e8ecde2ae9.perks[idx];
                }
            } else {
                var_5e76ad052ba12845 = 1;
                break;
            }
        }
    }
    if (var_8b3060936146ce59) {
        if (var_cf6e4e07bffcbf2e > 1 || var_cd857b8539e7f332 > 1 || var_3e44eb1af492ae49 > 1 || var_55b5518be09f25f5 > 2) {
            var_60dc2c23348c27e = 1;
            var_5e6c1f1aa70d60ce = 1;
        } else if (var_55b5518be09f25f5 == 2 && (level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.var_7a0fa1d60675a7a2 == 0 || level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.var_185b68d5c03fde98 == 0)) {
            if (level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.var_7a0fa1d60675a7a2 == 0 && level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.var_185b68d5c03fde98 == 0) {
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
            msg = msg + "Perk " + i + ": " + loadout.loadoutperks[i] + " ";
        }
        /#
            assertmsg(msg);
        #/
    }
    if (killstreakisrestricted("specialist_perk_1") || killstreakisrestricted("specialist_perk_2") || killstreakisrestricted("specialist_perk_3")) {
        loadout.loadoutusingspecialist = 0;
    }
    if (var_8b3060936146ce59) {
        if (loadout.loadoutequipmentprimary != "none") {
            if (level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.lethal == 0) {
                var_60dc2c23348c27e = 1;
            } else if (!namespace_1a507865f681850e::isequipmentprimary(loadout.loadoutequipmentprimary) || !namespace_1a507865f681850e::isequipmentselectable(loadout.loadoutequipmentprimary) || equipmentisrestricted(loadout.loadoutequipmentprimary)) {
                loadout = namespace_89e4915e27d8b4fc::function_625a1bdd25647c6b(loadout);
            }
        } else if (loadout.loadoutextraequipmentprimary != 0) {
            if (level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.var_c42a7d79c777cc7f == 0) {
                var_60dc2c23348c27e = 1;
            } else if (!namespace_1a507865f681850e::isequipmentprimary(loadout.loadoutextraequipmentprimary) || !namespace_1a507865f681850e::isequipmentselectable(loadout.loadoutextraequipmentprimary) || equipmentisrestricted(loadout.loadoutextraequipmentprimary)) {
                loadout = namespace_89e4915e27d8b4fc::function_625a1bdd25647c6b(loadout);
            }
        }
    } else if (!namespace_1a507865f681850e::isequipmentprimary(loadout.loadoutequipmentprimary) || !namespace_1a507865f681850e::isequipmentselectable(loadout.loadoutequipmentprimary)) {
        loadout.loadoutequipmentprimary = var_6433b6e8ecde2ae9.var_223912952e2fcaa5;
    } else if (equipmentisrestricted(loadout.loadoutequipmentprimary)) {
        loadout.loadoutequipmentprimary = var_6433b6e8ecde2ae9.var_223912952e2fcaa5;
        var_bc72f32b1575d517 = 1;
    }
    if (var_8b3060936146ce59) {
        if (loadout.loadoutequipmentsecondary != "none") {
            if (level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.tactical == 0) {
                var_60dc2c23348c27e = 1;
            } else if (!namespace_1a507865f681850e::isequipmentsecondary(loadout.loadoutequipmentsecondary) || !namespace_1a507865f681850e::isequipmentselectable(loadout.loadoutequipmentsecondary) || equipmentisrestricted(loadout.loadoutequipmentsecondary)) {
                loadout = namespace_89e4915e27d8b4fc::function_1ccfa7dccda7da0f(loadout);
            }
        } else if (loadout.loadoutextraequipmentsecondary != 0) {
            if (level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.var_5fd3d6702da60ad2 == 0) {
                var_60dc2c23348c27e = 1;
            } else if (!namespace_1a507865f681850e::isequipmentsecondary(loadout.loadoutextraequipmentsecondary) || !namespace_1a507865f681850e::isequipmentselectable(loadout.loadoutextraequipmentsecondary) || equipmentisrestricted(loadout.loadoutextraequipmentsecondary)) {
                loadout = namespace_89e4915e27d8b4fc::function_1ccfa7dccda7da0f(loadout);
            }
        }
    } else if (!namespace_1a507865f681850e::isequipmentsecondary(loadout.loadoutequipmentsecondary) || !namespace_1a507865f681850e::isequipmentselectable(loadout.loadoutequipmentsecondary)) {
        loadout.loadoutequipmentsecondary = var_6433b6e8ecde2ae9.var_56507f15843909c5;
    } else if (equipmentisrestricted(loadout.loadoutequipmentsecondary)) {
        loadout.loadoutequipmentsecondary = var_6433b6e8ecde2ae9.var_56507f15843909c5;
        var_bc72f32b1575d517 = 1;
    }
    if (var_8b3060936146ce59 && loadout.loadoutfieldupgrade1 != "none" && level.var_a1ad2758fcbd2f5e[var_47533ef376cbeb37].var_885724e5007453be.super == 0) {
        var_60dc2c23348c27e = 1;
    }
    var_dc5f6faa8bb8fffe = 0;
    for (i = 0; i < 3; i++) {
        if (killstreakisrestricted(var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[i])) {
            var_35bd18d6d22e7106[i] = "none";
        }
    }
    if (!isanymlgmatch() && (loadout.loadoutkillstreak1 == "none" || loadout.loadoutkillstreak2 == "none" || loadout.loadoutkillstreak3 == "none")) {
        var_dc5f6faa8bb8fffe = 1;
    }
    if (!var_dc5f6faa8bb8fffe) {
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[loadout.loadoutkillstreak1];
        if (!(isanymlgmatch() && loadout.loadoutkillstreak1 == "none") && (!isdefined(bundle) || !isdefined(bundle.var_594af43597023062) || !bundle.var_594af43597023062)) {
            var_dc5f6faa8bb8fffe = 1;
        }
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[loadout.loadoutkillstreak2];
        if (!(isanymlgmatch() && loadout.loadoutkillstreak2 == "none") && (!isdefined(bundle) || !isdefined(bundle.var_594af43597023062) || !bundle.var_594af43597023062)) {
            var_dc5f6faa8bb8fffe = 1;
        }
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[loadout.loadoutkillstreak3];
        if (!(isanymlgmatch() && loadout.loadoutkillstreak3 == "none") && (!isdefined(bundle) || !isdefined(bundle.var_594af43597023062) || !bundle.var_594af43597023062)) {
            var_dc5f6faa8bb8fffe = 1;
        }
    }
    if (!var_dc5f6faa8bb8fffe) {
        if (killstreakisrestricted(loadout.loadoutkillstreak1)) {
            loadout.loadoutkillstreak1 = var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[0];
            var_bc72f32b1575d517 = 1;
        }
        if (killstreakisrestricted(loadout.loadoutkillstreak2)) {
            loadout.loadoutkillstreak2 = var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[1];
            var_bc72f32b1575d517 = 1;
        }
        if (killstreakisrestricted(loadout.loadoutkillstreak3)) {
            loadout.loadoutkillstreak3 = var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[2];
            var_bc72f32b1575d517 = 1;
        }
    }
    if (!var_dc5f6faa8bb8fffe) {
        if (loadout.loadoutkillstreak1 == loadout.loadoutkillstreak2 && loadout.loadoutkillstreak1 != "none") {
            var_dc5f6faa8bb8fffe = 1;
        } else if (loadout.loadoutkillstreak1 == loadout.loadoutkillstreak3 && loadout.loadoutkillstreak1 != "none") {
            var_dc5f6faa8bb8fffe = 1;
        } else if (loadout.loadoutkillstreak2 == loadout.loadoutkillstreak3 && loadout.loadoutkillstreak2 != "none") {
            var_dc5f6faa8bb8fffe = 1;
        }
    }
    if (!var_dc5f6faa8bb8fffe) {
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[loadout.loadoutkillstreak1];
        if (isdefined(bundle) && isdefined(bundle.kills)) {
            var_c3b445b88848b00f = bundle.kills;
        } else {
            var_c3b445b88848b00f = 0;
        }
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[loadout.loadoutkillstreak2];
        if (isdefined(bundle) && isdefined(bundle.kills)) {
            var_c3b446b88848b242 = bundle.kills;
        } else {
            var_c3b446b88848b242 = 0;
        }
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[loadout.loadoutkillstreak3];
        if (isdefined(bundle) && isdefined(bundle.kills)) {
            var_c3b447b88848b475 = bundle.kills;
        } else {
            var_c3b447b88848b475 = 0;
        }
        if (var_c3b445b88848b00f != 0 && var_c3b445b88848b00f == var_c3b446b88848b242) {
            var_dc5f6faa8bb8fffe = 1;
        } else if (var_c3b445b88848b00f != 0 && var_c3b445b88848b00f == var_c3b447b88848b475) {
            var_dc5f6faa8bb8fffe = 1;
        } else if (var_c3b446b88848b242 != 0 && var_c3b446b88848b242 == var_c3b447b88848b475) {
            var_dc5f6faa8bb8fffe = 1;
        }
    }
    if (var_dc5f6faa8bb8fffe) {
        loadout.loadoutkillstreak1 = var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[0];
        loadout.loadoutkillstreak2 = var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[1];
        loadout.loadoutkillstreak3 = var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[2];
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

// Namespace validation/namespace_6502912624889105
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x2492
// Size: 0x2e4
function validateweapon(var_7bd653180204fca6, weapon, attachments, camo, reticle, lootitemid, variantid, var_681ba90ff25200c5) {
    rootweaponname = getweaponrootname(weapon);
    var_99c561069f2eb71 = iscacsecondaryweapon(weapon);
    weaponslot = ter_op(var_681ba90ff25200c5, "secondary", "primary");
    itemslot = ter_op(var_681ba90ff25200c5, 4, 1);
    if (isdefined(weapon) && weapon != "none" && weapon != "iw9_me_fists") {
        var_7bd653180204fca6.pointcost++;
        if (var_681ba90ff25200c5) {
            if (!var_99c561069f2eb71) {
                var_7bd653180204fca6.pointcost++;
                var_7bd653180204fca6.wildcards["overkill"] = 1;
            }
        } else if (var_99c561069f2eb71) {
            validationerror("secondaryAsPrimary", undefined, weapon);
            var_7bd653180204fca6.invaliditems[itemslot] = 1;
        }
        if (!function_89497fa763d431c0(rootweaponname)) {
            validationerror("unknownWeapon", weaponslot, weapon);
            var_7bd653180204fca6.invaliditems[itemslot] = 1;
        } else if (istrue(level.weaponmapdata[rootweaponname].uihidden)) {
            validationerror("unreleasedWeapon", weaponslot, weapon);
            var_7bd653180204fca6.invaliditems[itemslot] = 1;
        }
        if (!self isitemunlocked(rootweaponname, "weapon") && !weaponunlocksvialoot(rootweaponname)) {
            validationerror("lockedWeapon", weaponslot, weapon);
            var_7bd653180204fca6.invaliditems[itemslot] = 1;
        }
        if (lootitemid == 0) {
            if (variantid != -1) {
                validationerror("emptyItemIDMismatch", weaponslot, weapon);
                var_7bd653180204fca6.invaliditems[itemslot] = 1;
            }
        } else if (variantid == -1) {
            validationerror("emptyVariantIDMismatch", weaponslot, weapon);
            var_7bd653180204fca6.invaliditems[itemslot] = 1;
        } else {
            if (!namespace_3f0ea7483345a2c0::isweaponitem(lootitemid)) {
                validationerror("nonWeaponLootItemID", weaponslot, weapon);
                var_7bd653180204fca6.invaliditems[itemslot] = 1;
            }
            var_157c94951634cbc9 = namespace_3f0ea7483345a2c0::getlootweaponref(lootitemid);
            if (!isdefined(var_157c94951634cbc9)) {
                validationerror("badLootItemID", weaponslot, weapon);
                var_7bd653180204fca6.invaliditems[itemslot] = 1;
            } else {
                var_93b3002ebef628b = namespace_3f0ea7483345a2c0::lookupvariantref(weapon, variantid);
                if (!isdefined(var_93b3002ebef628b)) {
                    validationerror("badVariantRef", weaponslot, weapon);
                    var_7bd653180204fca6.invaliditems[itemslot] = 1;
                } else if (var_93b3002ebef628b != var_157c94951634cbc9) {
                    validationerror("lootDataMismatch", weaponslot, weapon);
                    var_7bd653180204fca6.invaliditems[itemslot] = 1;
                }
            }
        }
        validateattachments(var_7bd653180204fca6, attachments, weapon, rootweaponname, weaponslot);
    }
}

// Namespace validation/namespace_6502912624889105
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x277d
// Size: 0x2a6
function validateattachments(var_7bd653180204fca6, attachments, weapon, rootweaponname, weaponslot) {
    var_cf4209c200f8bbf4 = weapongroupmap(weapon);
    var_3b66374a358e4a8d = getsubstr(var_cf4209c200f8bbf4, 7) + "Attach";
    itemslot = ter_op(weaponslot == "primary", 2, 5);
    var_80553b9ee292c3e6 = 0;
    var_38ce0ee62103d3fb = 0;
    var_2501ca5a023e0655 = ter_op(weaponslot == "primary", 2, 2);
    foreach (attachmentindex, attachment in attachments) {
        isoptic = 0;
        if (isdefined(attachment) && attachment != "none") {
            attachmenttype = namespace_68e641469fde3fa7::getattachmenttype(attachment);
            if (isdefined(attachmenttype) && attachmenttype != "") {
                if (isdefined(attachment)) {
                    if (attachmenttype == "rail") {
                        isoptic = 1;
                    }
                }
            }
            unlockitem = rootweaponname + "+" + attachment;
            if (!self isitemunlocked(unlockitem, var_3b66374a358e4a8d)) {
                validationerror("lockedAttachment", weaponslot, attachment);
                var_7bd653180204fca6.invaliditems[itemslot][var_7bd653180204fca6.invaliditems[itemslot].size] = attachmentindex;
            }
            if (!attachmentisselectable(rootweaponname, attachment)) {
                validationerror("nonSelectableAttachment", weaponslot, attachment);
                var_7bd653180204fca6.invaliditems[itemslot][var_7bd653180204fca6.invaliditems[itemslot].size] = attachmentindex;
            }
            if (isoptic) {
                var_80553b9ee292c3e6++;
                var_7bd653180204fca6.pointcost++;
            } else {
                var_38ce0ee62103d3fb++;
                if (var_38ce0ee62103d3fb <= var_2501ca5a023e0655) {
                    var_7bd653180204fca6.pointcost++;
                } else {
                    var_7bd653180204fca6.wildcards[weaponslot + "_attachment_" + var_38ce0ee62103d3fb + 1] = 1;
                    var_7bd653180204fca6.pointcost = var_7bd653180204fca6.pointcost + 2;
                }
            }
        }
    }
    if (var_38ce0ee62103d3fb > 5) {
        validationerror("tooManyAttachments", weaponslot, var_38ce0ee62103d3fb);
        var_7bd653180204fca6.invaliditems[ter_op(weaponslot == "primary", 3, 6)] = 1;
    }
    if (var_80553b9ee292c3e6 > 1) {
        validationerror("tooManyOpticAttachments", weaponslot, var_80553b9ee292c3e6);
        var_7bd653180204fca6.invaliditems[ter_op(weaponslot == "primary", 3, 6)] = 1;
    }
}

// Namespace validation/namespace_6502912624889105
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2a2a
// Size: 0x163
function validatepower(var_7bd653180204fca6, power, var_17bd8fa17ee68bd6, var_2b8ead494644680b) {
    itemslot = ter_op(var_17bd8fa17ee68bd6 == "primary", 7, 8);
    if (isdefined(power) && power != "none") {
        if (!isdefined(level.powers[power])) {
            validationerror("unknownPower", var_17bd8fa17ee68bd6, power);
            var_7bd653180204fca6.invaliditems[itemslot] = 1;
        }
        if (!self isitemunlocked(power, "power")) {
            validationerror("lockedPower", var_17bd8fa17ee68bd6, power);
            var_7bd653180204fca6.invaliditems[itemslot] = 1;
        }
        var_a9f5ef46ba07c23f = lookuppowerslot(power);
        if (!isdefined(var_a9f5ef46ba07c23f)) {
            validationerror("unknownMenuPower", var_17bd8fa17ee68bd6, power);
            var_7bd653180204fca6.invaliditems[itemslot] = 1;
        } else if (var_a9f5ef46ba07c23f != var_17bd8fa17ee68bd6) {
            validationerror("powerInWrongSlot", var_17bd8fa17ee68bd6, power);
            var_7bd653180204fca6.invaliditems[itemslot] = 1;
        }
        var_7bd653180204fca6.pointcost++;
    }
    if (istrue(var_2b8ead494644680b)) {
        var_7bd653180204fca6.pointcost = var_7bd653180204fca6.pointcost + 2;
        var_34989ff734e79a50 = ter_op(var_17bd8fa17ee68bd6 == "primary", "extra_lethal", "extra_tactical");
        var_7bd653180204fca6.wildcards[var_34989ff734e79a50] = 1;
    }
}

// Namespace validation/namespace_6502912624889105
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b94
// Size: 0x267
function validateperks(var_7bd653180204fca6, perks, archetype) {
    var_be7e0b9208f63c11 = [];
    var_be7e0b9208f63c11[1] = 0;
    var_be7e0b9208f63c11[2] = 0;
    var_be7e0b9208f63c11[3] = 0;
    foreach (perk in perks) {
        if (isdefined(perk) && perk != "none") {
            if (!function_f45c19871b412ea5(perk)) {
                validationerror("invalidPerk", undefined, perk);
                var_7bd653180204fca6.invaliditems[9][var_7bd653180204fca6.invaliditems[9].size] = perk;
            }
            slot = namespace_b6a8027f477010e1::getperkslot(perk);
            if (isdefined(slot)) {
                var_be7e0b9208f63c11[slot]++;
                if (var_be7e0b9208f63c11[slot] > 2) {
                    validationerror("tooManyPerks", slot, perk);
                    var_7bd653180204fca6.invaliditems[9][var_7bd653180204fca6.invaliditems[9].size] = perk;
                }
                if (!self isitemunlocked(perk, "perk")) {
                    validationerror("lockedPerk", slot, perk);
                    var_7bd653180204fca6.invaliditems[9][var_7bd653180204fca6.invaliditems[9].size] = perk;
                }
                if (var_be7e0b9208f63c11[slot] == 1) {
                    var_7bd653180204fca6.pointcost++;
                } else {
                    var_7bd653180204fca6.wildcards["extra_perk_" + slot] = 1;
                    var_7bd653180204fca6.pointcost = var_7bd653180204fca6.pointcost + 2;
                }
            } else if (isdefined(level.menurigperks[perk])) {
                if (level.menurigperks[perk].archetype != archetype) {
                    validationerror("rigPerkOnWrongRig", undefined, perk);
                    var_7bd653180204fca6.invaliditems[9][var_7bd653180204fca6.invaliditems[9].size] = perk;
                }
                if (!self isitemunlocked(perk, "trait")) {
                    validationerror("lockedRigPerk", slot, perk);
                    var_7bd653180204fca6.invaliditems[9][var_7bd653180204fca6.invaliditems[9].size] = perk;
                }
            } else {
                validationerror("unknownPerkType", undefined, perk);
                var_7bd653180204fca6.invaliditems[9][var_7bd653180204fca6.invaliditems[9].size] = perk;
            }
        }
    }
}

// Namespace validation/namespace_6502912624889105
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2e02
// Size: 0x197
function validatestreaks(var_7bd653180204fca6, var_9c67970f41b09eba, var_9c67960f41b09c87, var_9c67950f41b09a54) {
    streaks = [0:var_9c67970f41b09eba, 1:var_9c67960f41b09c87, 2:var_9c67950f41b09a54];
    foreach (streak in streaks) {
        if (streak == "none") {
            continue;
        }
        var_159ec9a052e1efda = namespace_58a74e7d54b56e8d::getkillstreaksetupinfo(streak);
        if (!isdefined(var_159ec9a052e1efda)) {
            validationerror("unknownStreak", undefined, streak);
            var_7bd653180204fca6.invaliditems[12] = 1;
        }
        if (!self isitemunlocked(streak, "killstreak")) {
            validationerror("lockedStreak", undefined, streak);
            var_7bd653180204fca6.invaliditems[12] = 1;
        }
    }
    if (var_9c67970f41b09eba == var_9c67960f41b09c87 && var_9c67970f41b09eba != "none") {
        validationerror("duplicateStreak", undefined, var_9c67970f41b09eba);
        var_7bd653180204fca6.invaliditems[12] = 1;
    } else if (var_9c67970f41b09eba == var_9c67950f41b09a54 && var_9c67970f41b09eba != "none") {
        validationerror("duplicateStreak", undefined, var_9c67970f41b09eba);
        var_7bd653180204fca6.invaliditems[12] = 1;
    } else if (var_9c67960f41b09c87 == var_9c67950f41b09a54 && var_9c67960f41b09c87 != "none") {
        validationerror("duplicateStreak", undefined, var_9c67960f41b09c87);
        var_7bd653180204fca6.invaliditems[12] = 1;
    }
}

// Namespace validation/namespace_6502912624889105
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2fa0
// Size: 0x70
function validatearchetype(var_7bd653180204fca6, archetype) {
    if (!isdefined(level.archetypeids[archetype])) {
        validationerror("unknownArchetype", undefined, archetype);
        var_7bd653180204fca6.invaliditems[10] = 1;
    }
    if (!self isitemunlocked(archetype, "rig")) {
        validationerror("lockedArchetype", undefined, archetype);
        var_7bd653180204fca6.invaliditems[10] = 1;
    }
}

// Namespace validation/namespace_6502912624889105
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3017
// Size: 0x98
function validatesuper(var_7bd653180204fca6, super) {
    if (!isdefined(super) || super == "none") {
        return;
    }
    var_fbbb3212817d1d40 = level.superglobals.staticsuperdata[super];
    if (!isdefined(var_fbbb3212817d1d40)) {
        validationerror("unknownSuper", undefined, super);
        var_7bd653180204fca6.invaliditems[11] = 1;
    }
    if (!self isitemunlocked(super, "super")) {
        validationerror("lockedSuper", undefined, super);
        var_7bd653180204fca6.invaliditems[11] = 1;
    }
}

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30b6
// Size: 0xc
function validatewildcards(var_7bd653180204fca6) {
    
}

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c9
// Size: 0x40
function fixloadout(loadout) {
    var_b9c1cb17ee62925b = namespace_d19129e4fa5d176::loadout_getclassstruct();
    var_b9c1cb17ee62925b.loadoutarchetype = "archetype_assault";
    var_b9c1cb17ee62925b.loadoutprimary = "iw9_ar_mike4";
    return var_b9c1cb17ee62925b;
}

// Namespace validation/namespace_6502912624889105
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3111
// Size: 0x1ad
function fixweapon(loadout, weaponslot) {
    /#
        assert(function_d03495fe6418377b(weaponslot));
    #/
    if (weaponslot == #"primary") {
        loadout.loadoutprimary = "iw9_ar_mike4";
        loadout.loadoutprimarycamo = "none";
        loadout.loadoutprimaryreticle = "none";
        loadout.loadoutprimarylootitemid = 0;
        loadout.loadoutprimaryvariantid = -1;
        for (var_40e4b9c48b36c9ec = 0; var_40e4b9c48b36c9ec < namespace_d19129e4fa5d176::getmaxprimaryattachments(); var_40e4b9c48b36c9ec++) {
            loadout.loadoutprimaryattachments[var_40e4b9c48b36c9ec] = "none";
        }
    } else if (weaponslot == #"secondary") {
        loadout.loadoutsecondary = "none";
        loadout.loadoutsecondarycamo = "none";
        loadout.loadoutsecondaryreticle = "none";
        loadout.loadoutsecondarylootitemid = 0;
        loadout.loadoutsecondaryvariantid = -1;
        for (var_40e4b9c48b36c9ec = 0; var_40e4b9c48b36c9ec < namespace_d19129e4fa5d176::getmaxsecondaryattachments(); var_40e4b9c48b36c9ec++) {
            loadout.loadoutsecondaryattachments[var_40e4b9c48b36c9ec] = "none";
        }
    } else {
        loadout.loadouttertiary = "none";
        loadout.loadouttertiarycamo = "none";
        loadout.loadouttertiaryreticle = "none";
        loadout.var_64e57707d385a2f5 = 0;
        loadout.loadouttertiaryvariantid = -1;
        for (var_40e4b9c48b36c9ec = 0; var_40e4b9c48b36c9ec < namespace_d19129e4fa5d176::function_4073b3f145413cd(); var_40e4b9c48b36c9ec++) {
            loadout.var_494870a5978b5a09[var_40e4b9c48b36c9ec] = "none";
        }
    }
}

// Namespace validation/namespace_6502912624889105
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32c5
// Size: 0x86
function fixattachment(loadout, weaponslot, attachmentindex) {
    /#
        assert(function_d03495fe6418377b(weaponslot));
    #/
    if (weaponslot == #"primary") {
        loadout.loadoutprimaryattachments[attachmentindex] = "none";
    } else if (weaponslot == #"secondary") {
        loadout.loadoutsecondaryattachments[attachmentindex] = "none";
    } else {
        loadout.var_494870a5978b5a09[attachmentindex] = "none";
    }
}

// Namespace validation/namespace_6502912624889105
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3352
// Size: 0x5d
function fixpower(loadout, var_17bd8fa17ee68bd6) {
    if (var_17bd8fa17ee68bd6 == "primary") {
        loadout.loadoutpowerprimary = "none";
        loadout.loadoutextrapowerprimary = 0;
    } else {
        loadout.loadoutpowersecondary = "none";
        loadout.loadoutextrapowersecondary = 0;
    }
}

// Namespace validation/namespace_6502912624889105
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33b6
// Size: 0x32
function fixperk(loadout, perk) {
    loadout.loadoutperks = array_remove(loadout.loadoutperks, perk);
}

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ef
// Size: 0x3f
function fixkillstreaks(loadout) {
    loadout.loadoutkillstreak1 = "none";
    loadout.loadoutkillstreak2 = "none";
    loadout.loadoutkillstreak3 = "none";
}

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3435
// Size: 0x8f
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

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34cb
// Size: 0x1d
function fixsuper(loadout) {
    loadout.loadoutsuper = "none";
}

// Namespace validation/namespace_6502912624889105
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x34ef
// Size: 0x23c
function fixinvaliditems(loadout, invaliditems) {
    if (isdefined(invaliditems[0])) {
        loadout = fixloadout(loadout);
        return loadout;
    }
    if (isdefined(invaliditems[1])) {
        fixweapon(loadout, #"primary");
    } else if (isdefined(invaliditems[3])) {
        for (var_40e4b9c48b36c9ec = 0; var_40e4b9c48b36c9ec < namespace_d19129e4fa5d176::getmaxprimaryattachments(); var_40e4b9c48b36c9ec++) {
            fixattachment(loadout, #"primary", var_40e4b9c48b36c9ec);
        }
    } else {
        foreach (var_40e4b9c48b36c9ec in invaliditems[2]) {
            fixattachment(loadout, #"primary", var_40e4b9c48b36c9ec);
        }
    }
    if (isdefined(invaliditems[4])) {
        fixweapon(loadout, #"secondary");
    } else if (isdefined(invaliditems[6])) {
        for (var_40e4b9c48b36c9ec = 0; var_40e4b9c48b36c9ec < namespace_d19129e4fa5d176::getmaxsecondaryattachments(); var_40e4b9c48b36c9ec++) {
            fixattachment(loadout, #"secondary", var_40e4b9c48b36c9ec);
        }
    } else {
        foreach (var_40e4b9c48b36c9ec in invaliditems[5]) {
            fixattachment(loadout, #"secondary", var_40e4b9c48b36c9ec);
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

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3733
// Size: 0x5b
function lookuppowerslot(var_ef7579be51267bdb) {
    var_dadae42dc766a7f7 = tablelookup("mp/menuPowers.csv", 3, var_ef7579be51267bdb, 2);
    if (!isdefined(var_dadae42dc766a7f7) || var_dadae42dc766a7f7 != "1" && var_dadae42dc766a7f7 != "2") {
        return undefined;
    }
    return ter_op(var_dadae42dc766a7f7 == "1", "primary", "secondary");
}

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3796
// Size: 0xd
function weaponunlocksvialoot(weaponref) {
    return 0;
}

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37ab
// Size: 0x32
function isweaponuihidden(var_49e6ef3edadd524e) {
    return isdefined(level.weaponmapdata[var_49e6ef3edadd524e]) && istrue(level.weaponmapdata[var_49e6ef3edadd524e].uihidden);
}

// Namespace validation/namespace_6502912624889105
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e5
// Size: 0x69
function isweaponvariantlocked(var_49e6ef3edadd524e, variantid) {
    if (isanymlgmatch()) {
        return 1;
    }
    if (!isdefined(variantid) || variantid <= 0) {
        return 0;
    }
    var_a6ed1602a5107749 = var_49e6ef3edadd524e + "|" + variantid;
    return isdefined(level.weaponlootmapdata[var_a6ed1602a5107749]) && istrue(level.weaponlootmapdata[var_a6ed1602a5107749].islocked);
}

// Namespace validation/namespace_6502912624889105
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3856
// Size: 0x1b1
function isattachmentvariantinvalid(var_49e6ef3edadd524e, var_fedb77aad2340743, attachment, var_1708b873a34eeb50) {
    if (isanymlgmatch()) {
        return 1;
    }
    var_c0123fb0fce151e5 = isdefined(var_1708b873a34eeb50) && var_1708b873a34eeb50 > 0 && attachment != "none";
    if (!var_c0123fb0fce151e5) {
        return 0;
    }
    var_d54114842c617892 = getdvarint(@"hash_14e87ea13737cdbb", 1);
    var_851e7fe2ec9adbce = isdefined(var_fedb77aad2340743) && var_fedb77aad2340743 > 0;
    if (!var_d54114842c617892 && !var_851e7fe2ec9adbce) {
        return 1;
    }
    var_e88b89f1334a1506 = var_49e6ef3edadd524e + "|" + var_fedb77aad2340743;
    var_ffe43e0d1655060e = 0;
    for (variantindex = 1; 1; variantindex++) {
        var_a6ed1602a5107749 = var_49e6ef3edadd524e + "|" + variantindex;
        if (!isdefined(level.weaponlootmapdata[var_a6ed1602a5107749])) {
            break;
        }
        if (var_d54114842c617892 || var_a6ed1602a5107749 == var_e88b89f1334a1506) {
            if (!istrue(level.weaponlootmapdata[var_a6ed1602a5107749].islocked)) {
                if (isdefined(level.weaponlootmapdata[var_a6ed1602a5107749].attachcustomtoidmap)) {
                    foreach (key, id in level.weaponlootmapdata[var_a6ed1602a5107749].attachcustomtoidmap) {
                        if (var_1708b873a34eeb50 == id && attachment == key) {
                            var_ffe43e0d1655060e = 1;
                            break;
                        }
                    }
                }
                if (var_ffe43e0d1655060e) {
                    break;
                }
            }
        }
    }
    return !var_ffe43e0d1655060e;
}

// Namespace validation/namespace_6502912624889105
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a0f
// Size: 0x8f1
function function_9480a79a4852090f() {
    var_6433b6e8ecde2ae9 = spawnstruct();
    var_59896658f6aa750c = getdvarint(@"hash_1c46edd4b28ec23", 32081);
    var_9e921d97a928ff80 = getdvarint(@"hash_3ac8e9ebdf483563", 17211);
    if (getgametype() == "war_snipers" || getgametype() == "dom_snipers") {
        var_9e921d97a928ff80 = getdvarint(@"hash_3ac8e9ebdf483563", 11370);
    }
    var_6433b6e8ecde2ae9.var_5e6961853f911abf = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_59896658f6aa750c);
    var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb = [];
    var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb[0] = "none";
    var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb[1] = "none";
    var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb[2] = "none";
    var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb[3] = "none";
    var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb[4] = "none";
    var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb[5] = "none";
    var_6433b6e8ecde2ae9.var_606482762a976e6b = "none";
    var_6433b6e8ecde2ae9.var_9e9bf32419e3fb65 = "none";
    var_6433b6e8ecde2ae9.var_a2746a3326ffd02d = -1;
    var_6433b6e8ecde2ae9.var_dbd72ebf429c33cc = [];
    var_6433b6e8ecde2ae9.var_ab71722736d6300d = "none";
    var_6433b6e8ecde2ae9.var_21edf78f47f80693[0] = "none";
    var_6433b6e8ecde2ae9.var_21edf78f47f80693[1] = "none";
    var_6433b6e8ecde2ae9.var_21edf78f47f80693[2] = "none";
    var_6433b6e8ecde2ae9.var_21edf78f47f80693[3] = "none";
    var_6433b6e8ecde2ae9.var_21edf78f47f80693[4] = "none";
    var_6433b6e8ecde2ae9.var_fbc41ef364d09cdb = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_9e921d97a928ff80);
    var_6433b6e8ecde2ae9.var_8db17208eee8983f = [];
    var_6433b6e8ecde2ae9.var_8db17208eee8983f[0] = "none";
    var_6433b6e8ecde2ae9.var_8db17208eee8983f[1] = "none";
    var_6433b6e8ecde2ae9.var_8db17208eee8983f[2] = "none";
    var_6433b6e8ecde2ae9.var_8db17208eee8983f[3] = "none";
    var_6433b6e8ecde2ae9.var_8db17208eee8983f[4] = "none";
    var_6433b6e8ecde2ae9.var_fe85ac60e4c42827 = "none";
    var_6433b6e8ecde2ae9.var_5ef582d35fc85969 = "none";
    var_6433b6e8ecde2ae9.var_5ccacfeceb8f0b91 = -1;
    var_6433b6e8ecde2ae9.var_541023c8262ad6a8 = [];
    var_6433b6e8ecde2ae9.var_28c73c08c5f76289 = "none";
    var_6433b6e8ecde2ae9.var_6ff9bdde98b6c7af[0] = "none";
    var_6433b6e8ecde2ae9.var_6ff9bdde98b6c7af[1] = "none";
    var_6433b6e8ecde2ae9.var_6ff9bdde98b6c7af[2] = "none";
    var_6433b6e8ecde2ae9.var_6ff9bdde98b6c7af[3] = "none";
    var_6433b6e8ecde2ae9.var_6ff9bdde98b6c7af[4] = "none";
    var_6433b6e8ecde2ae9.var_89ba5f57a95d1ce1 = [];
    var_6433b6e8ecde2ae9.var_89ba5f57a95d1ce1[0] = "specialty_scavenger_br";
    var_6433b6e8ecde2ae9.var_89ba5f57a95d1ce1[1] = "specialty_tac_resist_br";
    var_6433b6e8ecde2ae9.var_13db3ca1ad2db644 = "specialty_contract_payout";
    var_6433b6e8ecde2ae9.var_34fdca49e62d81ee = "specialty_combat_scout";
    var_6433b6e8ecde2ae9.perks = [];
    var_6433b6e8ecde2ae9.perks[0] = var_6433b6e8ecde2ae9.var_89ba5f57a95d1ce1[0];
    var_6433b6e8ecde2ae9.perks[1] = var_6433b6e8ecde2ae9.var_89ba5f57a95d1ce1[1];
    var_6433b6e8ecde2ae9.perks[2] = var_6433b6e8ecde2ae9.var_13db3ca1ad2db644;
    var_6433b6e8ecde2ae9.perks[3] = var_6433b6e8ecde2ae9.var_34fdca49e62d81ee;
    var_6433b6e8ecde2ae9.var_223912952e2fcaa5 = "equip_frag";
    var_6433b6e8ecde2ae9.var_56507f15843909c5 = "equip_flash";
    var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e = [];
    var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[0] = "uav";
    var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[1] = "cruise_predator";
    var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[2] = "fuel_airstrike";
    if (isanymlgmatch()) {
        var_4e05090d7e0c97ce = getscriptbundle("leagueplaybundle:" + level.var_21e8a7768c0260f2.var_b1e3933dec92ebff);
        var_effe6f81e1a11b81 = getscriptbundle("classtableentry:" + var_4e05090d7e0c97ce.var_6433b6e8ecde2ae9);
        var_9f9e341110bf6f8e = getscriptbundle("killstreaklist:" + var_4e05090d7e0c97ce.var_4b45b03e52a55f4e);
        var_6433b6e8ecde2ae9.var_5e6961853f911abf = var_effe6f81e1a11b81.primaryweapon.weapon;
        var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb = [];
        var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb[0] = var_effe6f81e1a11b81.primaryweapon.attachment1;
        var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb[1] = var_effe6f81e1a11b81.primaryweapon.attachment2;
        var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb[2] = var_effe6f81e1a11b81.primaryweapon.attachment3;
        var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb[3] = var_effe6f81e1a11b81.primaryweapon.attachment4;
        var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb[4] = var_effe6f81e1a11b81.primaryweapon.attachment5;
        var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb[5] = var_effe6f81e1a11b81.primaryweapon.attachment6;
        var_6433b6e8ecde2ae9.var_606482762a976e6b = var_effe6f81e1a11b81.primaryweapon.camo;
        var_6433b6e8ecde2ae9.var_5a68d67fc469e1e7 = var_effe6f81e1a11b81.primaryweapon.reticle;
        var_6433b6e8ecde2ae9.var_a2746a3326ffd02d = ter_op(isdefined(var_effe6f81e1a11b81.primaryweapon.variantid), int(var_effe6f81e1a11b81.primaryweapon.variantid), -1);
        var_6433b6e8ecde2ae9.var_fbc41ef364d09cdb = var_effe6f81e1a11b81.secondaryweapon.weapon;
        var_6433b6e8ecde2ae9.var_8db17208eee8983f = [];
        var_6433b6e8ecde2ae9.var_8db17208eee8983f[0] = var_effe6f81e1a11b81.secondaryweapon.attachment1;
        var_6433b6e8ecde2ae9.var_8db17208eee8983f[1] = var_effe6f81e1a11b81.secondaryweapon.attachment2;
        var_6433b6e8ecde2ae9.var_8db17208eee8983f[2] = var_effe6f81e1a11b81.secondaryweapon.attachment3;
        var_6433b6e8ecde2ae9.var_8db17208eee8983f[3] = var_effe6f81e1a11b81.secondaryweapon.attachment4;
        var_6433b6e8ecde2ae9.var_8db17208eee8983f[4] = var_effe6f81e1a11b81.secondaryweapon.attachment5;
        var_6433b6e8ecde2ae9.var_fe85ac60e4c42827 = var_effe6f81e1a11b81.secondaryweapon.camo;
        var_6433b6e8ecde2ae9.var_5ef582d35fc85969 = var_effe6f81e1a11b81.secondaryweapon.reticle;
        var_6433b6e8ecde2ae9.var_5ccacfeceb8f0b91 = ter_op(isdefined(var_effe6f81e1a11b81.secondaryweapon.variantid), int(var_effe6f81e1a11b81.secondaryweapon.variantid), -1);
        var_6433b6e8ecde2ae9.var_541023c8262ad6a8 = [];
        var_6433b6e8ecde2ae9.var_89ba5f57a95d1ce1 = [];
        var_6433b6e8ecde2ae9.var_89ba5f57a95d1ce1[0] = var_effe6f81e1a11b81.perks.perk1;
        var_6433b6e8ecde2ae9.var_89ba5f57a95d1ce1[1] = var_effe6f81e1a11b81.perks.perk2;
        var_6433b6e8ecde2ae9.var_13db3ca1ad2db644 = var_effe6f81e1a11b81.perks.perk3;
        var_6433b6e8ecde2ae9.var_34fdca49e62d81ee = var_effe6f81e1a11b81.extraperks.perk1;
        var_6433b6e8ecde2ae9.var_223912952e2fcaa5 = var_effe6f81e1a11b81.equipment.primary;
        var_6433b6e8ecde2ae9.var_56507f15843909c5 = var_effe6f81e1a11b81.equipment.secondary;
        var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[0] = var_9f9e341110bf6f8e.var_386a08793af08e6c[0].ref;
        var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[1] = var_9f9e341110bf6f8e.var_386a08793af08e6c[1].ref;
        var_6433b6e8ecde2ae9.var_4b45b03e52a55f4e[2] = var_9f9e341110bf6f8e.var_386a08793af08e6c[2].ref;
    }
    return var_6433b6e8ecde2ae9;
}

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4308
// Size: 0x14e
function function_858d9cd34926a30f(loadout) {
    var_6433b6e8ecde2ae9 = function_9480a79a4852090f();
    loadout.loadoutprimary = var_6433b6e8ecde2ae9.var_5e6961853f911abf;
    loadout.loadoutprimaryattachments = var_6433b6e8ecde2ae9.var_2aabec7bb44d89cb;
    loadout.loadoutprimarycamo = var_6433b6e8ecde2ae9.var_606482762a976e6b;
    loadout.loadoutprimaryreticle = var_6433b6e8ecde2ae9.var_9e9bf32419e3fb65;
    loadout.loadoutprimaryvariantid = var_6433b6e8ecde2ae9.var_a2746a3326ffd02d;
    loadout.loadoutprimaryattachmentids = var_6433b6e8ecde2ae9.var_dbd72ebf429c33cc;
    loadout.loadoutprimarycosmeticattachment = var_6433b6e8ecde2ae9.var_ab71722736d6300d;
    loadout.loadoutprimarystickers[0] = var_6433b6e8ecde2ae9.var_21edf78f47f80693[0];
    loadout.loadoutprimarystickers[1] = var_6433b6e8ecde2ae9.var_21edf78f47f80693[1];
    loadout.loadoutprimarystickers[2] = var_6433b6e8ecde2ae9.var_21edf78f47f80693[2];
    loadout.loadoutprimarystickers[3] = var_6433b6e8ecde2ae9.var_21edf78f47f80693[3];
    loadout.loadoutprimarystickers[4] = var_6433b6e8ecde2ae9.var_21edf78f47f80693[4];
    return loadout;
}

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x445e
// Size: 0x14e
function function_31c670058673ec7b(loadout) {
    var_6433b6e8ecde2ae9 = function_9480a79a4852090f();
    loadout.loadoutsecondary = var_6433b6e8ecde2ae9.var_fbc41ef364d09cdb;
    loadout.loadoutsecondaryattachments = var_6433b6e8ecde2ae9.var_8db17208eee8983f;
    loadout.loadoutsecondarycamo = var_6433b6e8ecde2ae9.var_fe85ac60e4c42827;
    loadout.loadoutsecondaryreticle = var_6433b6e8ecde2ae9.var_5ef582d35fc85969;
    loadout.loadoutsecondaryvariantid = var_6433b6e8ecde2ae9.var_5ccacfeceb8f0b91;
    loadout.loadoutsecondaryattachmentids = var_6433b6e8ecde2ae9.var_541023c8262ad6a8;
    loadout.loadoutsecondarycosmeticattachment = var_6433b6e8ecde2ae9.var_28c73c08c5f76289;
    loadout.loadoutsecondarystickers[0] = var_6433b6e8ecde2ae9.var_6ff9bdde98b6c7af[0];
    loadout.loadoutsecondarystickers[1] = var_6433b6e8ecde2ae9.var_6ff9bdde98b6c7af[1];
    loadout.loadoutsecondarystickers[2] = var_6433b6e8ecde2ae9.var_6ff9bdde98b6c7af[2];
    loadout.loadoutsecondarystickers[3] = var_6433b6e8ecde2ae9.var_6ff9bdde98b6c7af[3];
    loadout.loadoutsecondarystickers[4] = var_6433b6e8ecde2ae9.var_6ff9bdde98b6c7af[4];
    return loadout;
}

// Namespace validation/namespace_6502912624889105
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b4
// Size: 0x7e
function function_5e76ad052ba12845(loadout) {
    var_6433b6e8ecde2ae9 = function_9480a79a4852090f();
    for (i = 0; i < loadout.loadoutperks.size; i++) {
        if (i >= var_6433b6e8ecde2ae9.perks.size) {
            /#
                println(" ");
            #/
        } else {
            loadout.loadoutperks[i] = var_6433b6e8ecde2ae9.perks[i];
        }
    }
    return loadout;
}

