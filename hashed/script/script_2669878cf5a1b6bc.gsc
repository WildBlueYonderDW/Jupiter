// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_600b944a95c3a7bf;
#using script_2669878cf5a1b6bc;
#using script_6d0c0f9491f682df;

#namespace weapon;

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b1
// Size: 0x295
function buildweapon_blueprintwithcustomattachments(rootname, attachments, camo, reticle, variantid, attachmentids, cosmeticattachment, stickers, var_11a1fa68aeb971c0) {
    var_c7bd95b10c89cff8 = weaponassetnamemap(rootname, variantid);
    var_91bbf8d2294a656e = [];
    blockedslots = [];
    blockedtypes = [];
    if (isdefined(attachments)) {
        /#
            assertex(!isdefined(attachmentids) || attachments.size == attachmentids.size, "buildWeapon_variantWithCustomAttachments() passed attachmentIDs array not of the same size as the passed attachments array.");
        #/
        foreach (idx, attachment in attachments) {
            var_1fce8439ed13e7b3 = function_891b1fb6a51b97b0(var_c7bd95b10c89cff8, attachment);
            slotsblocked = function_c6d15635447865c5(var_c7bd95b10c89cff8, attachment);
            foreach (blockedslot in slotsblocked) {
                blockedslots[blockedslot] = 1;
            }
            foreach (var_93d6af4397ecf6b4 in var_1fce8439ed13e7b3) {
                blockedtypes[var_93d6af4397ecf6b4] = 1;
            }
            aid = 0;
            if (isdefined(attachmentids) && isdefined(attachmentids[idx])) {
                aid = attachmentids[idx];
            }
            var_91bbf8d2294a656e[attachment] = aid;
        }
    }
    var_3482901e4b0e85e4 = weaponattachcustomtoidmap(rootname, variantid);
    if (isdefined(var_3482901e4b0e85e4)) {
        foreach (attachment, id in var_3482901e4b0e85e4) {
            if (blockedslots.size > 0) {
                slot = function_4add228b999c26aa(var_c7bd95b10c89cff8, attachment);
                if (isdefined(blockedslots[slot])) {
                    continue;
                }
            }
            if (blockedtypes.size > 0) {
                type = function_7c612ac92ba98dcb(var_c7bd95b10c89cff8, attachment);
                if (isdefined(blockedtypes[type])) {
                    continue;
                }
            }
            var_91bbf8d2294a656e[attachment] = id;
        }
    }
    return buildweapon_attachmentidmap(rootname, var_91bbf8d2294a656e, camo, reticle, variantid, cosmeticattachment, stickers, var_11a1fa68aeb971c0);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164e
// Size: 0xd8
function buildweapon_blueprint(rootname, camo, reticle, variantid, cosmeticattachment, stickers, var_11a1fa68aeb971c0) {
    var_91bbf8d2294a656e = weaponattachcustomtoidmap(rootname, variantid);
    if (!isdefined(var_91bbf8d2294a656e)) {
        var_91bbf8d2294a656e = [];
    }
    if (istrue(level.var_320be3d1af4ef493) && var_91bbf8d2294a656e.size > 0) {
        foreach (attachment, id in var_91bbf8d2294a656e) {
            if (issubstr(attachment, "laser")) {
                var_91bbf8d2294a656e[attachment] = undefined;
            }
        }
    }
    return buildweapon_attachmentidmap(rootname, var_91bbf8d2294a656e, camo, reticle, variantid, cosmeticattachment, stickers, var_11a1fa68aeb971c0);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172e
// Size: 0xc3
function buildweapon_attachmentidmap(rootname, var_91bbf8d2294a656e, camo, reticle, variantid, cosmeticattachment, stickers, var_11a1fa68aeb971c0) {
    attachments = [];
    attachmentids = [];
    foreach (attachment, id in var_91bbf8d2294a656e) {
        attachments[attachments.size] = attachment;
        attachmentids[attachmentids.size] = id;
    }
    return buildweapon(rootname, attachments, camo, reticle, variantid, attachmentids, cosmeticattachment, stickers, var_11a1fa68aeb971c0);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f9
// Size: 0x407
function buildweapon(rootname, attachments, camo, reticle, variantid, attachmentids, cosmeticattachment, stickers, var_11a1fa68aeb971c0, attachmenttuning) {
    var_4cc9de3064c7cf51 = level.var_ec2fb549b15ad827;
    if (!istrue(iskillstreakplayerweapon(rootname))) {
        rootname = getweaponrootname(rootname);
    }
    if (isminigunweapon(rootname)) {
        minigunweaponobj = scripts/cp_mp/utility/weapon_utility::function_eeaa22f0cd1ff845(rootname);
        return minigunweaponobj;
    }
    if (isdefined(attachments)) {
        /#
            assertex(isarray(attachments), "buildWeapon() passed invalid attachment array.");
        #/
    } else {
        attachments = [];
    }
    if (!isdefined(camo)) {
        camo = "none";
    }
    if (isdefined(variantid) && variantid <= 0) {
        variantid = undefined;
    }
    var_c7bd95b10c89cff8 = weaponassetnamemap(rootname, variantid);
    var_91bbf8d2294a656e = buildweaponattachmentidmap(attachments, attachmentids);
    weaponobj = makeweapon(var_c7bd95b10c89cff8, [], undefined, camo, variantid);
    var_de230719cecf1c95 = function_c7cb2ebf3712dc6c(rootname, var_91bbf8d2294a656e, variantid, var_c7bd95b10c89cff8, attachments);
    if (isdefined(cosmeticattachment) && cosmeticattachment != "none") {
        var_de230719cecf1c95[cosmeticattachment] = 0;
    }
    var_de230719cecf1c95 = filterinvalidattachmentsfromidmap(var_de230719cecf1c95, var_c7bd95b10c89cff8, weaponobj);
    foreach (attachment, attachmentid in var_de230719cecf1c95) {
        if (isdefined(attachmenttuning) && isdefined(attachmenttuning[attachment])) {
            weaponobj = weaponobj withattachment(attachment, attachmentid, attachmenttuning[attachment]);
            continue;
        }
        var_379ca50ca75be2a9 = 0;
        attachvariants = function_55db7a4374ed4b1b(var_c7bd95b10c89cff8, attachment);
        foreach (id in attachvariants) {
            if (attachmentid == id) {
                var_379ca50ca75be2a9 = 1;
                break;
            }
        }
        if (var_379ca50ca75be2a9) {
            weaponobj = weaponobj withattachment(attachment, attachmentid);
            continue;
        }
        weaponobj = weaponobj withattachment(attachment);
    }
    if (istrue(var_11a1fa68aeb971c0)) {
        if (weaponsupportslaserir(var_c7bd95b10c89cff8, weaponobj) && function_8a96b90526c40df6(weaponobj, attachments)) {
            var_38d50ff0e9ee470f = getweaponnvgattachment(weaponobj);
            if (var_38d50ff0e9ee470f != "invalid" && !isdefined(var_91bbf8d2294a656e[var_38d50ff0e9ee470f])) {
                weaponobj = weaponobj withattachment(var_38d50ff0e9ee470f);
            }
        }
    }
    if (isdefined(variantid) && (!isdefined(var_4cc9de3064c7cf51) || !istrue(var_4cc9de3064c7cf51) || level.gametype == "br")) {
        weaponobj = weaponobj function_7e483d6e6b4b5688(variantid);
    }
    if (isdefined(level.var_436bef26c1525d89) && isdefined(weaponobj)) {
        weaponobj = self [[ level.var_436bef26c1525d89 ]](weaponobj);
    }
    if (isdefined(stickers)) {
        for (i = 0; i < stickers.size; i++) {
            var_223521c35ae8a753 = stickers[i];
            if (var_223521c35ae8a753 == "none") {
                continue;
            }
            if ("i/" != getsubstr(var_223521c35ae8a753, 0, 2)) {
                var_223521c35ae8a753 = "i/" + stickers[i];
            }
            weaponobj = weaponobj setsticker(i, var_223521c35ae8a753);
        }
    }
    if (isdefined(weaponobj.scope) && !isstartstr(weaponobj.scope, "ironsdefault")) {
        reticleindex = getreticleindex(reticle);
        if (isdefined(reticleindex)) {
            weaponobj = weaponobj withreticle(reticleindex);
        }
    }
    /#
        if (isdefined(reticle) && reticle != "NONE") {
            /#
                assertex(isdefined(weaponobj.scope), "weaponAttachCustomToIDMap() called without a variantID. Only blueprint weapons have custom attachments.");
            #/
            /#
                assertex(!isstartstr(weaponobj.scope, "manual_turret_mp"), "pac_sentry");
            #/
        }
    #/
    return weaponobj;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c08
// Size: 0x38b
function function_c7cb2ebf3712dc6c(rootname, var_91bbf8d2294a656e, variantid, var_c7bd95b10c89cff8, attachments) {
    if (!isdefined(var_91bbf8d2294a656e)) {
        var_91bbf8d2294a656e = [];
    }
    var_91bbf8d2294a656e = array_remove_key(var_91bbf8d2294a656e, "none");
    var_91bbf8d2294a656e = array_remove_key(var_91bbf8d2294a656e, "");
    var_3f065af353909441 = weaponattachdefaulttoidmap(rootname, variantid, attachments);
    if (!isdefined(var_3f065af353909441)) {
        var_3f065af353909441 = [];
    }
    var_c7bd95b10c89cff8 = function_72376783a92be46(rootname);
    var_85b2a5343fc91ccb = weaponassetnamemap(rootname, variantid);
    var_f644cf7e62ab4d95 = function_d7f1989d63343007(var_c7bd95b10c89cff8, attachments);
    var_234557a232185389 = [];
    var_55559af28dcac702 = [];
    if (isdefined(variantid) && variantid > 0) {
        foreach (var_766d3914f2a5d02e, id in var_3f065af353909441) {
            foreach (baseweaponattach in var_f644cf7e62ab4d95) {
                if (var_766d3914f2a5d02e == baseweaponattach) {
                    var_234557a232185389[var_766d3914f2a5d02e] = id;
                }
            }
            if (function_4add228b999c26aa(var_c7bd95b10c89cff8, var_766d3914f2a5d02e) == "other") {
                if (issubstr(var_766d3914f2a5d02e, "akimbo")) {
                    continue;
                }
                var_234557a232185389[var_766d3914f2a5d02e] = id;
            }
        }
    }
    if (var_234557a232185389.size > 0) {
        foreach (defaultattach in var_f644cf7e62ab4d95) {
            var_55559af28dcac702[defaultattach] = 0;
        }
        var_234557a232185389 = combinedefaultandcustomattachmentidmaps(var_55559af28dcac702, var_234557a232185389);
    }
    var_71daf4388d8cc783 = [];
    if (var_234557a232185389.size > 0) {
        var_71daf4388d8cc783 = combinedefaultandcustomattachmentidmaps(var_234557a232185389, var_91bbf8d2294a656e);
    } else if (isdefined(var_3f065af353909441)) {
        var_71daf4388d8cc783 = combinedefaultandcustomattachmentidmaps(var_3f065af353909441, var_91bbf8d2294a656e);
    }
    attachmentsextra = [];
    level.var_79b6f061be629059 = [];
    foreach (attachment, attachmentid in var_71daf4388d8cc783) {
        extra = attachmentmap_toextra(attachment);
        if (isdefined(extra)) {
            foreach (extraattach in extra) {
                var_201c473ebb366b33 = 0;
                if (isdefined(variantid)) {
                    var_201c473ebb366b33 = attachmentmap_extratovariantid(extraattach, rootname, variantid);
                } else if (attachmentid != 0) {
                    var_201c473ebb366b33 = attachmentid;
                }
                attachmentsextra[extraattach] = var_201c473ebb366b33;
                level.var_79b6f061be629059[level.var_79b6f061be629059.size] = extraattach;
            }
        }
    }
    if (var_85b2a5343fc91ccb == "iw9_sh_charlie725_v10" && attachmentsextra < 1) {
        attachmentsextra["charlie725_doom_blueprint_tuning"] = 4;
    }
    if (attachmentsextra.size > 0) {
        var_71daf4388d8cc783 = array_combine_unique_keys(var_71daf4388d8cc783, attachmentsextra);
    }
    if (var_71daf4388d8cc783.size > 0) {
        var_71daf4388d8cc783 = filterattachmenttoidmap(var_71daf4388d8cc783, rootname, var_c7bd95b10c89cff8, var_91bbf8d2294a656e, attachments);
    }
    /#
        assertex(var_71daf4388d8cc783.size <= 14, "buildWeapon() ended up with over 14 attachments after mods and defaults were added.");
    #/
    return var_71daf4388d8cc783;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9b
// Size: 0x411
function filterattachmenttoidmap(var_91bbf8d2294a656e, weaponname, var_c7bd95b10c89cff8, var_3e66176ed86556b4, attachments) {
    filtered = [];
    attachments = [];
    if (isdefined(level.weaponmapdata[weaponname]) && isdefined(level.weaponmapdata[weaponname].var_d43f9c4f6b647ba4)) {
        var_91bbf8d2294a656e = function_73948793bdd465e3(var_91bbf8d2294a656e, var_c7bd95b10c89cff8);
    }
    var_91bbf8d2294a656e = function_89579d7ba0194e4a(var_91bbf8d2294a656e, var_c7bd95b10c89cff8);
    slotschecked = 1;
    var_7cb73d334cb60b70 = var_91bbf8d2294a656e;
    var_12537f9ef0bc941e = var_3e66176ed86556b4;
    var_f564d1d37df78cbd = function_d7f1989d63343007(var_c7bd95b10c89cff8, attachments);
    foreach (var_7d28a5543f741df1, id in var_12537f9ef0bc941e) {
        foreach (var_71c0c1c9b683339b in var_f564d1d37df78cbd) {
            if (var_7d28a5543f741df1 == var_71c0c1c9b683339b) {
                var_12537f9ef0bc941e = array_remove_key(var_12537f9ef0bc941e, var_7d28a5543f741df1);
            }
        }
    }
    if (iskillstreakweapon(weaponname)) {
        weaponasset = weaponname;
    } else {
        rootname = getweaponrootname(weaponname);
        weaponasset = weaponassetnamemap(rootname);
    }
    foreach (var_7d28a5543f741df1, id1 in var_12537f9ef0bc941e) {
        foreach (var_cda1b0c40c7958fd, id2 in var_91bbf8d2294a656e) {
            if (var_7d28a5543f741df1 == var_cda1b0c40c7958fd) {
                continue;
            }
            conflictstring = attachmentsconflict(var_cda1b0c40c7958fd, var_7d28a5543f741df1, weaponname, slotschecked, weaponasset);
            if (conflictstring == var_7d28a5543f741df1) {
                var_7cb73d334cb60b70 = array_remove_key(var_7cb73d334cb60b70, var_cda1b0c40c7958fd);
            }
        }
    }
    var_91bbf8d2294a656e = var_7cb73d334cb60b70;
    attachmentkey = getfirstarraykey(var_91bbf8d2294a656e);
    /#
        assertex(isdefined(attachmentkey), "attachmentToIdMap has no elements, possible error while reading table");
    #/
    attachments[0] = attachmentkey;
    for (attachmentindex = 0; attachmentindex < attachments.size; attachmentindex++) {
        attachment = attachments[attachmentindex];
        if (attachment != "none") {
            add = 1;
            for (filteredindex = 0; filteredindex < filtered.size; filteredindex++) {
                filtereditem = filtered[filteredindex];
                if (filtereditem == "") {
                    continue;
                }
                if (attachment == filtereditem) {
                    add = 0;
                    break;
                }
                conflictstring = attachmentsconflict(attachment, filtereditem, weaponname, slotschecked, weaponasset);
                if (conflictstring == attachment) {
                    filtered[filteredindex] = "";
                    continue;
                }
                if (conflictstring != "") {
                    filtered[filteredindex] = "";
                    add = 0;
                    conflictresults = [];
                    conflictresults = strtok(conflictstring, " ");
                    for (conflictidx = 0; conflictidx < conflictresults.size; conflictidx++) {
                        attachments[attachments.size] = conflictresults[conflictidx];
                    }
                    break;
                }
            }
            if (add) {
                filteredsize = filtered.size;
                filtered[filteredsize] = attachment;
            }
        }
        if (attachmentindex == attachments.size - 1) {
            attachmentkey = getnextarraykey(var_91bbf8d2294a656e, attachmentkey);
            if (isdefined(attachmentkey)) {
                attachments[attachments.size] = attachmentkey;
            }
        }
    }
    var_1168362b7eea93a9 = [];
    for (attachmentindex = 0; attachmentindex < filtered.size; attachmentindex++) {
        attachment = filtered[attachmentindex];
        if (attachment != "") {
            attachmentid = ter_op(isdefined(var_91bbf8d2294a656e[attachment]), var_91bbf8d2294a656e[attachment], 0);
            var_1168362b7eea93a9[attachment] = attachmentid;
        }
    }
    return var_1168362b7eea93a9;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23b4
// Size: 0x295
function function_89579d7ba0194e4a(var_91bbf8d2294a656e, weaponname, var_c7bd95b10c89cff8) {
    filtered = [];
    attachments = [];
    attachmentkey = getfirstarraykey(var_91bbf8d2294a656e);
    /#
        assertex(isdefined(attachmentkey), "attachmentToIdMap has no elements, possible error while reading table");
    #/
    attachments[0] = attachmentkey;
    var_76c539bdae654fd9 = [];
    if (isdefined(weaponname)) {
        var_76c539bdae654fd9 = function_6527364c1ecca6c6(weaponname);
    }
    if (iskillstreakweapon(weaponname)) {
        weaponasset = weaponname;
    } else {
        rootname = getweaponrootname(weaponname);
        weaponasset = weaponassetnamemap(rootname);
    }
    for (attachmentindex = 0; attachmentindex < attachments.size; attachmentindex++) {
        attachment = attachments[attachmentindex];
        if (attachment != "none") {
            add = 1;
            for (filteredindex = 0; filteredindex < filtered.size; filteredindex++) {
                filtereditem = filtered[filteredindex];
                if (filtereditem == "") {
                    continue;
                }
                if (attachment == filtereditem) {
                    add = 0;
                    break;
                }
                conflictstring = function_b9f9c92ef7f1922b(attachment, filtereditem, weaponname, weaponasset);
                if (conflictstring == attachment) {
                    if (isdefined(level.var_79b6f061be629059) && array_contains(level.var_79b6f061be629059, conflictstring)) {
                        if (array_contains(var_76c539bdae654fd9, filtereditem)) {
                            conflictstring = filtereditem;
                        } else {
                            filtered[filteredindex] = "";
                        }
                    } else {
                        filtered[filteredindex] = "";
                    }
                    continue;
                }
                if (conflictstring != "") {
                    filtered[filteredindex] = "";
                    add = 0;
                    conflictresults = [];
                    conflictresults = strtok(conflictstring, " ");
                    for (conflictidx = 0; conflictidx < conflictresults.size; conflictidx++) {
                        attachments[attachments.size] = conflictresults[conflictidx];
                    }
                    break;
                }
            }
            if (add) {
                filteredsize = filtered.size;
                filtered[filteredsize] = attachment;
            }
        }
        if (attachmentindex == attachments.size - 1) {
            attachmentkey = getnextarraykey(var_91bbf8d2294a656e, attachmentkey);
            if (isdefined(attachmentkey)) {
                attachments[attachments.size] = attachmentkey;
            }
        }
    }
    level.var_79b6f061be629059 = undefined;
    var_1168362b7eea93a9 = [];
    for (attachmentindex = 0; attachmentindex < filtered.size; attachmentindex++) {
        attachment = filtered[attachmentindex];
        if (attachment != "") {
            attachmentid = ter_op(isdefined(var_91bbf8d2294a656e[attachment]), var_91bbf8d2294a656e[attachment], 0);
            var_1168362b7eea93a9[attachment] = attachmentid;
        }
    }
    return var_1168362b7eea93a9;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2651
// Size: 0x4d7
function function_73948793bdd465e3(var_91bbf8d2294a656e, var_c7bd95b10c89cff8) {
    attachmentkey = getfirstarraykey(var_91bbf8d2294a656e);
    /#
        assertex(isdefined(attachmentkey), "attachmentToIdMap has no elements, possible error while reading table");
    #/
    attachments[0] = attachmentkey;
    var_13f5ce59fee67e25 = "";
    priorityattach = "";
    var_b93f2890063ccf4e = 0;
    basenamefound = 0;
    var_7002135dc405cb0 = [];
    var_d5d1e39edb18d983 = 0;
    for (attachmentindex = 0; attachmentindex < attachments.size; attachmentindex++) {
        attachment = attachments[attachmentindex];
        tempbasename = function_c7f2f8cd775a57f8(var_c7bd95b10c89cff8, attachments[attachmentindex]);
        if (tempbasename != "") {
            basenamefound = 1;
        }
        if (attachmentindex == attachments.size - 1) {
            attachmentkey = getnextarraykey(var_91bbf8d2294a656e, attachmentkey);
            if (isdefined(attachmentkey)) {
                attachments[attachments.size] = attachmentkey;
            }
        }
    }
    if (!basenamefound) {
        return var_91bbf8d2294a656e;
    }
    if (iskillstreakweapon(var_c7bd95b10c89cff8)) {
        weaponasset = var_c7bd95b10c89cff8;
    } else {
        rootname = getweaponrootname(var_c7bd95b10c89cff8);
        weaponasset = weaponassetnamemap(rootname);
    }
    foreach (id, a in attachments) {
        for (counter = attachments.size; counter > id + 1; counter--) {
            conflictstring = attachmentsconflict(a, attachments[counter - 1], var_c7bd95b10c89cff8, undefined, weaponasset);
            if (conflictstring == attachments[counter - 1]) {
                var_1b23d0f4ebcd81e2 = function_4add228b999c26aa(var_c7bd95b10c89cff8, conflictstring);
                aslot = function_4add228b999c26aa(var_c7bd95b10c89cff8, a);
                if (var_1b23d0f4ebcd81e2 == aslot) {
                    attachments[id] = conflictstring;
                    break;
                } else {
                    var_13f5ce59fee67e25 = a;
                    priorityattach = conflictstring;
                    var_d5d1e39edb18d983 = 1;
                }
            } else if (conflictstring == a) {
                var_13f5ce59fee67e25 = attachments[counter - 1];
                priorityattach = conflictstring;
                var_d5d1e39edb18d983 = 1;
            }
            if (var_d5d1e39edb18d983) {
                attachbasename = function_c7f2f8cd775a57f8(var_c7bd95b10c89cff8, var_13f5ce59fee67e25);
                var_40c072e303020c37 = function_4add228b999c26aa(var_c7bd95b10c89cff8, var_13f5ce59fee67e25);
                if (attachbasename != "") {
                    var_feaa04125d5c7ab2 = function_fa689aee146fbcf9(var_c7bd95b10c89cff8, attachbasename);
                    foreach (var_8f99d80bac78db05 in var_feaa04125d5c7ab2) {
                        var_7f067bf518e3b85f = attachmentsconflict(var_8f99d80bac78db05, priorityattach, var_c7bd95b10c89cff8, undefined, weaponasset);
                        if (var_7f067bf518e3b85f == priorityattach) {
                            continue;
                        }
                        if (var_7f067bf518e3b85f == var_13f5ce59fee67e25) {
                            continue;
                        }
                        var_7eb8fa9ea0957640 = function_4add228b999c26aa(var_c7bd95b10c89cff8, var_8f99d80bac78db05);
                        if (var_40c072e303020c37 == var_7eb8fa9ea0957640) {
                            foreach (id2, a2 in attachments) {
                                if (a2 == var_13f5ce59fee67e25) {
                                    var_b93f2890063ccf4e = id2;
                                }
                            }
                            attachments[var_b93f2890063ccf4e] = var_8f99d80bac78db05;
                            var_7002135dc405cb0[var_7002135dc405cb0.size] = var_8f99d80bac78db05;
                            var_d5d1e39edb18d983 = 0;
                            break;
                        }
                        var_d5d1e39edb18d983 = 0;
                    }
                }
            }
        }
    }
    var_1168362b7eea93a9 = [];
    for (attachmentindex = 0; attachmentindex < attachments.size; attachmentindex++) {
        var_74903b21bc06dfd7 = 0;
        attachment = attachments[attachmentindex];
        if (attachment != "") {
            foreach (a, id in var_91bbf8d2294a656e) {
                foreach (atwo in var_7002135dc405cb0) {
                    if (attachment == atwo) {
                        var_5adbca3b39ba22ea = function_4add228b999c26aa(var_c7bd95b10c89cff8, a);
                        var_df4becef128f8f21 = function_4add228b999c26aa(var_c7bd95b10c89cff8, atwo);
                        if (var_5adbca3b39ba22ea == var_df4becef128f8f21) {
                            if (id > 0) {
                                attachvariants = function_55db7a4374ed4b1b(var_c7bd95b10c89cff8, attachment);
                                if (attachvariants.size > 0) {
                                    var_1168362b7eea93a9[attachment] = id;
                                    var_74903b21bc06dfd7 = 1;
                                    break;
                                }
                                break;
                            }
                        }
                    }
                }
            }
            if (!var_74903b21bc06dfd7) {
                attachmentid = ter_op(isdefined(var_91bbf8d2294a656e[attachment]), var_91bbf8d2294a656e[attachment], 0);
                var_1168362b7eea93a9[attachment] = attachmentid;
            }
        }
    }
    return var_1168362b7eea93a9;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b30
// Size: 0x16d
function attachmentsconflict(attachment1, attachment2, weapon, slotschecked, weaponasset) {
    /#
        assertex(isdefined(weapon), "attachmentsConflict() passed undefined weapon");
    #/
    /#
        assertex(isdefined(attachment1) && isdefined(attachment1), "attachmentsConflict() passed undefined attachment");
    #/
    if (attachmentiscosmetic(attachment1) && attachmentiscosmetic(attachment2)) {
        return attachment1;
    }
    if (!isdefined(weaponasset)) {
        if (iskillstreakweapon(weapon)) {
            weaponasset = weapon;
        } else {
            rootname = getweaponrootname(weapon);
            weaponasset = weaponassetnamemap(rootname);
        }
    }
    if (!istrue(slotschecked)) {
        attachment1slot = function_4add228b999c26aa(weaponasset, attachment1);
        attachment2slot = function_4add228b999c26aa(weaponasset, attachment2);
        if (attachment1slot == attachment2slot && attachment1slot != "other") {
            var_9223f12f525a29bb = function_1dd1f56bc3d72b7e(weaponasset, attachment1);
            var_fe4a994289b5830a = function_1dd1f56bc3d72b7e(weaponasset, attachment2);
            if (var_9223f12f525a29bb >= var_fe4a994289b5830a) {
                return attachment1;
            } else {
                return attachment2;
            }
        }
    }
    var_27ccfb6c99bba30d = _attachmentblocks(weaponasset, attachment1, attachment2);
    var_b7b0b0d582725413 = _attachmentblocks(weaponasset, attachment2, attachment1);
    if (var_27ccfb6c99bba30d && var_b7b0b0d582725413) {
        return attachment1;
    } else if (var_27ccfb6c99bba30d) {
        return attachment1;
    } else if (var_b7b0b0d582725413) {
        return attachment2;
    }
    return "";
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca5
// Size: 0xd7
function function_b9f9c92ef7f1922b(attachment1, attachment2, weapon, weaponasset) {
    /#
        assertex(isdefined(weapon), "attachmentsConflict() passed undefined weapon");
    #/
    /#
        assertex(isdefined(attachment1) && isdefined(attachment1), "attachmentsConflict() passed undefined attachment");
    #/
    if (attachmentiscosmetic(attachment1) && attachmentiscosmetic(attachment2)) {
        return attachment1;
    }
    attachment1slot = function_4add228b999c26aa(weaponasset, attachment1);
    attachment2slot = function_4add228b999c26aa(weaponasset, attachment2);
    if (attachment1slot == attachment2slot && attachment1slot != "other") {
        var_9223f12f525a29bb = function_1dd1f56bc3d72b7e(weaponasset, attachment1);
        var_fe4a994289b5830a = function_1dd1f56bc3d72b7e(weaponasset, attachment2);
        if (var_9223f12f525a29bb >= var_fe4a994289b5830a) {
            return attachment1;
        } else {
            return attachment2;
        }
    }
    return "";
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d84
// Size: 0x19d
function private _attachmentblocks(weaponasset, attachment1, attachment2) {
    var_1fce8439ed13e7b3 = function_891b1fb6a51b97b0(weaponasset, attachment1);
    var_b28653df677fb727 = function_7c612ac92ba98dcb(weaponasset, attachment2);
    attachmentsblocked = function_e843253d046ad859(weaponasset, attachment1);
    foreach (basetype in var_1fce8439ed13e7b3) {
        if (basetype == var_b28653df677fb727) {
            return true;
        }
    }
    attachment1slot = function_4add228b999c26aa(weaponasset, attachment1);
    attachment2slot = function_4add228b999c26aa(weaponasset, attachment2);
    if (attachment1slot == attachment2slot && attachment1slot != "other") {
        return true;
    }
    slotsblocked = function_c6d15635447865c5(weaponasset, attachment1);
    foreach (slot in slotsblocked) {
        if (slot == attachment2slot) {
            return true;
        }
    }
    foreach (attachment in attachmentsblocked) {
        if (attachment == attachment2) {
            return true;
        }
    }
    return false;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f29
// Size: 0x17
function function_975e31b63f01fbcc(attachment) {
    return issubstr(attachment, "ironsdefault_");
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f48
// Size: 0x26
function function_de04e13ab01e1a10(attachment) {
    return issubstr(attachment, "ubshtgn") || issubstr(attachment, "ub_sh");
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f76
// Size: 0x40
function attachmentmap_tocategory(attachmentname) {
    /#
        assertex(isdefined(level.var_f83e21209be1b993), "attachmentMap_toCategory() called without first calling buildAttachmentMaps()");
    #/
    if (isdefined(level.var_f83e21209be1b993[attachmentname])) {
        return level.var_f83e21209be1b993[attachmentname];
    }
    return undefined;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fbe
// Size: 0xe2
function attachmentmap_toextra(attachmentname) {
    /#
        assertex(isdefined(level.var_50611d6541b815a3), "attachmentMap_toExtra() called without first calling buildAttachmentMaps()");
    #/
    if (isdefined(level.var_50611d6541b815a3[attachmentname])) {
        var_79b6f061be629059 = [];
        var_59bf6a1eae2b42d8 = level.var_50611d6541b815a3[attachmentname];
        foreach (entry in var_59bf6a1eae2b42d8) {
            if (!isdefined(entry.attachmentextra) || entry.attachmentextra == "") {
                continue;
            }
            var_79b6f061be629059[entry.attachmentextra] = entry.attachmentextra;
        }
        return var_79b6f061be629059;
    }
    return undefined;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30a7
// Size: 0x2e
function attachmentperkmap(weapon, attachmentname) {
    attachperks = function_4f344ec5b7c45a3f(weapon, attachmentname);
    if (isdefined(attachperks)) {
        return attachperks;
    }
    return undefined;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30dd
// Size: 0x2e6
function buildattachmentmaps() {
    /#
        assertex(!isdefined(level.var_50611d6541b815a3), "buildAttachmentMaps() called when base to extra map already existed.");
    #/
    /#
        assertex(!isdefined(level.weaponattachments), "buildAttachmentMaps() called when weapon attachment list already existed.");
    #/
    /#
        assertex(!isdefined(level.var_45bb5704bdfab245), "buildAttachmentMaps() called when weapon attachment map list already existed.");
    #/
    /#
        assertex(isdefined(level.weaponmapdata), "buildWeaponMap() should be called before buildAttachmentMaps()");
    #/
    level.var_50611d6541b815a3 = [];
    level.weaponattachments = [];
    function_c471a035d22df5eb();
    var_6df1fdd78eb73a36 = [];
    foreach (slot in level.var_c7008cff883cd615) {
        if (slot == "visual") {
            continue;
        }
        var_6df1fdd78eb73a36[var_6df1fdd78eb73a36.size] = slot;
    }
    foreach (weaponnamekey in level.weaponmapdata) {
        if (isdefined(weaponnamekey.assetname) && isdefined(weaponnamekey.group)) {
            foreach (slot in var_6df1fdd78eb73a36) {
                var_63a235c3e361a6c3 = function_75b035199842693d(weaponnamekey.assetname, slot, 1);
                if (isdefined(var_63a235c3e361a6c3)) {
                    foreach (attachment in var_63a235c3e361a6c3) {
                        attachmentdataname = function_d3831c58b9d05ac2(weaponnamekey.assetname, attachment);
                        if (isdefined(attachmentdataname)) {
                            lootid = getscriptbundlefieldvalue(attachmentdataname, #"lootid");
                            category = getscriptbundlefieldvalue(attachmentdataname, #"category");
                            var_903ba58b5abb6cc2 = getscriptbundlefieldvalue(attachmentdataname, #"hash_febd8701371cdffe");
                            if (isdefined(lootid)) {
                                if (isdefined(level.weaponattachments[attachment])) {
                                    continue;
                                }
                                if (isdefined(var_903ba58b5abb6cc2) && var_903ba58b5abb6cc2.size > 0) {
                                    if (!isdefined(level.var_50611d6541b815a3[attachment])) {
                                        level.var_50611d6541b815a3[attachment] = var_903ba58b5abb6cc2;
                                    }
                                }
                                if (isdefined(category) && category != "NONE" && !isdefined(level.weaponattachments[attachment])) {
                                    level.weaponattachments[attachment] = lootid;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ca
// Size: 0x194
function weaponattachremoveextraattachments(attachments) {
    /#
        assertex(isdefined(level.var_50611d6541b815a3), "weaponAttachRemoveExtraAttachments() called without first calling buildWeaponMap().");
    #/
    var_59bf6a1eae2b42d8 = [];
    foreach (attachment in attachments) {
        var_f08eec5e41ed914f = attachmentmap_toextra(attachment);
        if (isdefined(var_f08eec5e41ed914f)) {
            var_59bf6a1eae2b42d8[var_59bf6a1eae2b42d8.size] = var_f08eec5e41ed914f;
        }
    }
    attachmentsfiltered = [];
    foreach (attachment in attachments) {
        var_22cc204990bc10a0 = 0;
        foreach (var_79b6f061be629059 in var_59bf6a1eae2b42d8) {
            foreach (extraattach in var_79b6f061be629059) {
                if (attachment == extraattach) {
                    var_22cc204990bc10a0 = 1;
                    break;
                }
            }
        }
        if (!var_22cc204990bc10a0) {
            attachmentsfiltered[attachmentsfiltered.size] = attachment;
        }
    }
    return attachmentsfiltered;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3566
// Size: 0x36
function function_693e108cb61ceeb5(weaponname, attachref) {
    if (isdefined(level.weaponattachments[attachref])) {
        return level.weaponattachments[attachref];
    }
    return namespace_38b993c4618e76cd::getlootidfromref(attachref);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35a4
// Size: 0xa4
function buildweaponrootlist() {
    rootweapons = [];
    foreach (weapon, data in level.weaponmapdata) {
        if (isdefined(data.group)) {
            if (!issubstr(data.group, "weapon_")) {
                continue;
            }
            if (data.group == "weapon_other") {
                continue;
            }
            rootweapons[rootweapons.size] = weapon;
        }
    }
    return rootweapons;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3650
// Size: 0xfa
function weaponattachcustomtoidmap(weaponroot, variantid) {
    /#
        assertex(isdefined(level.weaponmapdata), "weaponAttachCustomToIDMap() called without first calling buildWeaponMap().");
    #/
    /#
        assertex(isdefined(variantid), "weaponAttachCustomToIDMap() called without a variantID. Only blueprint weapons have custom attachments.");
    #/
    if (isdefined(variantid) && variantid >= 0) {
        var_928c1cac31ea99e5 = weaponroot + "|" + variantid;
        if (getdvar(@"hash_7bc90c105eebbcca", "1") == "1") {
            if (isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5]) && isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5].attachdefaulttoidmap)) {
                return level.weaponlootmapdata[var_928c1cac31ea99e5].attachdefaulttoidmap;
            }
        } else if (isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5]) && isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5].attachcustomtoidmap)) {
            return level.weaponlootmapdata[var_928c1cac31ea99e5].attachcustomtoidmap;
        }
    }
    return undefined;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3752
// Size: 0xa7
function weaponattachdefaulttoidmap(weaponroot, variantid, attachments) {
    /#
        assertex(isdefined(level.weaponmapdata), "weaponAttachDefaultToIDMap() called without first calling buildWeaponMap().");
    #/
    if (isdefined(variantid)) {
        var_928c1cac31ea99e5 = weaponroot + "|" + variantid;
        if (isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5]) && isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5].attachdefaulttoidmap)) {
            return level.weaponlootmapdata[var_928c1cac31ea99e5].attachdefaulttoidmap;
        }
    }
    attachdefaulttoidmap = function_792bacb194f6f862(weaponroot, attachments);
    if (isdefined(attachdefaulttoidmap)) {
        return attachdefaulttoidmap;
    }
    return undefined;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3801
// Size: 0xc8
function weaponassetnamemap(weaponroot, variantid) {
    if (iskillstreakweapon(weaponroot)) {
        return weaponroot;
    }
    if (isdefined(variantid)) {
        var_b40b03d6bdc699b3 = weaponroot + "|" + variantid;
        if (isdefined(level.weaponlootmapdata[var_b40b03d6bdc699b3]) && isdefined(level.weaponlootmapdata[var_b40b03d6bdc699b3].assetoverridename)) {
            return level.weaponlootmapdata[var_b40b03d6bdc699b3].assetoverridename;
        }
    }
    if (isdefined(level.weaponmapdata[weaponroot]) && isdefined(level.weaponmapdata[weaponroot].assetname)) {
        return level.weaponmapdata[weaponroot].assetname;
    }
    /#
        assertmsg("weaponAssetNameMap() could not find an asset name for weapon " + weaponroot);
    #/
    return weaponroot;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38d1
// Size: 0x4a
function weapongroupmap(weaponroot) {
    /#
        assertex(isdefined(level.weaponmapdata), "weaponGroupMap() called without first calling buildWeaponMap().");
    #/
    if (isdefined(level.weaponmapdata[weaponroot])) {
        return level.weaponmapdata[weaponroot].group;
    }
    return undefined;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3923
// Size: 0x30
function function_89497fa763d431c0(weaponroot) {
    /#
        assertex(isdefined(level.weaponmapdata), "weaponNumberMap() called without first calling buildWeaponMap().");
    #/
    return isdefined(level.weaponmapdata[weaponroot]);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x395b
// Size: 0x9e
function attachmentmap_extratovariantid(attachment, weaponroot, var_fedb77aad2340743) {
    /#
        assertex(isdefined(var_fedb77aad2340743), "");
    #/
    var_b40b03d6bdc699b3 = weaponroot + "|" + var_fedb77aad2340743;
    if (isdefined(level.weaponlootmapdata[var_b40b03d6bdc699b3]) && isdefined(level.weaponlootmapdata[var_b40b03d6bdc699b3].attachdefaulttoidmap) && isdefined(level.weaponlootmapdata[var_b40b03d6bdc699b3].attachdefaulttoidmap[attachment])) {
        return level.weaponlootmapdata[var_b40b03d6bdc699b3].attachdefaulttoidmap[attachment];
    }
    return 0;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a01
// Size: 0x6df
function buildweaponmap() {
    /#
        assertex(!isdefined(level.weaponmapdata), "buildWeaponMap() called when map already existed.");
    #/
    level.weaponmapdata = [];
    level.weapongroupdata = [];
    level.weaponlootmapdata = [];
    weaponsscriptbundle = namespace_e0ee43ef2dddadaa::function_a221d76594ef4e8b();
    if (isdefined(weaponsscriptbundle)) {
        foreach (weaponname in weaponsscriptbundle) {
            weaponscriptbundle = namespace_e0ee43ef2dddadaa::function_8477d8595e0364a7(weaponname, [#"ref", #"group", #"displayorder", #"asset", #"name", #"perk", #"speedscale", #"hash_1469d2b702a6d5f8", #"lootid", #"botpersonality", #"hash_119f70b4890befd"]);
            weapon = weaponscriptbundle.ref;
            var_7360aef3491dffc2 = weaponscriptbundle.asset;
            if (weapon != "" && weaponexists(var_7360aef3491dffc2) && !isnullweapon(makeweaponfromstring(var_7360aef3491dffc2))) {
                level.weaponmapdata[weapon] = spawnstruct();
                group = weaponscriptbundle.group;
                if (isdefined(group) && group != "") {
                    level.weaponmapdata[weapon].group = group;
                    var_e3155b636cba8eb9 = default_to(weaponscriptbundle.displayorder, 0);
                    if (isdefined(var_e3155b636cba8eb9) && var_e3155b636cba8eb9 > -1) {
                        if (!isdefined(level.weapongroupdata[group])) {
                            level.weapongroupdata[group] = [];
                        }
                        level.weapongroupdata[group][level.weapongroupdata[group].size] = weapon;
                    } else {
                        level.weaponmapdata[weapon].uihidden = 1;
                    }
                }
                assetname = weaponscriptbundle.asset;
                if (isdefined(assetname) && assetname != "") {
                    level.weaponmapdata[weapon].assetname = assetname;
                }
                locname = weaponscriptbundle.name;
                if (isdefined(locname) && locname != "") {
                    level.weaponmapdata[weapon].locname = locname;
                }
                perk = weaponscriptbundle.perk;
                if (isdefined(perk) && perk != "") {
                    level.weaponmapdata[weapon].perk = perk;
                }
                level.weaponmapdata[weapon].weaponlootid = weaponscriptbundle.lootid;
                movespeed = weaponscriptbundle.speedscale;
                if (isdefined(movespeed)) {
                    level.weaponmapdata[weapon].speed = movespeed;
                    /#
                        assertex(isdefined(movespeed) && movespeed > 0 && movespeed <= 1, "buildWeaponMap() found invalid movespeed for weapon: " + weapon);
                    #/
                }
                var_d43f9c4f6b647ba4 = weaponscriptbundle.var_d43f9c4f6b647ba4;
                if (isdefined(var_d43f9c4f6b647ba4)) {
                    level.weaponmapdata[weapon].var_d43f9c4f6b647ba4 = var_d43f9c4f6b647ba4;
                }
                var_e56bf18451002522 = weaponscriptbundle.botpersonality;
                if (isdefined(var_e56bf18451002522)) {
                    level.weaponmapdata[weapon].var_e56bf18451002522 = strtok(var_e56bf18451002522, "|");
                }
                var_b883cc44c69244ca = weaponscriptbundle.var_eba498255a3e0031;
                if (isdefined(var_b883cc44c69244ca)) {
                    level.weaponmapdata[weapon].var_b883cc44c69244ca = var_b883cc44c69244ca;
                }
                if (function_56f6e04546b058f7(weapon)) {
                    level.weaponmapdata[weapon].var_56f6e04546b058f7 = 1;
                }
                if (isdefined(level.weaponmapdata[weapon].group) && (!isdefined(level.weaponmapdata[weapon].uihidden) || isdefined(level.gametype) && level.gametype == "br") || isdefined(level.weaponmapdata[weapon]) && istrue(level.weaponmapdata[weapon].var_56f6e04546b058f7)) {
                    var_1092bc40c58c1c9a = 0;
                    var_928c1cac31ea99e5 = weapon + "|" + var_1092bc40c58c1c9a;
                    level.weaponlootmapdata[var_928c1cac31ea99e5] = spawnstruct();
                    level.weaponlootmapdata[var_928c1cac31ea99e5].variantid = var_1092bc40c58c1c9a;
                    level.weaponlootmapdata[var_928c1cac31ea99e5].lootid = weaponscriptbundle.lootid;
                    attachdefaulttoidmap = function_792bacb194f6f862(weapon);
                    if (isdefined(attachdefaulttoidmap)) {
                        level.weaponlootmapdata[var_928c1cac31ea99e5].attachdefaulttoidmap = attachdefaulttoidmap;
                    }
                    weaponblueprints = function_bb92a5000082832a(level.weaponmapdata[weapon].assetname);
                    if (isdefined(weaponblueprints)) {
                        foreach (weaponvariant, var_fedb77aad2340743 in weaponblueprints) {
                            var_928c1cac31ea99e5 = weapon + "|" + var_fedb77aad2340743;
                            level.weaponlootmapdata[var_928c1cac31ea99e5] = spawnstruct();
                            level.weaponlootmapdata[var_928c1cac31ea99e5].variantid = var_fedb77aad2340743;
                            blueprintbundle = function_332b73d2eca8c367(level.weaponmapdata[weapon].assetname, weaponvariant);
                            level.weaponlootmapdata[var_928c1cac31ea99e5].lootid = blueprintbundle.lootid;
                            level.weaponlootmapdata[var_928c1cac31ea99e5].weaponcooldown = blueprintbundle.var_2da3d71eb40ea685;
                            attachdefaulttoidmap = function_3211981142ec5aee(level.weaponmapdata[weapon].assetname, weaponvariant);
                            if (isdefined(attachdefaulttoidmap)) {
                                level.weaponlootmapdata[var_928c1cac31ea99e5].attachdefaulttoidmap = attachdefaulttoidmap;
                            }
                        }
                    }
                }
            }
        }
    }
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40e7
// Size: 0x287
function function_ee4a536a155313b7() {
    /#
        assertex(!isdefined(level.var_305637ed4e3e8513), "buildProgressionCamosMap() called when map already existed.");
    #/
    level.var_305637ed4e3e8513 = [];
    var_4e536400fecd2a19 = getscriptbundle(hashcat(%"hash_752ed0204d7db62c", level.gamemodebundle.var_e549d47c964a6cad));
    foreach (camoname in var_4e536400fecd2a19.camo_list) {
        if (!isdefined(camoname.camodata)) {
            continue;
        }
        category = getscriptbundlefieldvalue(hashcat(%"hash_1345cc24140e89b8", camoname.camodata), #"camocategory");
        if (isdefined(category) && category == "camo_category_completion") {
            camoref = getscriptbundlefieldvalue(hashcat(%"hash_1345cc24140e89b8", camoname.camodata), #"ref");
            weaponref = getscriptbundlefieldvalue(hashcat(%"hash_1345cc24140e89b8", camoname.camodata), #"weaponref");
            lootid = getscriptbundlefieldvalue(hashcat(%"hash_1345cc24140e89b8", camoname.camodata), #"lootid");
            if (isdefined(weaponref)) {
                if (!isdefined(level.var_305637ed4e3e8513[weaponref])) {
                    level.var_305637ed4e3e8513[weaponref] = [];
                }
                level.var_305637ed4e3e8513[weaponref][camoref] = lootid;
            }
            continue;
        }
        if (isdefined(category) && category == "camo_category_events") {
            camoref = getscriptbundlefieldvalue(hashcat(%"hash_1345cc24140e89b8", camoname.camodata), #"ref");
            weaponclass = getscriptbundlefieldvalue(hashcat(%"hash_1345cc24140e89b8", camoname.camodata), #"weaponclass");
            lootid = getscriptbundlefieldvalue(hashcat(%"hash_1345cc24140e89b8", camoname.camodata), #"lootid");
            if (isdefined(weaponclass)) {
                if (!isdefined(level.var_305637ed4e3e8513[weaponclass])) {
                    level.var_305637ed4e3e8513[weaponclass] = [];
                }
                level.var_305637ed4e3e8513[weaponclass][camoref] = lootid;
            }
        }
    }
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4375
// Size: 0x62
function getweaponvarianttablename(var_49e6ef3edadd524e) {
    if (string_starts_with(var_49e6ef3edadd524e, "jup_") || string_starts_with(var_49e6ef3edadd524e, "iw8_") || string_starts_with(var_49e6ef3edadd524e, "iw9_") || string_starts_with(var_49e6ef3edadd524e, "t10_")) {
        var_49e6ef3edadd524e = getsubstr(var_49e6ef3edadd524e, 4);
    }
    return "mp/gunsmith/" + var_49e6ef3edadd524e + "_variants.csv";
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43df
// Size: 0x80
function function_d7f1989d63343007(var_c7bd95b10c89cff8, attachments) {
    if (isdefined(attachments)) {
        var_15d209d47ba8a8a6 = alphabetize(attachments);
        for (attachmentindex = 0; attachmentindex < var_15d209d47ba8a8a6.size; attachmentindex++) {
            attachment = var_15d209d47ba8a8a6[attachmentindex];
            if (attachment != "none" && (attachmentindex == 0 || attachment != var_15d209d47ba8a8a6[attachmentindex - 1])) {
                var_c7bd95b10c89cff8 = var_c7bd95b10c89cff8 + "+" + attachment;
            }
        }
    }
    return function_6527364c1ecca6c6(var_c7bd95b10c89cff8);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4467
// Size: 0xaa
function function_792bacb194f6f862(weapon, attachments) {
    assetname = function_72376783a92be46(weapon);
    if (!isdefined(assetname)) {
        assetname = weapon;
    }
    var_51dbe1a1c3d8bf04 = function_d7f1989d63343007(assetname, attachments);
    if (isdefined(var_51dbe1a1c3d8bf04) && var_51dbe1a1c3d8bf04.size > 0) {
        var_f957368a964a7504 = [];
        foreach (defaultattachment in var_51dbe1a1c3d8bf04) {
            var_f957368a964a7504[defaultattachment] = 0;
        }
        return var_f957368a964a7504;
    }
    return undefined;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4519
// Size: 0xb9
function parseattachdefaulttoidmap(attachmentdefaults) {
    if (attachmentdefaults != "") {
        defaultkvps = strtok(attachmentdefaults, " ");
        var_f957368a964a7504 = [];
        foreach (kvp in defaultkvps) {
            pair = strtok(kvp, "|");
            if (pair.size == 2) {
                var_f957368a964a7504[pair[0]] = int(pair[1]);
                continue;
            }
            var_f957368a964a7504[pair[0]] = 0;
        }
        return var_f957368a964a7504;
    }
    return undefined;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45da
// Size: 0x4c
function function_72376783a92be46(rootname) {
    if (isdefined(level.weaponmapdata[rootname]) && isdefined(level.weaponmapdata[rootname].assetname)) {
        return level.weaponmapdata[rootname].assetname;
    }
    return undefined;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x462e
// Size: 0x356
function getweaponrootname(weapon) {
    if (!isdefined(weapon)) {
        return "";
    }
    if (!isdefined(level.weaponrootcache)) {
        level.weaponrootcache = [];
        level.weaponrootcache["iw9_lm_dblmg_jup_sp_v1"] = "iw9_lm_dblmg_jup";
        level.weaponrootcache["iw9_lm_dblmg_jup_mp"] = "iw9_lm_dblmg_jup";
        level.weaponrootcache["iw9_lm_dblmg_jup"] = "iw9_lm_dblmg_jup";
        level.weaponrootcache["jup_iw9_me_sword01_v101"] = "iw9_me_sword01";
        level.weaponrootcache["jup_iw9_me_sword01_v2044"] = "iw9_me_sword01";
        level.weaponrootcache["jup_iw9_me_sword01_v2093"] = "iw9_me_sword01";
        level.weaponrootcache["jup_iw9_me_tonfa_v2045"] = "iw9_me_tonfa";
        level.weaponrootcache["jup_p38_dm_crossbow_v2028"] = "iw9_dm_crossbow";
        classtokens = ["ar", "sm", "lm", "sh", "sn", "dm", "pi", "la", "me", "br"];
        level.classtokens = [];
        foreach (t in classtokens) {
            level.classtokens[t] = 1;
        }
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        /#
            assert(isstring(weapon));
        #/
        weaponname = weapon;
    }
    if (!isdefined(weaponname)) {
        weaponname = "";
    }
    cachedvalue = level.weaponrootcache[weaponname];
    if (isdefined(cachedvalue)) {
        return cachedvalue;
    }
    originalname = weaponname;
    tokens = strtok(weaponname, "_");
    toksize = tokens.size;
    if (toksize == 0) {
        return "";
    }
    index = 0;
    if (tokens[0] == "alt") {
        index++;
    }
    starttok = tokens[index];
    if (starttok == "jup" || starttok == "iw9" || starttok == "iw8" || starttok == "t10") {
        if (starttok == "jup" && toksize >= index + 4 && isdefined(level.classtokens[tokens[index + 2]])) {
            weaponname = function_32bbe5b5c454a061("_", tokens, index, 4);
        } else if (toksize >= index + 3 && isdefined(level.classtokens[tokens[index + 1]])) {
            if (toksize >= index + 4 && starttok == "t10" || tokens[index + 2] == "zombie") {
                weaponname = function_32bbe5b5c454a061("_", tokens, index, 4);
            } else {
                weaponname = function_32bbe5b5c454a061("_", tokens, index, 3);
            }
        } else {
            weaponname = function_32bbe5b5c454a061("_", tokens, index, 2);
        }
    }
    level.weaponrootcache[originalname] = weaponname;
    return weaponname;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x498c
// Size: 0x136
function getweaponclasstoken(weaponname) {
    /#
        assert(isstring(weaponname));
    #/
    weaponclasstokens[0] = strtok(weaponname, "_")[1];
    weaponclasstokens[1] = strtok(weaponname, "_")[2];
    foreach (potentialtoken in weaponclasstokens) {
        if (!isdefined(potentialtoken)) {
            continue;
        }
        switch (potentialtoken) {
        case #"hash_fa0ed9f6bd4f4e9a":
        case #"hash_fa18d2f6bd57925a":
        case #"hash_fa21c4f6bd5e3815":
        case #"hash_fa24ddf6bd609e07":
        case #"hash_fa27b9f6bd62a3f2":
        case #"hash_fa27bdf6bd62aa3e":
        case #"hash_fa37b6f6bd6f6b2c":
        case #"hash_fa4dbdf6bd80bf52":
        case #"hash_fa50b4f6bd82efbe":
        case #"hash_fa50b6f6bd82f2e4":
        case #"hash_fa50b9f6bd82f79d":
            return potentialtoken;
        }
    }
    /#
        assertmsg("getWeaponClassToken: Could not parse a valid weapon class token from weapon: " + weaponname);
    #/
    return undefined;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aca
// Size: 0x1d
function attachmentiscosmetic(attachment) {
    return isdefined(attachment) && isstartstr(attachment, "cos_");
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4aef
// Size: 0x1b
function issilencerattach(weapon, attachment) {
    return function_1074e46972c88a69(weapon, attachment);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b12
// Size: 0xb2
function combinedefaultandcustomattachmentidmaps(var_3f065af353909441, var_91bbf8d2294a656e) {
    combined = [];
    foreach (key, value in var_3f065af353909441) {
        if (array_contains_key(var_91bbf8d2294a656e, key)) {
            continue;
        }
        combined[key] = value;
    }
    foreach (key, value in var_91bbf8d2294a656e) {
        combined[key] = value;
    }
    return combined;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bcc
// Size: 0x1e3
function filterinvalidattachmentsfromidmap(var_f44f790efdadeea0, var_c7bd95b10c89cff8, weaponobj) {
    var_3aa0e5fbca9e041c = [];
    foreach (attachment, attachmentid in var_f44f790efdadeea0) {
        if (weaponobj canuseattachment(attachment)) {
            var_3aa0e5fbca9e041c[attachment] = attachmentid;
            continue;
        }
        /#
            thread invalidattachmentwarning(attachment, var_c7bd95b10c89cff8);
            println("underbarrel" + var_c7bd95b10c89cff8 + "<unknown string>");
            attachmentslots = ["<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>"];
            foreach (attachmentslot in attachmentslots) {
                println("<unknown string>" + attachmentslot);
                attachmentsavailable = function_75b035199842693d(var_c7bd95b10c89cff8, attachmentslot);
                foreach (attachment in attachmentsavailable) {
                    println("<unknown string>" + attachment);
                }
            }
        #/
    }
    return var_3aa0e5fbca9e041c;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4db7
// Size: 0x7d
function invalidattachmentwarning(attachment, var_c7bd95b10c89cff8) {
    /#
        message = "<unknown string>" + attachment + "<unknown string>" + var_c7bd95b10c89cff8;
        if (isdefined(self) && isplayer(self)) {
            if (getdvarint(@"hash_ff689af941dd10a1", 0) == 1) {
                iprintlnbold(message);
            } else {
                iprintlnbold(message);
            }
        }
        println("<unknown string>" + message);
        /#
            assertmsg(message);
        #/
    #/
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e3b
// Size: 0xff
function weaponsupportslaserir(weaponbasename, weaponobj) {
    switch (weaponbasename) {
    case #"hash_ad9dd8204eeeec9":
    case #"hash_105072c3c4229775":
    case #"hash_1ee4b4461a10e3f1":
    case #"hash_7b2c4b25882fbf2f":
    case #"hash_ca6072c8c1ca083f":
    case #"hash_decd8473cdd1b5a9":
    case #"hash_fcd329558a1aa65a":
        return false;
    }
    if (iskillstreakweapon(weaponbasename)) {
        return false;
    }
    if (isdefined(weaponobj) && isdefined(weaponobj.extra) && isdefined(weaponobj.variantid) && weaponobj.extra == "charlie725_doom_blueprint_tuning") {
        return false;
    }
    class = weaponclass(weaponbasename);
    return class == "rifle" || class == "mg" || class == "sniper" || class == "smg" || class == "spread";
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f42
// Size: 0x76
function iskillstreakplayerweapon(weapon) {
    killstreakplayerweapon = 0;
    weapname = undefined;
    if (isweapon(weapon)) {
        weapname = weapon.basename;
    } else {
        weapname = function_72376783a92be46(weapon);
        if (!isdefined(weapname)) {
            weapname = weapon;
        }
    }
    if (issubstr(weapname, "_mp")) {
        if (iskillstreakweapon(weapname) && isminigunweapon(weapname)) {
            killstreakplayerweapon = 1;
        }
    }
    return killstreakplayerweapon;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fc0
// Size: 0x80
function function_417760651c48814b(weapon) {
    if (!isdefined(weapon)) {
        /#
            assertmsg("Weapon.gsc - isSuperUseWeapon was passed an undefined weapon name");
        #/
        return 0;
    }
    if (!isstring(weapon)) {
        weapon = weapon.basename;
    }
    switch (weapon) {
    case #"hash_b742b20d3ace6197":
    case #"hash_db7c88dcdb203deb":
        return 1;
    }
    if (isdefined(level.superglobals)) {
        return isdefined(level.superglobals.superweapons[weapon]);
    }
    return 0;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5048
// Size: 0x94
function function_6c51b05ce2e9aed3(weapon) {
    if (!isdefined(weapon)) {
        /#
            assertmsg("Weapon.gsc - isSuperGestureWeapon was passed an undefined weapon name");
        #/
        return false;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = function_72376783a92be46(weapon);
        if (!isdefined(weaponname)) {
            weaponname = weapon;
        }
    }
    switch (weaponname) {
    case #"hash_4cdc20240e59faaf":
    case #"hash_ca1eabc559246db2":
    case #"hash_cfc84b38b4da467b":
    case #"hash_f4312df166bd9791":
        return true;
    }
    return false;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x50e4
// Size: 0x72
function function_3de73a849ecea0d(weapon) {
    if (!isdefined(weapon)) {
        /#
            assertmsg("Weapon.gsc - isOxygenMaskWeapon was passed an undefined weapon name");
        #/
        return false;
    }
    weapname = undefined;
    if (isweapon(weapon)) {
        if (isnullweapon(weapon)) {
            return false;
        }
        weapname = weapon.basename;
    } else {
        if (weapon == "none") {
            return false;
        }
        weapname = weapon;
    }
    return weapname == "iw9_oxygenmask" || weapname == "iw9_oxygenmask_mp";
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x515e
// Size: 0x9e
function isminigunweapon(weapon) {
    if (!isdefined(weapon)) {
        /#
            assertmsg("Weapon.gsc - isMinigunWeapon cwas passed an undefined weapon name");
        #/
        return false;
    }
    weapname = undefined;
    if (isweapon(weapon)) {
        if (isnullweapon(weapon)) {
            return false;
        }
        weapname = weapon.basename;
    } else {
        if (weapon == "none") {
            return false;
        }
        weapname = weapon;
    }
    return weapname == "iw9_minigunksjugg_mp" || weapname == "iw9_minigunksjugg_reload_mp" || weapname == "iw8_lm_dblmg_mp" || weapname == "iw9_lm_dblmg_mp" || weapname == "iw9_lm_dblmg2_cp" || weapname == "iw9_lm_dblmg_jup_mp";
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5204
// Size: 0x78
function iskillstreakweapon(weapon) {
    if (!isdefined(weapon)) {
        /#
            assertmsg("Weapon.gsc - isKillstreakWeapon was passed an undefined weapon name");
        #/
        return false;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = function_72376783a92be46(weapon);
        if (!isdefined(weaponname)) {
            weaponname = weapon;
        }
    }
    if (isdefined(level.killstreakweaponmap) && isdefined(level.killstreakweaponmap[weaponname])) {
        return true;
    }
    return false;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5284
// Size: 0x38
function function_f30b8f5ee8f3e7f8(streakname, var_d8a64ed9bcdf7185) {
    if (!isdefined(level.killstreakweaponmap)) {
        level.killstreakweaponmap = [];
    }
    level.killstreakweaponmap[var_d8a64ed9bcdf7185] = streakname;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52c3
// Size: 0x473
function function_b4b623b6321cd521() {
    if (!isdefined(level.killstreakweaponmap)) {
        level.killstreakweaponmap = [];
    }
    level.killstreakweaponmap["tacops_beacon_mp"] = "marker";
    level.killstreakweaponmap["radar_drone_proj_mp"] = "radar_drone_recon";
    level.killstreakweaponmap["gunship_105mm_mp"] = "gunship";
    level.killstreakweaponmap["manual_turret_mp"] = "manual_turret";
    level.killstreakweaponmap["nuke_mp"] = "nuke";
    level.killstreakweaponmap["artillery_mp"] = "precision_airstrike";
    level.killstreakweaponmap["iw9_spotter_scope_mp"] = "precision_airstrike";
    level.killstreakweaponmap["deploy_airdrop_mp"] = "airdrop";
    level.killstreakweaponmap["deploy_airdrop_sticky_mp"] = "airdrop";
    level.killstreakweaponmap["nuke_multi_mp"] = "nuke_multi";
    level.killstreakweaponmap["cruise_proj_mp"] = "cruise_predator";
    level.killstreakweaponmap["pac_sentry_turret_mp"] = "pac_sentry";
    level.killstreakweaponmap["toma_proj_mp"] = "toma_strike";
    level.killstreakweaponmap["iw9_laser_large_ir_mp"] = "toma_strike";
    level.killstreakweaponmap["chopper_gunner_turret_mp"] = "chopper_gunner";
    level.killstreakweaponmap["chopper_gunner_proj_mp"] = "chopper_gunner";
    level.killstreakweaponmap["chopper_gunner_turret_cp"] = "chopper_gunner";
    level.killstreakweaponmap["chopper_gunner_proj_cp"] = "chopper_gunner";
    level.killstreakweaponmap["gunship_25mm_mp"] = "gunship";
    level.killstreakweaponmap["gunship_40mm_mp"] = "gunship";
    level.killstreakweaponmap["gunship_hellfire_mp"] = "gunship";
    level.killstreakweaponmap["fuelstrike_proj_mp"] = "fuel_airstrike";
    level.killstreakweaponmap["chopper_support_turret_mp"] = "chopper_support";
    level.killstreakweaponmap["chopper_support_turret_br"] = "chopper_support";
    level.killstreakweaponmap["deploy_sentry_mp"] = "sentry_gun";
    level.killstreakweaponmap["sentry_turret_mp"] = "sentry_gun";
    level.killstreakweaponmap["hover_jet_turret_mp"] = "hover_jet";
    level.killstreakweaponmap["hover_jet_proj_mp"] = "hover_jet";
    level.killstreakweaponmap["hover_jet_bomb_mp"] = "hover_jet";
    level.killstreakweaponmap["iw9_minigunksjugg_mp"] = "juggernaut";
    level.killstreakweaponmap["iw9_minigunksjugg_reload_mp"] = "juggernaut";
    level.killstreakweaponmap["deploy_juggernaut_mp"] = "juggernaut";
    level.killstreakweaponmap["assault_drone_mp"] = "assault_drone";
    level.killstreakweaponmap["assault_drone_danger_mp"] = "assault_drone";
    level.killstreakweaponmap["auto_drone_proj_mp"] = "auto_drone";
    level.killstreakweaponmap["airdrop_escort_turret_mp"] = "airdrop_escort";
    level.killstreakweaponmap["super_laser_charge_mp"] = "super_laser_charge";
    level.killstreakweaponmap["electric_discharge_mp"] = "super_electric_discharge";
    level.killstreakweaponmap["high_jump_mp"] = "super_high_jump";
    level.killstreakweaponmap["airdrop_escort_turret_ballistics_mp"] = "airdrop_escort";
    level.killstreakweaponmap["chopper_gunner_turret_ballistics_mp"] = "chopper_gunner";
    level.killstreakweaponmap["hover_jet_turret_ballistics_mp"] = "hover_jet";
    level.killstreakweaponmap["switchblade_drone_mp"] = "switchblade_drone";
    level.killstreakweaponmap["lrad_mp"] = "lrad";
    level.killstreakweaponmap["deploy_remote_turret_mp"] = "remote_turret";
    level.killstreakweaponmap["remote_turret_mp"] = "remote_turret";
    level.killstreakweaponmap["loitering_munition_proj_mp"] = "loitering_munition";
    level.killstreakweaponmap["deploy_missileturret_jup_mp"] = "missile_turret";
    level.killstreakweaponmap["missile_turret_proj_jup_mp"] = "missile_turret";
    level.killstreakweaponmap["drone_swarm_drone_mp"] = "drone_swarm";
    level.killstreakweaponmap["toma_proj_jup_mp"] = "toma_strike";
    level.killstreakweaponmap["jup_deploy_sentry_ob"] = "sentry_gun";
    level.killstreakweaponmap["cluster_spike_jup_ob"] = "cluster_spike";
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x573d
// Size: 0xa5
function function_1a9394eb58e66a9b(weapon) {
    if (!isdefined(weapon)) {
        /#
            assertmsg("Weapon.gsc - isFakeKillstreakWeapon was passed an undefined weapon name");
        #/
        return false;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = function_72376783a92be46(weapon);
        if (!isdefined(weaponname)) {
            weaponname = weapon;
        }
    }
    if (isdefined(level.killstreakweaponmap) && isdefined(level.killstreakweaponmap[weaponname])) {
        switch (weaponname) {
        case #"hash_10480ca9423043c7":
        case #"hash_4cdc20240e59faaf":
        case #"hash_9acbd2b1e30a8e0e":
            return true;
        }
    }
    return false;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57ea
// Size: 0x38
function function_eac07882d12979d8(baseweaponname, subweaponname) {
    if (!isdefined(level.var_64f3f18c47a2eed9)) {
        level.var_64f3f18c47a2eed9 = [];
    }
    level.var_64f3f18c47a2eed9[subweaponname] = baseweaponname;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5829
// Size: 0x26
function function_23defc57f8da7fbc(subweaponname) {
    if (isdefined(level.var_64f3f18c47a2eed9)) {
        return level.var_64f3f18c47a2eed9[subweaponname];
    }
    return undefined;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5857
// Size: 0x5a
function function_aea26b825f926e9c(weapon, attachmentname) {
    if (attachmentname == "none") {
        return 1;
    }
    if (!isdefined(weapon) || !isdefined(attachmentname)) {
        return 0;
    }
    if (isstring(weapon)) {
        rootname = getweaponrootname(weapon);
        weapon = weaponassetnamemap(rootname);
    }
    return function_d4927cf775ff6aec(weapon, attachmentname);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b9
// Size: 0x65
function function_6e7bc1b23afa0ea8(weapon, var_10dc579c373a93dd) {
    if (namespace_e0ee43ef2dddadaa::function_aea26b825f926e9c(weapon, var_10dc579c373a93dd)) {
        return var_10dc579c373a93dd;
    }
    /#
        println("<unknown string>" + var_10dc579c373a93dd);
    #/
    rootname = getweaponrootname(weapon);
    weaponasset = weaponassetnamemap(rootname);
    return function_667f43ce2ee5b5dd(weaponasset, "receiver", 0);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5925
// Size: 0x93
function buildweaponattachmentidmap(attachments, attachmentids) {
    var_91bbf8d2294a656e = [];
    foreach (idx, var_8bccf360992ddd62 in attachments) {
        if (isdefined(attachmentids) && idx < attachmentids.size) {
            if (isdefined(attachmentids[var_8bccf360992ddd62])) {
                var_91bbf8d2294a656e[var_8bccf360992ddd62] = attachmentids[var_8bccf360992ddd62];
            } else {
                var_91bbf8d2294a656e[var_8bccf360992ddd62] = attachmentids[idx];
            }
            continue;
        }
        var_91bbf8d2294a656e[var_8bccf360992ddd62] = 0;
    }
    return var_91bbf8d2294a656e;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59c0
// Size: 0x89
function getweaponnvgattachment(weaponobj) {
    var_7efcef2ab37c2c45 = ["laserir_box", "laserir_cyl", "laserir_pstl"];
    foreach (attachment in var_7efcef2ab37c2c45) {
        if (weaponobj canuseattachment(attachment)) {
            return attachment;
        }
    }
    return "invalid";
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params a, eflags: 0x0
// Checksum 0x0, Offset: 0x5a51
// Size: 0x119
function function_13aeabbe4210eadc(itemname, rarity, lootid, baseweapon, attachments, fullweaponname, titlestring, descstring, icon, pickupsound) {
    /#
        str = "<unknown string>";
        str = str + "<unknown string>" + itemname;
        str = str + "<unknown string>" + "<unknown string>";
        str = str + "<unknown string>" + rarity;
        str = str + "<unknown string>";
        str = str + "<unknown string>" + lootid;
        str = str + "<unknown string>";
        str = str + "<unknown string>";
        str = str + "<unknown string>" + baseweapon;
        str = str + "<unknown string>";
        str = str + "<unknown string>" + attachments;
        str = str + "<unknown string>" + fullweaponname;
        str = str + "<unknown string>" + function_e4891bb7bec886f9(titlestring);
        str = str + "<unknown string>" + function_e4891bb7bec886f9(descstring);
        str = str + "<unknown string>" + icon;
        str = str + "<unknown string>" + pickupsound;
        return str;
    #/
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b71
// Size: 0x7c
function function_623af97ae297f796() {
    attachmentlist = [];
    numrows = tablelookupgetnumrows("mp/attachmenttable.csv");
    for (index = 0; index < numrows; index++) {
        attachmentname = tablelookupbyrow("mp/attachmenttable.csv", index, 4);
        if (attachmentname == "") {
            continue;
        }
        /#
            assertex(!isdefined(attachmentlist[attachmentname]), "Duplicate attachment reference name found in attachmentTable.csv: " + attachmentname);
        #/
        attachmentlist[attachmentname] = attachmentname;
    }
    return attachmentlist;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bf5
// Size: 0x42
function getreticleindex(reticleref) {
    if (!isdefined(reticleref)) {
        return undefined;
    }
    reticleid = int(tablelookup("mp/reticleTable.csv", 1, reticleref, 5));
    if (!isdefined(reticleid) || reticleid == 0) {
        return undefined;
    }
    return reticleid;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c3f
// Size: 0x42
function getweapontable() {
    if (!isdefined(level.weapontable)) {
        if (isdefined(level.gamemodebundle)) {
            level.weapontable = level.gamemodebundle.var_ddaed03ebcc9ccf9;
        }
    }
    return level.weapontable;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c89
// Size: 0x10c
function function_a221d76594ef4e8b() {
    if (isdefined(level.weaponlistbundle)) {
        return level.weaponlistbundle;
    }
    gamemodebundle = function_1e231fc15fdab31d();
    if (isdefined(gamemodebundle) && isdefined(gamemodebundle.weaponlist)) {
        weaponlistbundle = getscriptbundle(hashcat(%"hash_7eccb7f3e167e22b", gamemodebundle.weaponlist));
        if (isdefined(weaponlistbundle) && isdefined(weaponlistbundle.weapons)) {
            level.weaponlistbundle = [];
            foreach (index, struct in weaponlistbundle.weapons) {
                if (isdefined(struct) && isdefined(struct.weapondata)) {
                    level.weaponlistbundle[index] = struct.weapondata;
                }
            }
            return level.weaponlistbundle;
        }
    }
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d9c
// Size: 0x118
function function_c7901c1f857aa1a0(weapon) {
    /#
        println("<unknown string>" + getcompleteweaponname(weapon));
    #/
    variantindex = getweaponvariantindex(getcompleteweaponname(weapon));
    if (!isdefined(variantindex)) {
        itemname = getweaponbasename(weapon);
        weapon_lootid = namespace_e0ee43ef2dddadaa::getweaponlootid(weapon);
        /#
            println("<unknown string>" + itemname);
        #/
        if (weapon_lootid > 0) {
            /#
                println("<unknown string>" + weapon_lootid + "<unknown string>");
            #/
        }
        return [itemname, weapon_lootid];
    }
    /#
        println("<unknown string>" + variantindex);
    #/
    weaponscriptbundle = function_33ce6e3c89e6975f(getweaponbasename(weapon), variantindex);
    weapon_lootid = weaponscriptbundle.lootid;
    blueprintname = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(weaponscriptbundle.lootid);
    /#
        println("<unknown string>" + blueprintname);
    #/
    /#
        println("<unknown string>" + weapon_lootid + "<unknown string>");
    #/
    return [blueprintname, weapon_lootid];
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ebc
// Size: 0x29
function function_8477d8595e0364a7(weapon, keys) {
    return function_50f8a8f765bad85e(hashcat(%"hash_31705bf9ed477170", weapon), keys);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5eed
// Size: 0x29
function function_a622d54bb517923a(attachment, keys) {
    return function_50f8a8f765bad85e(hashcat(%"hash_3c2c9813bb16552f", attachment), keys);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f1e
// Size: 0x44
function function_b8811a0fc04e4b9d(weapon, key, def) {
    value = getscriptbundlefieldvalue(hashcat(%"hash_31705bf9ed477170", weapon), key);
    if (!isdefined(value)) {
        return def;
    }
    return value;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f6a
// Size: 0x175
function function_c471a035d22df5eb() {
    if (!isdefined(level.var_c7008cff883cd615)) {
        level.var_c7008cff883cd615 = [];
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "frontpiece";
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "backpiece";
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "magazine";
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "override";
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "muzzle";
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "reargrip";
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "trigger";
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "extra";
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "scope";
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "underbarrel";
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "modifier";
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "visual";
        level.var_c7008cff883cd615[level.var_c7008cff883cd615.size] = "other";
    }
    return level.var_c7008cff883cd615;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60e7
// Size: 0x5e
function function_5419ac7173288fc1(weapon) {
    weaponname = weapon.basename;
    if (!isdefined(weaponname)) {
        return 0;
    }
    currentweapon = 0;
    switch (weaponname) {
    case #"hash_33c7f389fa9d6dd5":
    case #"hash_c94fd51fe359fdfe":
        currentweapon = 1;
        break;
    }
    return currentweapon;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x614d
// Size: 0x5e
function function_ada582163d1aca5e(weapon) {
    weaponname = weapon.basename;
    if (!isdefined(weaponname)) {
        return 0;
    }
    currentweapon = 0;
    switch (weaponname) {
    case #"hash_288bc6291d670eaa":
    case #"hash_b43c2e4c05fafc4b":
        currentweapon = 1;
        break;
    }
    return currentweapon;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x61b3
// Size: 0x30
function function_aa8b0f148ca930aa(weapon) {
    weaponname = weapon.basename;
    if (!isdefined(weaponname)) {
        return false;
    }
    return weaponname == "super_remote_map_mp";
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61eb
// Size: 0x68
function function_79d6e6c22245687a(rootname, variantid) {
    var_928c1cac31ea99e5 = rootname + "|" + variantid;
    if (isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5]) && isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5].lootid)) {
        return level.weaponlootmapdata[var_928c1cac31ea99e5].lootid;
    }
    return 0;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x625b
// Size: 0x70
function function_115404a4dbd59830(rootname, variantid) {
    if (!isdefined(variantid)) {
        variantid = 0;
    }
    var_928c1cac31ea99e5 = rootname + "|" + variantid;
    if (isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5]) && isdefined(level.weaponlootmapdata[var_928c1cac31ea99e5].weaponcooldown)) {
        return level.weaponlootmapdata[var_928c1cac31ea99e5].weaponcooldown;
    }
    return 0;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62d3
// Size: 0x4e
function getweaponlootid(weapon) {
    variantid = 0;
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
    if (isdefined(weapon.variantid)) {
        variantid = weapon.variantid;
    }
    return function_79d6e6c22245687a(rootname, variantid);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6329
// Size: 0x31
function function_b0d37b9be0027733(customweaponname) {
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(customweaponname);
    ref = rootname;
    return namespace_38b993c4618e76cd::getlootidfromref(ref);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6362
// Size: 0xa7
function function_98bac17512f9c622(weapon) {
    weaponlootid = 0;
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        /#
            assert(isstring(weapon));
        #/
        weaponname = weapon;
    }
    if (isdefined(weaponname)) {
        var_49e6ef3edadd524e = namespace_e0ee43ef2dddadaa::getweaponrootname(weaponname);
        if (isdefined(level.weaponmapdata[var_49e6ef3edadd524e]) && isdefined(level.weaponmapdata[var_49e6ef3edadd524e].weaponlootid)) {
            weaponlootid = level.weaponmapdata[var_49e6ef3edadd524e].weaponlootid;
        }
    }
    return weaponlootid;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6411
// Size: 0xe1
function function_89a83ae9a4c4142a(weapon) {
    if (getdvarint(@"hash_8f727124cb64ae24", 1) == 1) {
        weaponlootid = function_98bac17512f9c622(weapon);
        if (weaponlootid != 0) {
            return weaponlootid;
        }
    }
    if (!isdefined(level.specialweaponlist)) {
        level.specialweaponlist = [];
    }
    weaponname = function_c2bc8497963042d5(weapon);
    if (!isdefined(weaponname)) {
        return 0;
    }
    if (isdefined(level.specialweaponlist[weaponname])) {
        return level.specialweaponlist[weaponname];
    }
    id = tablelookup("loot/special_weapon_ids.csv", 1, weaponname, 0);
    if (!isdefined(id) || id == "0" || id == "") {
        return 0;
    }
    id = int(id);
    if (isdefined(id)) {
        level.specialweaponlist[weaponname] = id;
        return id;
    }
    return getweaponlootid(weapon);
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64fa
// Size: 0xb3
function function_c2bc8497963042d5(weapon) {
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        /#
            assert(isstring(weapon));
        #/
        weaponname = weapon;
    }
    switch (weaponname) {
    case #"hash_b1091bccb52690e0":
    case #"hash_e1e4906cafc3af9d":
        weaponname = "iw9_tur_mrap_mp";
        break;
    case #"hash_20305144649233ed":
    case #"hash_8d7aa4b158a0e9a9":
        weaponname = "iw9_mg_patrol_boat_front_mp";
        break;
    case #"hash_62a9688b69906271":
    case #"hash_708fb6e22f87a3a4":
        weaponname = "iw9_tur_cougar_mp";
        break;
    }
    return weaponname;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65b5
// Size: 0x3d
function getgrenadeinpullback() {
    offhandweapon = self getheldoffhand();
    if (isdefined(self.gestureweapon) && offhandweapon == makeweaponfromstring(self.gestureweapon)) {
        offhandweapon = nullweapon();
    }
    return offhandweapon;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65fa
// Size: 0x1e
function isweaponequipment(weapon) {
    return istrue(weapon.inventorytype == "offhand");
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6620
// Size: 0x1a
function function_56f6e04546b058f7(weapon) {
    if (weapon == "iw9_knifestab") {
        return true;
    }
    return false;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6642
// Size: 0x33
function function_309bcc0c19de2d18(weapon) {
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
    return level.weaponmapdata[rootname].var_e56bf18451002522;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x667d
// Size: 0x7a
function function_8a96b90526c40df6(weapon, attachments) {
    foreach (attachment in attachments) {
        if (issubstr(attachment, "laser") || issubstr(attachment, "flashlight")) {
            return false;
        }
    }
    return true;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66ff
// Size: 0x29
function isspreadweapon(objweapon) {
    return isdefined(objweapon) && isdefined(weaponclass(objweapon)) && weaponclass(objweapon) == "spread";
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6730
// Size: 0x88
function iswonderweapon(weapon) {
    if (!isdefined(weapon)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return 0;
    }
    if (!isdefined(level.weaponmetadata)) {
        return 0;
    }
    var_768d659419360f70 = weapon.var_9d7facbe889e667c;
    if (!isdefined(var_768d659419360f70)) {
        return 0;
    }
    metadata = level.weaponmetadata[var_768d659419360f70];
    if (isdefined(metadata) && isdefined(metadata.iswonderweapon)) {
        return metadata.iswonderweapon;
    }
    return 0;
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67c0
// Size: 0x22
function function_5238382582ce39fa() {
    buildweaponmap();
    buildattachmentmaps();
    function_ee4a536a155313b7();
    /#
        namespace_d891623ae9a314e3::function_b8a2a2faf79dc08e();
    #/
}

// Namespace weapon / namespace_e0ee43ef2dddadaa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67e9
// Size: 0x144
function fixupplayerweapons(player, weapon) {
    currentplayerweapons = player getweaponslistprimaries();
    dirtyprimary = 1;
    dirtysecondary = 1;
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = getcompleteweaponname(weapon);
    } else {
        weaponname = weapon;
    }
    foreach (currentweapon in currentplayerweapons) {
        if (isdefined(player.primaryweaponobj) && player.primaryweaponobj == currentweapon) {
            dirtyprimary = 0;
            continue;
        }
        if (isdefined(player.secondaryweaponobj) && player.secondaryweaponobj == currentweapon) {
            dirtysecondary = 0;
        }
    }
    if (dirtyprimary) {
        player.primaryweapon = weaponname;
        player.primaryweaponobj = makeweaponfromstring(weaponname);
    } else if (dirtysecondary) {
        player.secondaryweapon = weaponname;
        player.secondaryweaponobj = makeweaponfromstring(weaponname);
    }
    return dirtyprimary || dirtysecondary;
}

