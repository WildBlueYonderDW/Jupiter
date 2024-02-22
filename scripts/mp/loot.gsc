// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\calloutmarkerping_mp.gsc;
#using script_396a814d39e7044f;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_600b944a95c3a7bf;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\utility\game.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\teamrevive.gsc;
#using script_2391409ef7b431e1;
#using scripts\mp\utility\weapon.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\loot.gsc;
#using script_b7a9ce0a2282b79;
#using script_55e418c5cc946593;
#using script_728ffcee8cbf30ee;
#using script_744cad313ed0a87e;

#namespace loot;

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9e
// Size: 0x65
function init() {
    level.lootweaponcache = [];
    level.lootweaponrefs = [];
    var_725f93c8f8f7cf9d = getdvarint(@"hash_d8d8d08bfd9ec4df", 30);
    var_ef5b044960434f17 = getdvarint(@"hash_17fe9acebdd2352", 5);
    level.var_de221bfb117f1fd1 = var_725f93c8f8f7cf9d * var_725f93c8f8f7cf9d;
    level.var_ef5b044960434f17 = var_ef5b044960434f17 * var_ef5b044960434f17;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0a
// Size: 0x39
function getpassivesforweapon(var_5c3f9357f11d2223, variantid) {
    var_60ce74182e7c83a7 = getlootinfoforweapon(var_5c3f9357f11d2223, variantid);
    if (isdefined(var_60ce74182e7c83a7)) {
        return var_60ce74182e7c83a7.passives;
    }
    return undefined;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4b
// Size: 0x68
function getlootinfoforweapon(var_5c3f9357f11d2223, variantid) {
    if (!isdefined(variantid)) {
        return undefined;
    }
    if (isdefined(level.lootweaponcache[var_5c3f9357f11d2223]) && isdefined(level.lootweaponcache[var_5c3f9357f11d2223][variantid])) {
        weaponinfo = level.lootweaponcache[var_5c3f9357f11d2223][variantid];
        return weaponinfo;
    }
    weaponinfo = cachelootweaponweaponinfo(var_5c3f9357f11d2223, variantid);
    if (isdefined(weaponinfo)) {
        return weaponinfo;
    }
    return undefined;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xebb
// Size: 0x67
function getweaponassetfromrootweapon(rootweaponname, variantid) {
    var_6cf67c6d17cf3316 = "mp/loot/weapon/" + rootweaponname + ".csv";
    weaponasset = tablelookup(var_6cf67c6d17cf3316, 0, variantid, 3);
    /#
        assertex(isdefined(weaponasset) && weaponasset != "", "Failed to find weapon asset for root weapon "" + rootweaponname + "" with variantID " + variantid);
    #/
    return weaponasset;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2a
// Size: 0x67
function lookupvariantref(rootweaponname, variantid) {
    var_6cf67c6d17cf3316 = "mp/loot/weapon/" + rootweaponname + ".csv";
    var_93b3002ebef628b = tablelookup(var_6cf67c6d17cf3316, 0, variantid, 1);
    /#
        assertex(isdefined(var_93b3002ebef628b) && var_93b3002ebef628b != "", "Failed to find variant ref for root weapon "" + rootweaponname + "" with variantID " + variantid);
    #/
    return var_93b3002ebef628b;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf99
// Size: 0x2b
function isweaponitem(lootitemid) {
    itemtype = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootitemid);
    return isdefined(itemtype) && itemtype == "weapon";
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfcc
// Size: 0x2b
function iskillstreakitem(lootitemid) {
    itemtype = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootitemid);
    return isdefined(itemtype) && itemtype == "weapon";
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfff
// Size: 0x6c
function cachelootweaponweaponinfo(var_5c3f9357f11d2223, variantid) {
    if (!isdefined(var_5c3f9357f11d2223)) {
        return undefined;
    }
    if (!isdefined(level.lootweaponcache[var_5c3f9357f11d2223])) {
        level.lootweaponcache[var_5c3f9357f11d2223] = [];
    }
    var_c6c779c138e8c65 = getweaponloottable(var_5c3f9357f11d2223);
    weaponinfo = readweaponinfofromtable(var_c6c779c138e8c65, variantid, var_5c3f9357f11d2223);
    level.lootweaponcache[var_5c3f9357f11d2223][variantid] = weaponinfo;
    return weaponinfo;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1073
// Size: 0x8e
function readweaponinfofromtable(var_b2f2b716da5389c, variantid, var_5c3f9357f11d2223) {
    struct = spawnstruct();
    var_4bb9768282d4260d = namespace_e0ee43ef2dddadaa::getweaponrootname(var_5c3f9357f11d2223);
    ref = var_4bb9768282d4260d + "|" + variantid;
    struct.ref = ref;
    struct.weaponasset = level.weaponlootmapdata[ref].assetname;
    struct.variantid = variantid;
    return struct;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1109
// Size: 0x4f
function getweaponqualitybyid(weapon, variantid) {
    if (!isdefined(variantid) || variantid < 0) {
        return 0;
    }
    var_c6c779c138e8c65 = getweaponloottable(weapon);
    quality = int(tablelookup(var_c6c779c138e8c65, 0, variantid, 4));
    return quality;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1160
// Size: 0xed
function function_381163b13da57799(opener, container, itemindex, var_9b0656c2ed2321cf) {
    contents = ter_op(isdefined(var_9b0656c2ed2321cf), var_9b0656c2ed2321cf, container.contents);
    if (!isdefined(contents[itemindex])) {
        return 0;
    }
    item = contents[itemindex];
    quantity = item["quantity"];
    lootid = item["lootID"];
    team = item["team"];
    visibilitycondition = item["visibilityCondition"];
    if (isdefined(quantity) && quantity > 0 && isdefined(lootid) && lootid > 0 && (!isdefined(team) || team == opener.team) && (!isdefined(visibilitycondition) || [[ visibilitycondition ]](opener, container))) {
        return 1;
    }
    return 0;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1255
// Size: 0xd6
function function_44ab83cc979e1217(opener, container, itemindex) {
    if (!isdefined(container.var_bf23a60678978c19[itemindex])) {
        return 0;
    }
    item = container.var_bf23a60678978c19[itemindex];
    quantity = item["quantity"];
    lootid = item["lootID"];
    team = item["team"];
    visibilitycondition = item["visibilityCondition"];
    if (isdefined(quantity) && quantity > 0 && isdefined(lootid) && lootid > 0 && (!isdefined(team) || team == opener.team) && (!isdefined(visibilitycondition) || [[ visibilitycondition ]](opener, container))) {
        return 1;
    }
    return 0;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1333
// Size: 0x66
function function_2581f2ab21309779(container) {
    if (!isdefined(container.var_46a3a8565ac0c17c)) {
        return 1;
    }
    switch (container.var_46a3a8565ac0c17c) {
    case 13:
    case 14:
    case 15:
        return 0;
    default:
        return 1;
        break;
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a0
// Size: 0x15d
function function_61c51bd9656a843d(opener, container, var_fab72763a744c649) {
    var_bf23a60678978c19 = container.var_bf23a60678978c19;
    if (!isdefined(var_fab72763a744c649)) {
        var_fab72763a744c649 = [];
    }
    if (!isdefined(container.var_3aadf7a3cc811358)) {
        container.var_3aadf7a3cc811358 = [];
    }
    if (isdefined(var_bf23a60678978c19)) {
        foreach (itemindex, item in var_bf23a60678978c19) {
            lootid = 0;
            quantity = 0;
            if (isdefined(item["lootID"])) {
                lootid = item["lootID"];
                quantity = item["quantity"];
            }
            if (lootid == 0 || quantity == 0) {
                continue;
            }
            var_a28bd7f30254c8a0 = getautopickupquantity(opener, lootid, quantity);
            if (var_a28bd7f30254c8a0 != quantity) {
                var_a0d21fdd38f60ecf = var_fab72763a744c649.size;
                var_fab72763a744c649[var_a0d21fdd38f60ecf] = spawnstruct();
                var_fab72763a744c649[var_a0d21fdd38f60ecf].index = itemindex + 11;
                var_fab72763a744c649[var_a0d21fdd38f60ecf].var_c79d6d2f755eb27e = quantity;
                var_fab72763a744c649[var_a0d21fdd38f60ecf].lootid = lootid;
                container.var_3aadf7a3cc811358[var_a0d21fdd38f60ecf] = itemindex;
            }
        }
    }
    return var_fab72763a744c649;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1505
// Size: 0x40d
function getautopickupquantity(opener, lootid, quantity) {
    var_a1093166de09e6b8 = namespace_38b993c4618e76cd::getscriptablefromlootid(lootid);
    if (!isdefined(var_a1093166de09e6b8)) {
        return quantity;
    }
    maxcount = level.br_pickups.var_4138f9ddc1cd22d[var_a1093166de09e6b8];
    if (!isdefined(maxcount) || maxcount == 0) {
        maxcount = level.br_pickups.maxcounts[var_a1093166de09e6b8];
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("getAutoPickupQuantity")) {
        result = namespace_71073fa38f11492::function_d72afaccedfc946e("getAutoPickupQuantity", lootid, var_a1093166de09e6b8, quantity, maxcount);
        if (isdefined(result)) {
            return result;
        }
    }
    if (maxcount > 0 && isdefined(lootid)) {
        for (i = 0; i < namespace_aead94004cf4c147::function_b13e35608b336d65(opener); i++) {
            var_eeeae9defa0c1e95 = opener namespace_aead94004cf4c147::function_6196d9ea9a30e609(i);
            if (var_eeeae9defa0c1e95 == lootid) {
                var_e30b916adc1e2dc8 = opener namespace_aead94004cf4c147::function_897b29adb37f06a7(i);
                if (var_e30b916adc1e2dc8 < maxcount) {
                    return int(max(0, var_e30b916adc1e2dc8 + quantity - maxcount));
                }
            }
        }
    }
    if (namespace_d3d40f75bb4e4c32::isammo(var_a1093166de09e6b8)) {
        var_509d86412c9d7426 = opener getweaponslistprimaries();
        foreach (weap in var_509d86412c9d7426) {
            var_7cac4ff8e11f1bca = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(weap);
            if (isdefined(var_7cac4ff8e11f1bca) && var_a1093166de09e6b8 == var_7cac4ff8e11f1bca && opener.br_ammo[var_a1093166de09e6b8] < level.var_e6ea72fc5e3fcd00[var_a1093166de09e6b8]) {
                return int(max(0, opener.br_ammo[var_a1093166de09e6b8] + quantity - level.var_e6ea72fc5e3fcd00[var_a1093166de09e6b8]));
            }
        }
    }
    if (namespace_d3d40f75bb4e4c32::isarmorplate(var_a1093166de09e6b8)) {
        equipname = level.br_pickups.br_equipname[var_a1093166de09e6b8];
        slot = level.equipment.table[equipname].defaultslot;
        if (!isdefined(opener.equipment[slot]) || opener namespace_cb965d2f71fefddc::equipmentslothasroom(var_a1093166de09e6b8, slot)) {
            var_5324597edfaff57c = opener namespace_1a507865f681850e::getequipmentslotammo(slot);
            var_5324597edfaff57c = ter_op(isdefined(var_5324597edfaff57c), var_5324597edfaff57c, 0);
            var_b5cdf4d935e6ac13 = opener namespace_1a507865f681850e::getequipmentmaxammo(equipname);
            return int(max(0, var_5324597edfaff57c + quantity - var_b5cdf4d935e6ac13));
        }
    }
    if (namespace_cb965d2f71fefddc::function_b989edd9af4f42c7(var_a1093166de09e6b8) || namespace_cb965d2f71fefddc::function_d7c5786a0c42ef6c(var_a1093166de09e6b8)) {
        equipname = level.br_pickups.br_equipname[var_a1093166de09e6b8];
        slot = level.equipment.table[equipname].defaultslot;
        if (opener namespace_cb965d2f71fefddc::pickupissameasequipmentslot(equipname, slot) && opener namespace_cb965d2f71fefddc::equipmentslothasroom(var_a1093166de09e6b8, slot)) {
            var_5324597edfaff57c = opener namespace_1a507865f681850e::getequipmentslotammo(slot);
            var_5324597edfaff57c = ter_op(isdefined(var_5324597edfaff57c), var_5324597edfaff57c, 0);
            var_b5cdf4d935e6ac13 = opener namespace_1a507865f681850e::getequipmentmaxammo(equipname);
            return int(max(0, var_5324597edfaff57c + quantity - var_b5cdf4d935e6ac13));
        }
    }
    if (namespace_cb965d2f71fefddc::isplunder(var_a1093166de09e6b8)) {
        if (isdefined(opener.plundercount) && isdefined(level.br_plunder.plunderlimit) && opener.plundercount >= level.br_plunder.plunderlimit) {
            return quantity;
        }
        var_7eddf19f11da2f94 = function_53c4c53197386572(opener.plundercount, 0);
        maxplunder = function_53c4c53197386572(level.br_plunder.plunderlimit, var_7eddf19f11da2f94 + quantity);
        return int(max(0, var_7eddf19f11da2f94 + quantity - maxplunder));
    }
    return quantity;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191a
// Size: 0x53a
function function_57c0f59f64f553fa(opener, container, items, var_6064fb4b46498174) {
    opener endon("death_or_disconnect");
    opener endon("enter_live_ragdoll");
    container endon("closed");
    level endon("game_ended");
    waittime = 0.55;
    var_e88566cf37c5687e = getdvarfloat(@"hash_d9e519d9c89af2f3", 0);
    if (var_e88566cf37c5687e > 0) {
        waittime = var_e88566cf37c5687e + 0.2;
    }
    var_677b4d98122f0868 = getdvarfloat(@"hash_12b0e0c79ccf572d", 0);
    if (var_677b4d98122f0868 > 0) {
        waittime = 0.35 + var_677b4d98122f0868;
        if (var_e88566cf37c5687e > 0) {
            waittime = var_e88566cf37c5687e + var_677b4d98122f0868;
        }
    }
    var_ed396a07b4c75932 = getdvarint(@"hash_ab7929439577c576", 1);
    wait(waittime);
    foreach (item in items) {
        if (!isreallyalive(opener) || !function_6f45e7311f77eac4(opener) || iscontainerempty(container, opener)) {
            if (isdefined(container.var_73fb94c9aedcc497)) {
                container.var_73fb94c9aedcc497 = [];
            }
            if (isdefined(container.var_3aadf7a3cc811358)) {
                container.var_3aadf7a3cc811358 = [];
            }
            return;
        }
        if (!isdefined(item) || !isdefined(item.lootid) || !isdefined(item.var_c79d6d2f755eb27e) || !isdefined(item.index)) {
            continue;
        }
        if (!function_7eda25c90cc3aaa1(item.index) && !function_381163b13da57799(opener, container, item.index)) {
            continue;
        }
        if (function_7eda25c90cc3aaa1(item.index) && !function_44ab83cc979e1217(opener, container, item.index - 11)) {
            continue;
        }
        var_34d6e1ac2bbefabd = 0;
        if (isdefined(container.contents)) {
            foreach (content in container.contents) {
                if (function_7eda25c90cc3aaa1(item.index)) {
                    break;
                }
                var_eeeae9defa0c1e95 = content["lootID"];
                if (isdefined(var_eeeae9defa0c1e95) && var_eeeae9defa0c1e95 == item.lootid) {
                    quantity = content["quantity"];
                    var_a28bd7f30254c8a0 = getautopickupquantity(opener, item.lootid, quantity);
                    if (quantity != var_a28bd7f30254c8a0) {
                        var_34d6e1ac2bbefabd = 1;
                        function_9d924aea120c2693(opener, item.index, container);
                        var_97c23a1323acc7df = quantity - var_a28bd7f30254c8a0;
                        /#
                            /#
                                assertex(var_97c23a1323acc7df >= 0, "cash" + var_eeeae9defa0c1e95);
                            #/
                        #/
                        if (var_97c23a1323acc7df < 0) {
                            continue;
                        }
                        function_2f00ca0526f3edc6(opener, item.index, var_97c23a1323acc7df, var_6064fb4b46498174, 1);
                        if (isdefined(container) && iscontainerempty(container, opener) && function_6f45e7311f77eac4(opener)) {
                            function_68085c72d7b628ec(container, opener);
                        }
                        if (!var_ed396a07b4c75932) {
                            wait(getdvarfloat(@"hash_f920b46a5250c2a9", 0.33));
                        }
                    }
                }
            }
        }
        if (function_7eda25c90cc3aaa1(item.index) && isdefined(container.var_bf23a60678978c19)) {
            for (i = 0; i < container.var_bf23a60678978c19.size; i++) {
                if (!isdefined(container.var_bf23a60678978c19[i])) {
                    continue;
                }
                var_eeeae9defa0c1e95 = container.var_bf23a60678978c19[i]["lootID"];
                if (isdefined(var_eeeae9defa0c1e95) && var_eeeae9defa0c1e95 == item.lootid) {
                    quantity = container.var_bf23a60678978c19[i]["quantity"];
                    var_a28bd7f30254c8a0 = getautopickupquantity(opener, item.lootid, quantity);
                    if (quantity != var_a28bd7f30254c8a0) {
                        var_34d6e1ac2bbefabd = 1;
                        function_9d924aea120c2693(opener, item.index, container);
                        var_97c23a1323acc7df = quantity - var_a28bd7f30254c8a0;
                        function_2f00ca0526f3edc6(opener, item.index, var_97c23a1323acc7df, var_6064fb4b46498174, 1);
                        if (isdefined(container) && iscontainerempty(container, opener) && function_6f45e7311f77eac4(opener)) {
                            function_68085c72d7b628ec(container, opener);
                        }
                        if (!var_ed396a07b4c75932) {
                            wait(getdvarfloat(@"hash_f920b46a5250c2a9", 0.33));
                        }
                    }
                }
            }
        }
        if (var_34d6e1ac2bbefabd && var_ed396a07b4c75932) {
            wait(getdvarfloat(@"hash_f920b46a5250c2a9", 0.33));
        }
    }
    if (isdefined(container.var_73fb94c9aedcc497)) {
        container.var_73fb94c9aedcc497 = [];
    }
    if (isdefined(container.var_3aadf7a3cc811358)) {
        container.var_3aadf7a3cc811358 = [];
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5b
// Size: 0x17
function getlootweaponref(lootitemid) {
    return level.lootweaponrefs[lootitemid];
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7a
// Size: 0x7d
function function_3a712642b82f6f2(scriptablename) {
    if (!isdefined(scriptablename)) {
        return 8;
    }
    if (namespace_cb965d2f71fefddc::isrevivepickup(scriptablename)) {
        return 0;
    }
    if (namespace_cb965d2f71fefddc::iskillstreak(scriptablename)) {
        return 1;
    }
    if (namespace_d3d40f75bb4e4c32::isarmorplate(scriptablename)) {
        return 2;
    }
    if (namespace_d3d40f75bb4e4c32::function_4aa12e0ed3f6b745(scriptablename)) {
        return 3;
    }
    if (namespace_cb965d2f71fefddc::function_b1e944a2b3e15e9d(scriptablename)) {
        return 4;
    }
    if (namespace_cb965d2f71fefddc::issuperpickup(scriptablename)) {
        return 5;
    }
    if (namespace_d3d40f75bb4e4c32::isequipment(scriptablename)) {
        return 6;
    }
    if (namespace_d3d40f75bb4e4c32::isammo(scriptablename)) {
        return 7;
    }
    return 8;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eff
// Size: 0x95
function function_c01727794cd72a1c(var_bf2c7ba7126c84f1, var_bf2c78a7126c7e58) {
    if (!isdefined(var_bf2c7ba7126c84f1) || !isdefined(var_bf2c78a7126c7e58)) {
        return 1;
    }
    if (!istrue(var_bf2c7ba7126c84f1["lootID"]) || !istrue(var_bf2c78a7126c7e58["lootID"]) || !istrue(var_bf2c7ba7126c84f1["quantity"]) || !istrue(var_bf2c78a7126c7e58["quantity"])) {
        return 1;
    }
    var_d9fc4b7dc88a5bbc = function_3a712642b82f6f2(namespace_38b993c4618e76cd::getscriptablefromlootid(var_bf2c7ba7126c84f1["lootID"]));
    var_d9fc4e7dc88a6255 = function_3a712642b82f6f2(namespace_38b993c4618e76cd::getscriptablefromlootid(var_bf2c78a7126c7e58["lootID"]));
    return var_d9fc4b7dc88a5bbc < var_d9fc4e7dc88a6255;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9c
// Size: 0x742
function function_30f5ea60517f9e06(opener, container) {
    var_6064fb4b46498174 = container;
    if (function_e3081772bbf7a51c(opener, container)) {
        var_6064fb4b46498174 = container;
        container = function_3aae4431f00c347f(opener, container);
        container.origin = var_6064fb4b46498174.origin;
        container.angles = var_6064fb4b46498174.angles;
    }
    if (function_54066dbd8ef44fe1(container) && getdvarint(@"hash_ab065f0da94d8ff", 1)) {
        var_57acfdc40b2fba7 = function_438749eb7a7b738(container.contents, opener, container);
        var_77dc0a100921c5a7 = var_57acfdc40b2fba7[1];
        items = var_57acfdc40b2fba7[0];
        container.contents = items;
        container.contents = array_sort_with_func(container.contents, &function_c01727794cd72a1c);
    }
    weaponcount = 0;
    for (itemindex = 0; itemindex < 11; itemindex++) {
        if (function_381163b13da57799(opener, container, itemindex)) {
            if (isweaponitem(container.contents[itemindex]["lootID"])) {
                tmp = container.contents[weaponcount];
                container.contents[weaponcount] = container.contents[itemindex];
                container.contents[itemindex] = tmp;
                weaponcount++;
            }
        }
    }
    items = container.contents;
    opener.var_2fa5b49969def47 = var_6064fb4b46498174;
    opener.var_f2aa9ae949179907 = opener.origin;
    var_6064fb4b46498174.opener = opener;
    if (isplayer(opener)) {
        opener function_41e759de50f883dc(items, var_6064fb4b46498174.var_46a3a8565ac0c17c);
    }
    if (isdefined(container.var_bf8e5f003146af44)) {
        opener.var_f2aa9ae949179907 = rotatevectorinverted(opener.origin - var_6064fb4b46498174.var_bf8e5f003146af44.origin, var_6064fb4b46498174.var_bf8e5f003146af44.angles);
    }
    /#
        if (items.size > 11) {
            println("commonOption" + items.size + "<unknown string>" + 11 + "<unknown string>");
        }
    #/
    var_fab72763a744c649 = [];
    var_4472b62c1fa150e5 = 0;
    container.var_73fb94c9aedcc497 = [];
    for (itemindex = 0; itemindex < 11; itemindex++) {
        if (function_381163b13da57799(opener, container, itemindex)) {
            var_a28bd7f30254c8a0 = items[itemindex]["quantity"];
            if (getdvarint(@"hash_c272dfd858eba88f", 1) && function_2581f2ab21309779(var_6064fb4b46498174)) {
                var_a28bd7f30254c8a0 = getautopickupquantity(opener, items[itemindex]["lootID"], items[itemindex]["quantity"]);
            }
            function_446c7ad7bcc70992(opener, container, itemindex, items[itemindex]["lootID"], items[itemindex]["quantity"], items[itemindex]["ref"]);
            if (var_a28bd7f30254c8a0 != items[itemindex]["quantity"]) {
                var_a0d21fdd38f60ecf = var_fab72763a744c649.size;
                var_fab72763a744c649[var_a0d21fdd38f60ecf] = spawnstruct();
                var_fab72763a744c649[var_a0d21fdd38f60ecf].index = itemindex;
                var_fab72763a744c649[var_a0d21fdd38f60ecf].var_c79d6d2f755eb27e = items[itemindex]["quantity"];
                var_fab72763a744c649[var_a0d21fdd38f60ecf].lootid = items[itemindex]["lootID"];
                if (!opener function_b73431b8e7ae9204()) {
                    container.var_73fb94c9aedcc497[var_a0d21fdd38f60ecf] = itemindex;
                }
            }
        } else {
            function_c7294f5b9b5006d5(opener, itemindex);
        }
    }
    if (isdefined(container.var_4f6cde716e0c3d7)) {
        function_62ad0c002d54cbcc(opener, container, "loot_container_weapon", container.var_4f6cde716e0c3d7, container.var_6fb67c8525b1d79e);
    } else {
        opener setclientomnvar("loot_container_weapon", 0);
    }
    if (!isdefined(var_6064fb4b46498174.var_46a3a8565ac0c17c)) {
        var_6064fb4b46498174.var_46a3a8565ac0c17c = 1;
    }
    var_46a3a8565ac0c17c = var_6064fb4b46498174.var_46a3a8565ac0c17c;
    if (var_46a3a8565ac0c17c == 6) {
        if (isdefined(var_6064fb4b46498174.owner) && isdefined(var_6064fb4b46498174.owner.team) && isdefined(opener.team) && var_6064fb4b46498174.owner.team == opener.team && isdefined(var_6064fb4b46498174.owner.var_3f78c6a0862f9e25)) {
            var_46a3a8565ac0c17c = 7 + var_6064fb4b46498174.owner.var_3f78c6a0862f9e25;
        }
        if (isdefined(var_6064fb4b46498174.var_846a20d8e6f30b8e)) {
            opener setclientomnvar("loot_container_dead_player_index", var_6064fb4b46498174.var_846a20d8e6f30b8e);
        }
    }
    if (function_54066dbd8ef44fe1(var_6064fb4b46498174)) {
        owner = var_6064fb4b46498174.owner;
        if (isdefined(var_6064fb4b46498174.var_846a20d8e6f30b8e)) {
            opener setclientomnvar("loot_container_dead_player_index", var_6064fb4b46498174.var_846a20d8e6f30b8e);
        }
        if (isdefined(var_6064fb4b46498174.backpacksize)) {
            opener setclientomnvar("loot_container_dead_player_backpack_size", var_6064fb4b46498174.backpacksize);
        }
        if (namespace_3c37cb17ade254d::issharedfuncdefined("dmz_bosses", "onBackpackOpen")) {
            opener [[ namespace_3c37cb17ade254d::getsharedfunc("dmz_bosses", "onBackpackOpen") ]](var_6064fb4b46498174);
        }
        var_fab72763a744c649 = function_61c51bd9656a843d(opener, container, var_fab72763a744c649);
        function_46bf6f4d9dcc9b78(opener, container);
    }
    if (var_fab72763a744c649.size > 0 && !opener function_b73431b8e7ae9204()) {
        thread function_57c0f59f64f553fa(opener, container, var_fab72763a744c649, var_6064fb4b46498174);
    }
    opener setclientomnvar("loot_container_open", var_46a3a8565ac0c17c);
    if (istrue(level.var_a101059dea76957c) && !istrue(var_6064fb4b46498174.var_4e6e38a1603f22ee) && var_6064fb4b46498174.var_46a3a8565ac0c17c != 13 && var_6064fb4b46498174.var_46a3a8565ac0c17c != 15 && var_6064fb4b46498174.var_46a3a8565ac0c17c != 17 && var_6064fb4b46498174.var_46a3a8565ac0c17c != 18 && var_6064fb4b46498174.var_46a3a8565ac0c17c != 19 && !function_54066dbd8ef44fe1(var_6064fb4b46498174)) {
        var_6064fb4b46498174.var_4e6e38a1603f22ee = 1;
        if (!isdefined(opener.var_79c8f592b7c3c2d6)) {
            opener.var_79c8f592b7c3c2d6 = 0;
        }
        opener.var_79c8f592b7c3c2d6++;
        thread function_86d77b1dbd44b06e(opener, var_6064fb4b46498174, var_4472b62c1fa150e5);
    }
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    var_6064fb4b46498174.dropstruct = dropstruct;
    function_e01065f2c8e19b09(container, opener);
    if (opener function_b73431b8e7ae9204()) {
        container thread function_576b46dbf8366fe3(container, opener, var_fab72763a744c649, var_6064fb4b46498174);
    }
    var_6064fb4b46498174 thread function_71a59f067d5fe986(var_6064fb4b46498174, opener);
    var_6064fb4b46498174 thread function_47b931d76ffd028f(var_6064fb4b46498174, opener);
    if (function_e3081772bbf7a51c(opener, container)) {
        container.var_556db0b72a96514e[opener.guid].contents = items;
    }
    opener namespace_ede58c1e66c2c280::function_faa3cbec7243fe72();
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e5
// Size: 0x252
function function_41e759de50f883dc(items, container_type) {
    if (!isdefined(items)) {
        return;
    }
    if (!isdefined(items.size) || items.size <= 0) {
        return;
    }
    var_5a0fc1d304e970ea = "unset";
    if (isdefined(self.sessionteam)) {
        var_5a0fc1d304e970ea = self.sessionteam;
    }
    if (isdefined(self.team)) {
        var_5a0fc1d304e970ea = self.team;
    }
    var_9c02e895e4dbdc3b = "0";
    if (isdefined(level.var_a7b62649c81b481a) && isdefined(level.var_a7b62649c81b481a.var_acc161de36707de2)) {
        var_9c02e895e4dbdc3b = namespace_3c37cb17ade254d::string(level.var_a7b62649c81b481a.var_acc161de36707de2);
    }
    var_9846f3da68a7d5bc = [];
    var_cf765966d1ee56d6 = [];
    foreach (item in items) {
        var_cf765966d1ee56d6[var_9846f3da68a7d5bc.size] = namespace_3c37cb17ade254d::string(item["quantity"]);
        var_9846f3da68a7d5bc[var_9846f3da68a7d5bc.size] = namespace_3c37cb17ade254d::string(item["lootID"]);
    }
    data = spawnstruct();
    data.player = self;
    data.var_5a0fc1d304e970ea = var_5a0fc1d304e970ea;
    data.x = self.origin[0];
    data.y = self.origin[1];
    data.z = self.origin[2];
    data.var_6437fc57f57c9ad8 = self.angles[0];
    data.var_fe76a03a13318315 = self.angles[1];
    data.zrot = self.angles[2];
    data.var_9c02e895e4dbdc3b = var_9c02e895e4dbdc3b;
    data.var_c983d3abb7ec13d9 = int(namespace_cd0b2d039510b38d::getsecondspassed());
    data.var_9846f3da68a7d5bc = var_9846f3da68a7d5bc;
    data.var_cf765966d1ee56d6 = var_cf765966d1ee56d6;
    data.container_type = container_type;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_dmz_on_container", data);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x293e
// Size: 0x4a1
function function_576b46dbf8366fe3(container, opener, var_fab72763a744c649, var_6064fb4b46498174) {
    opener endon("death_or_disconnect");
    opener endon("enter_live_ragdoll");
    container endon("closed");
    level endon("game_ended");
    startdelay = 0.5;
    var_77242e1f9173bc1c = 0.2;
    currentindex = 0;
    wait(startdelay);
    while (opener activatekeypressed() && function_6f45e7311f77eac4(opener) && currentindex < 11 && isreallyalive(opener) && !iscontainerempty(container, opener)) {
        if (function_381163b13da57799(opener, container, currentindex)) {
            scriptablename = opener namespace_38b993c4618e76cd::getscriptablefromlootid(container.contents[currentindex]["lootID"]);
            var_25978461c6e4f61b = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(container.contents[currentindex]["lootID"]);
            var_fe539e37b6579930 = 0;
            stowweapon = 0;
            var_5fa12dc278a8f1ba = 0;
            if (namespace_cb965d2f71fefddc::function_b989edd9af4f42c7(scriptablename) || namespace_cb965d2f71fefddc::function_d7c5786a0c42ef6c(scriptablename)) {
                equipname = level.br_pickups.br_equipname[scriptablename];
                slot = level.equipment.table[equipname].defaultslot;
                if (opener namespace_cb965d2f71fefddc::pickupissameasequipmentslot(equipname, slot)) {
                    if (opener namespace_cb965d2f71fefddc::equipmentslothasroom(scriptablename, slot)) {
                        var_fe539e37b6579930 = 1;
                    }
                } else if (!isdefined(opener namespace_1a507865f681850e::getcurrentequipment(slot)) || opener namespace_1a507865f681850e::getequipmentslotammo(slot) == 0) {
                    var_fe539e37b6579930 = 1;
                }
            } else if (namespace_cb965d2f71fefddc::isweaponpickup(scriptablename)) {
                var_5fa12dc278a8f1ba = 1;
                foreach (weaponobj in opener.primaryinventory) {
                    if (weaponobj.basename == "iw9_me_fists_mp") {
                        var_fe539e37b6579930 = 1;
                        break;
                    }
                }
                if (!var_fe539e37b6579930 && !namespace_aead94004cf4c147::function_efab78b72d131d76(opener) && namespace_aead94004cf4c147::function_b13e35608b336d65(opener) >= 7) {
                    stowweapon = 1;
                }
            } else if (namespace_d3d40f75bb4e4c32::function_4aa12e0ed3f6b745(scriptablename)) {
                var_556946700794bb3 = namespace_d3d40f75bb4e4c32::function_692c3df266580df6(scriptablename);
                if (var_556946700794bb3 > opener.var_bed158a6dfac230d) {
                    var_fe539e37b6579930 = 1;
                }
            } else if (namespace_d3d40f75bb4e4c32::isarmorplate(scriptablename)) {
                var_fe539e37b6579930 = 1;
            } else if (namespace_cb965d2f71fefddc::iskillstreak(scriptablename)) {
                if (!opener namespace_cb965d2f71fefddc::hasanykillstreak()) {
                    var_fe539e37b6579930 = 1;
                }
            } else if (namespace_cb965d2f71fefddc::isgasmask(scriptablename)) {
                if (!isdefined(opener.gasmaskhealth)) {
                    var_fe539e37b6579930 = 1;
                }
            } else if (namespace_cb965d2f71fefddc::function_b1e944a2b3e15e9d(scriptablename)) {
                var_ccc0df5641a7616b = namespace_aead94004cf4c147::function_b13e35608b336d65(opener);
                var_d5af812b9411dcc4 = namespace_aead94004cf4c147::function_3188d9c94b3d56c2(scriptablename);
                if (var_ccc0df5641a7616b < var_d5af812b9411dcc4) {
                    var_fe539e37b6579930 = 1;
                }
            } else if (namespace_cb965d2f71fefddc::isrevivepickup(scriptablename)) {
                if (!opener namespace_d3d40f75bb4e4c32::hasselfrevivetoken()) {
                    var_fe539e37b6579930 = 1;
                }
            } else if (namespace_cb965d2f71fefddc::issuperpickup(scriptablename)) {
                if (!opener namespace_aead94004cf4c147::function_5e7049647595ab97()) {
                    var_fe539e37b6579930 = 1;
                }
            }
            if (var_25978461c6e4f61b == "cash") {
                function_9d924aea120c2693(opener, currentindex, container);
                function_2f00ca0526f3edc6(opener, currentindex, container.contents[currentindex]["quantity"], container, 1);
                wait(var_77242e1f9173bc1c);
            } else if (var_fe539e37b6579930) {
                opener function_3ae3712fe76d0c6a(opener, currentindex, 0, container);
                wait(var_77242e1f9173bc1c);
            } else if (stowweapon) {
                opener function_f0617ad70b7e7792(0, 100, container);
                wait(var_77242e1f9173bc1c);
            } else if (!var_5fa12dc278a8f1ba && (namespace_d3d40f75bb4e4c32::isammo(scriptablename) || opener namespace_aead94004cf4c147::canitemfitinbackpack(container.contents[currentindex]["lootID"], container.contents[currentindex]["quantity"]))) {
                opener function_601d9afc257af3ff(opener, currentindex, container);
                wait(var_77242e1f9173bc1c);
            }
        }
        currentindex++;
    }
    if (var_fab72763a744c649.size > 0 && currentindex < 11 && function_6f45e7311f77eac4(opener)) {
        thread function_57c0f59f64f553fa(opener, container, var_fab72763a744c649, var_6064fb4b46498174);
    } else if (isdefined(container) && iscontainerempty(container, opener) && function_6f45e7311f77eac4(opener)) {
        function_68085c72d7b628ec(container, opener);
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de6
// Size: 0xab
function function_e01065f2c8e19b09(container, opener) {
    /#
        assert(isdefined(opener) && isdefined(container));
    #/
    if (isdefined(level.var_1a2b600a06ec21f4)) {
        if (isdefined(level.var_1a2b600a06ec21f4.var_d7b78a1323b4009f) && level.var_1a2b600a06ec21f4.var_d7b78a1323b4009f != "") {
            playsoundatpos(opener.origin + (0, 0, 24), level.var_1a2b600a06ec21f4.var_d7b78a1323b4009f);
        }
    }
    function_63981aa3be7d52ae(opener, container.origin);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e98
// Size: 0x21
function function_63981aa3be7d52ae(player, origin) {
    function_afe5cda1a4ed9d11("examine_loot", player, origin);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ec0
// Size: 0x146
function function_438749eb7a7b738(items, opener, container) {
    /#
        assert(isdefined(items));
    #/
    var_542ab2415c42e657 = [];
    var_47868f432c8fcb6b = 0;
    lastindex = items.size - 1;
    foreach (item in items) {
        quantity = item["quantity"];
        lootid = item["lootID"];
        team = item["team"];
        visibilitycondition = item["visibilityCondition"];
        if (isdefined(quantity) && quantity > 0 && isdefined(lootid) && lootid > 0 && (!isdefined(team) || team == opener.team) && (!isdefined(visibilitycondition) || [[ visibilitycondition ]](opener, container))) {
            var_542ab2415c42e657[var_47868f432c8fcb6b] = item;
            var_47868f432c8fcb6b++;
        } else {
            var_542ab2415c42e657[lastindex] = item;
            lastindex--;
        }
    }
    return [0:var_542ab2415c42e657, 1:lastindex];
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x300e
// Size: 0x41
function function_c7294f5b9b5006d5(player, index) {
    player setclientomnvar("loot_container_item_" + index, 0);
    player setclientomnvar("loot_container_quantity_" + index, 0);
    player setclientomnvar("loot_container_type_" + index, 0);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3056
// Size: 0x4e
function function_47b931d76ffd028f(container, opener) {
    container endon("death");
    level endon("game_ended");
    container endon("closed");
    opener waittill_any_4("close_container", "flashbang", "concussed", "weapon_fired");
    function_68085c72d7b628ec(container, opener);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ab
// Size: 0x49
function function_825b88a376d4be6f(var_167656c36d02a90a, opener) {
    if (!isdefined(opener) || !isdefined(opener getplayerangles())) {
        return 1;
    }
    newforward = anglestoforward(opener getplayerangles());
    return math::anglebetweenvectors(var_167656c36d02a90a, newforward) > 20;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30fc
// Size: 0xea
function function_9fb5b05ed3f94474(container, opener, var_fac5875c19871d1f) {
    var_c739a0e481fce3d8 = level.var_de221bfb117f1fd1;
    if (var_fac5875c19871d1f > 2 && getdvarint(@"hash_419fd2f09b23942a", 1)) {
        var_c739a0e481fce3d8 = level.var_ef5b044960434f17;
    }
    if (isdefined(container.var_bf8e5f003146af44)) {
        newoffset = rotatevectorinverted(opener.origin - container.var_bf8e5f003146af44.origin, container.var_bf8e5f003146af44.angles);
        if (distancesquared(opener.var_f2aa9ae949179907, newoffset) > var_c739a0e481fce3d8) {
            return 0;
        }
    } else if (distancesquared(opener.var_f2aa9ae949179907, opener.origin) > var_c739a0e481fce3d8) {
        return 0;
    }
    return 1;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31ee
// Size: 0x9d
function function_f5765dcf987b7720(container, opener, var_167656c36d02a90a, var_fac5875c19871d1f) {
    if (istrue(opener.isdisconnecting)) {
        return 0;
    }
    if (!isreallyalive(opener)) {
        return 0;
    }
    if (function_f3557caf4562bff7(container) && istrue(container.var_343c584e7e00192)) {
        return 1;
    }
    if (!isdefined(opener.origin)) {
        return 0;
    }
    if (!function_9fb5b05ed3f94474(container, opener, var_fac5875c19871d1f)) {
        return 0;
    }
    if (function_825b88a376d4be6f(var_167656c36d02a90a, opener)) {
        return 0;
    }
    if (opener playerads() > 0.5) {
        return 0;
    }
    return 1;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3293
// Size: 0x132
function function_71a59f067d5fe986(container, opener) {
    container endon("death");
    level endon("game_ended");
    container endon("closed");
    var_167656c36d02a90a = anglestoforward(opener getplayerangles());
    var_fac5875c19871d1f = 0;
    while (function_f5765dcf987b7720(container, opener, var_167656c36d02a90a, var_fac5875c19871d1f)) {
        if (getdvarint(@"hash_419fd2f09b23942a", 1)) {
            if (lengthsquared(opener getvelocity()) == 0) {
                if (var_fac5875c19871d1f == 0) {
                    if (isdefined(container.var_bf8e5f003146af44)) {
                        opener.var_f2aa9ae949179907 = rotatevectorinverted(opener.origin - container.var_bf8e5f003146af44.origin, container.var_bf8e5f003146af44.angles);
                    } else {
                        opener.var_f2aa9ae949179907 = opener.origin;
                    }
                }
                var_fac5875c19871d1f++;
                var_fac5875c19871d1f = int(min(var_fac5875c19871d1f, getdvarint(@"hash_aea0716d0a0f790a", 6)));
            } else {
                var_fac5875c19871d1f--;
                var_fac5875c19871d1f = int(max(var_fac5875c19871d1f, 0));
            }
        }
        waitframe();
    }
    function_68085c72d7b628ec(container, opener);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33cc
// Size: 0x479
function function_68085c72d7b628ec(container, opener) {
    if (isdefined(opener)) {
        opener setclientomnvar("loot_container_open", 0);
    }
    if (!isdefined(container)) {
        return;
    }
    function_6cd112326d215e1f(opener, container);
    container.opener = undefined;
    partname = container function_ec5f4851431f3382();
    if (iscontainerempty(container, opener)) {
        if (namespace_1b7e64f50cca9321::function_6759ff16e552aa94(container) || namespace_1b7e64f50cca9321::function_8c57777a730ca632(container) || namespace_7db13bdf599e41a6::function_5b55070c02328ea7(container)) {
            container notify("death");
            container freescriptable();
        } else {
            function_932e5252b650e475(opener, container);
        }
    } else if (function_f3557caf4562bff7(container)) {
        if (isreallyalive(opener) && istrue(container.var_343c584e7e00192) && isdefined(container.contents) && container.contents.size > 0) {
            lootid = undefined;
            quantity = undefined;
            foreach (item in container.contents) {
                lootid = item["lootID"];
                quantity = item["quantity"];
                break;
            }
            if (isdefined(lootid) && isdefined(quantity) && lootid != 0 && quantity > 0) {
                opener namespace_cb965d2f71fefddc::function_fe539e37b6579930(lootid, quantity);
            }
            namespace_cb965d2f71fefddc::loothide(container);
            return;
        } else {
            foreach (player in level.players) {
                container enablescriptableplayeruse(player);
            }
        }
    } else if (!function_532eac3c428e5b9b(container)) {
        if (container getscriptableparthasstate(partname, "partially_open_usable")) {
            state = container getscriptablepartstate(partname);
            if (!isdefined(state)) {
                logstring("Log this in IW9-396144: state is undefined, container.type = " + ter_op(isdefined(container.type), container.type, "undefined") + ", partName = " + partname);
            }
            if (state == "partially_open_in_use_unusable" || state == "partially_reopen_in_use_unusable") {
                container setscriptablepartstate(partname, "partially_open_usable");
            } else if (state == "partially_opening_unusable") {
                container thread function_d3e618521013c7eb();
            } else if (!function_e3081772bbf7a51c(opener, container) && state != "partially_open_usable" && state != "closing") {
                /#
                    assert("Attempted to close a lootable container that wasn't in either partially_open_in_use_unusable or partially_open_usable");
                #/
            }
        }
    }
    if (isdefined(container.var_ceb543956c7203e7)) {
        [[ container.var_ceb543956c7203e7 ]](container, opener);
    }
    if (getdvarint(@"hash_c85a9bcc06a81a1f", 0) && isdefined(container.var_2568210352be1ecf) && container.var_2568210352be1ecf.size > 0) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        if (isdefined(container.dropstruct)) {
            dropstruct = container.dropstruct;
        }
        foreach (index, item in container.var_2568210352be1ecf) {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, opener.origin, opener.angles, opener, undefined);
            scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(item["lootID"]);
            namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, item["quantity"], 1, undefined, 0);
            opener.var_2fa5b49969def47.contents[index]["lootID"] = 0;
            opener.var_2fa5b49969def47.contents[index]["quantity"] = 0;
        }
        container.var_2568210352be1ecf = undefined;
    }
    if (isdefined(container.dropstruct)) {
        container.dropstruct = undefined;
    }
    opener.var_2fa5b49969def47 = undefined;
    container notify("closed");
    opener namespace_ede58c1e66c2c280::function_faa3cbec7243fe72();
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x384c
// Size: 0x44
function function_d3e618521013c7eb() {
    self endon("death");
    level endon("game_ended");
    partname = self function_ec5f4851431f3382();
    waitframe();
    while (self getscriptablepartstate(partname) == "partially_opening_unusable") {
        waitframe();
    }
    self setscriptablepartstate(partname, "partially_open_usable");
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3897
// Size: 0x19
function function_6f45e7311f77eac4(player) {
    return player getclientomnvar("loot_container_open") > 0;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38b8
// Size: 0x10c
function function_73d8c72e055e8640(player) {
    if (!function_6f45e7311f77eac4(player)) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47)) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47.var_46a3a8565ac0c17c)) {
        return 0;
    }
    if (player.var_2fa5b49969def47.var_46a3a8565ac0c17c != 14) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47.contents)) {
        return 0;
    }
    foreach (item in player.var_2fa5b49969def47.contents) {
        if (isdefined(item["lootID"])) {
            scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(item["lootID"]);
            if (isdefined(scriptablename) && namespace_cb965d2f71fefddc::function_e4b6260dbb04b43d(scriptablename)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39cc
// Size: 0x91
function function_6cd112326d215e1f(opener, container) {
    container = function_59b9c8081b873a10(opener, container);
    if (!isdefined(container.var_7f52190fa265244c)) {
        return;
    }
    foreach (var_8eb93a779d9df6f7 in container.var_7f52190fa265244c) {
        function_a1054a8c2bc6c36d(var_8eb93a779d9df6f7);
    }
    container.var_7f52190fa265244c = [];
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a64
// Size: 0x9b
function function_7ef8fa0b69da782a(var_8db5472153ea4811) {
    var_1560c7d5cacc7888 = 31;
    if (var_1560c7d5cacc7888 > 31) {
        /#
            assertmsg("unpackContainerSlotIDData: Not enough bits in container slot ID omnvars to pack/unpack values.");
        #/
        return undefined;
    }
    var_25cdf28fdb105d24 = spawnstruct();
    var_9eb6df06f8b7b0ee = 1048576 - 1;
    var_25cdf28fdb105d24.lootid = var_9eb6df06f8b7b0ee & var_8db5472153ea4811;
    var_8db5472153ea4811 = var_8db5472153ea4811 >> 20;
    var_b1a98c6b10f6e8c1 = 2048 - 1;
    var_25cdf28fdb105d24.var_8470cc41230ce05d = var_b1a98c6b10f6e8c1 & var_8db5472153ea4811;
    var_8db5472153ea4811 = var_8db5472153ea4811 >> 11;
    /#
        assert(var_8db5472153ea4811 == 0);
    #/
    return var_25cdf28fdb105d24;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b07
// Size: 0x91
function function_c4858170624b6caf(lootid, var_8470cc41230ce05d) {
    if (!isdefined(lootid)) {
        lootid = 0;
    }
    /#
        assert(lootid >= 0 && lootid < 1048576);
    #/
    if (!isdefined(var_8470cc41230ce05d)) {
        var_8470cc41230ce05d = 0;
    }
    /#
        assert(var_8470cc41230ce05d >= 0 && var_8470cc41230ce05d < 2048);
    #/
    var_8db5472153ea4811 = 0;
    var_1560c7d5cacc7888 = 31;
    if (var_1560c7d5cacc7888 > 31) {
        /#
            assertmsg("packContainerSlotIDData: Not enough bits in slot ID omnvars to pack/unpack values.");
        #/
        return var_8db5472153ea4811;
    }
    var_8db5472153ea4811 = var_8db5472153ea4811 | var_8470cc41230ce05d;
    var_8db5472153ea4811 = var_8db5472153ea4811 << 20;
    var_8db5472153ea4811 = var_8db5472153ea4811 | lootid;
    return var_8db5472153ea4811;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ba0
// Size: 0x69
function function_d6a3266145bab76d(var_8c24a642e5abba4e) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    var_22937f7da36b4b8f = player getclientomnvar(var_8c24a642e5abba4e);
    if (!isdefined(var_22937f7da36b4b8f)) {
        return 0;
    }
    var_bd62f58e765fffd5 = function_7ef8fa0b69da782a(var_22937f7da36b4b8f);
    var_b7ef0bd383c9dbaf = var_bd62f58e765fffd5.lootid;
    return var_b7ef0bd383c9dbaf;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c11
// Size: 0x131
function function_62ad0c002d54cbcc(player, container, var_142ee196b1c70723, lootid, weapon) {
    var_8eb93a779d9df6f7 = undefined;
    if (isdefined(lootid) && lootid != 0) {
        if (!isdefined(weapon)) {
            var_c9c301a888170672 = namespace_38b993c4618e76cd::getscriptablefromlootid(lootid);
            /#
                assert(isdefined(var_c9c301a888170672));
            #/
            var_8eb93a779d9df6f7 = function_51f396445baa7fa6(var_c9c301a888170672);
        } else if (isweapon(weapon)) {
            var_cce9361200c5117c = namespace_e0ee43ef2dddadaa::function_c9af9fe37668df2(weapon.basename);
            var_c9c301a888170672 = "brloot_weapon_generic_" + var_cce9361200c5117c;
            var_8eb93a779d9df6f7 = function_51f396445baa7fa6(var_c9c301a888170672, weapon);
        } else {
            /#
                assert(isstring(weapon));
            #/
            var_c9c301a888170672 = weapon;
            var_8eb93a779d9df6f7 = function_51f396445baa7fa6(var_c9c301a888170672);
        }
    }
    if (isdefined(var_8eb93a779d9df6f7) && var_8eb93a779d9df6f7 != 0) {
        /#
            assert(isdefined(container));
        #/
        if (!isdefined(container.var_7f52190fa265244c)) {
            container.var_7f52190fa265244c = [];
        }
        container.var_7f52190fa265244c[container.var_7f52190fa265244c.size] = var_8eb93a779d9df6f7;
    }
    var_453ae8156fbdc0de = function_c4858170624b6caf(lootid, var_8eb93a779d9df6f7);
    player setclientomnvar(var_142ee196b1c70723, var_453ae8156fbdc0de);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d49
// Size: 0x12b
function function_446c7ad7bcc70992(player, container, index, lootid, quantity, var_c9c301a888170672) {
    if (function_c26e54ffd0c8be94(container, index)) {
        function_b1423adeced14528(player, index - 11, lootid, quantity);
        return;
    }
    typename = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
    var_ba7d157f3bbf68e9 = undefined;
    if (isdefined(typename)) {
        var_ba7d157f3bbf68e9 = level.var_f984ba508ae5bcb1[typename];
    }
    if (lootid == 0) {
        function_c7294f5b9b5006d5(player, index);
    } else if (isdefined(var_ba7d157f3bbf68e9)) {
        if (var_ba7d157f3bbf68e9.typename == "weapon") {
            function_62ad0c002d54cbcc(player, container, "loot_container_item_" + index, lootid, var_c9c301a888170672);
        } else {
            player setclientomnvar("loot_container_item_" + index, lootid);
        }
        player setclientomnvar("loot_container_quantity_" + index, quantity);
        player setclientomnvar("loot_container_type_" + index, var_ba7d157f3bbf68e9.var_3a436bd812a2b86);
        if (quantity > 4095) {
            logstring("IW9-690092: Item quantity too large for loot ID: " + lootid);
        }
    } else {
        /#
            println("<unknown string>" + lootid + "<unknown string>");
        #/
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e7b
// Size: 0x18
function function_7eda25c90cc3aaa1(index) {
    return index >= 11 && index <= 20;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e9b
// Size: 0x26
function function_c26e54ffd0c8be94(container, index) {
    return function_7eda25c90cc3aaa1(index) && function_54066dbd8ef44fe1(container);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ec9
// Size: 0xa3
function getloadoutdoublebackpacklootid(container, index, var_cc768ff46f3f6339) {
    if (isdefined(container) && isdefined(container.var_3aadf7a3cc811358) && array_contains(container.var_3aadf7a3cc811358, index) && !istrue(var_cc768ff46f3f6339)) {
        return 0;
    }
    if (isdefined(container) && isdefined(container.var_bf23a60678978c19) && isdefined(container.var_bf23a60678978c19[index]) && isdefined(container.var_bf23a60678978c19[index]["lootID"])) {
        return container.var_bf23a60678978c19[index]["lootID"];
    }
    return 0;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f74
// Size: 0xa3
function function_dc8d7c1709adcd67(container, index, var_cc768ff46f3f6339) {
    if (isdefined(container) && isdefined(container.var_3aadf7a3cc811358) && array_contains(container.var_3aadf7a3cc811358, index) && !istrue(var_cc768ff46f3f6339)) {
        return 0;
    }
    if (isdefined(container) && isdefined(container.var_bf23a60678978c19) && isdefined(container.var_bf23a60678978c19[index]) && isdefined(container.var_bf23a60678978c19[index]["quantity"])) {
        return container.var_bf23a60678978c19[index]["quantity"];
    }
    return 0;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x401f
// Size: 0x33
function function_7f855164a30a5f5f(player) {
    player setclientomnvar("loot_container_loadout_weapon_id", 0);
    player setclientomnvar("loot_container_loadout_weapon_attachments", 0);
    player setclientomnvar("loot_container_loadout_weapon_ammo", 0);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4059
// Size: 0x96
function function_9b4ad636bec4278d(player, lootid, quantity) {
    gasmasktype = 0;
    gasmaskhealth = 0;
    if (!(lootid == 0 || quantity == 0)) {
        gasmaskhealth = quantity;
        scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(lootid);
        if (scriptablename == "brloot_equip_gasmask_durable") {
            gasmasktype = 3;
        } else if (scriptablename == "brloot_equip_gasmask_scuba") {
            gasmasktype = 4;
        } else {
            gasmasktype = 2;
        }
    }
    player setclientomnvar("loot_container_loadout_gasmask_id", gasmasktype);
    player setclientomnvar("loot_container_loadout_gasmask_quantity", gasmaskhealth);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40f6
// Size: 0x1ef
function function_b1423adeced14528(player, index, lootid, quantity) {
    if (lootid == 0 || quantity == 0) {
        lootid = 0;
        quantity = 0;
    }
    switch (index) {
    case 0:
        player setclientomnvar("loot_container_loadout_plunder_quantity", quantity);
        break;
    case 1:
        player setclientomnvar("loot_container_loadout_lethal_id", lootid);
        player setclientomnvar("loot_container_loadout_lethal_quantity", quantity);
        break;
    case 2:
        player setclientomnvar("loot_container_loadout_tactical_id", lootid);
        if (namespace_cb965d2f71fefddc::function_d345eec68e01361f(lootid)) {
            quantity = 1;
        }
        player setclientomnvar("loot_container_loadout_tactical_quantity", quantity);
        break;
    case 3:
        player setclientomnvar("loot_container_loadout_armor_quantity", quantity);
        break;
    case 6:
        function_9b4ad636bec4278d(player, lootid, quantity);
        break;
    case 7:
        player setclientomnvar("loot_container_loadout_revive", quantity);
        break;
    case 5:
        player setclientomnvar("loot_container_loadout_super_id", lootid);
        break;
    case 4:
        player setclientomnvar("loot_container_loadout_killstreak_id", lootid);
        break;
    case 8:
        if (lootid == 0 || quantity == 0) {
            player setclientomnvar("loot_container_loadout_dogtag_tier", 0);
            break;
        }
        if (lootid == 26140) {
            player setclientomnvar("loot_container_loadout_dogtag_tier", 5);
            player setclientomnvar("loot_container_loadout_dogtag_quantity", 1);
            break;
        }
        tier = namespace_85cd45b4fe0d86fb::function_2d2f7e8a6547ae42(lootid);
        player setclientomnvar("loot_container_loadout_dogtag_tier", tier + 1);
        player setclientomnvar("loot_container_loadout_dogtag_quantity", quantity);
        break;
    case 9:
        player setclientomnvar("loot_container_loadout_backpack", lootid);
    default:
        break;
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42ec
// Size: 0x1ae
function function_46bf6f4d9dcc9b78(player, container) {
    var_bf23a60678978c19 = container.var_bf23a60678978c19;
    if (isdefined(var_bf23a60678978c19)) {
        foreach (index, item in var_bf23a60678978c19) {
            lootid = 0;
            quantity = 0;
            if (isdefined(item["lootID"])) {
                lootid = item["lootID"];
                quantity = item["quantity"];
            }
            function_b1423adeced14528(player, index, lootid, quantity);
        }
    }
    if (isdefined(container.var_a06e7128c001851d) && isdefined(container.var_a0e9fef038504bd0)) {
        var_98f7ce981bb1f93c = container.var_a06e7128c001851d;
        weaponobj = container.var_a0e9fef038504bd0;
        attachments = getweaponattachments(weaponobj);
        attachmentcount = 0;
        foreach (attachment in attachments) {
            if (!namespace_68e641469fde3fa7::attachmentisselectable(weaponobj, attachment)) {
                continue;
            }
            attachmentcount++;
        }
        function_62ad0c002d54cbcc(player, container, "loot_container_loadout_weapon_id", var_98f7ce981bb1f93c, weaponobj);
        player setclientomnvar("loot_container_loadout_weapon_attachments", attachmentcount);
        player setclientomnvar("loot_container_loadout_weapon_ammo", player getweaponammoclip(weaponobj));
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44a1
// Size: 0x8c
function getlootidatcontainerindex(player, index, container, var_cc768ff46f3f6339) {
    if (isdefined(container) && isdefined(container.var_73fb94c9aedcc497) && array_contains(container.var_73fb94c9aedcc497, index) && !istrue(var_cc768ff46f3f6339)) {
        return 0;
    }
    var_f1cbc68c79ebf1ea = undefined;
    if (index == 100) {
        var_f1cbc68c79ebf1ea = player function_d6a3266145bab76d("loot_container_weapon");
    } else {
        var_f1cbc68c79ebf1ea = player function_d6a3266145bab76d("loot_container_item_" + index);
    }
    return var_f1cbc68c79ebf1ea;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4535
// Size: 0x6e
function function_8e5978971b5dcd16(player, index, container, var_cc768ff46f3f6339) {
    if (isdefined(container) && isdefined(container.var_73fb94c9aedcc497) && array_contains(container.var_73fb94c9aedcc497, index) && !istrue(var_cc768ff46f3f6339)) {
        return 0;
    }
    if (index == 100) {
        return 1;
    }
    return player getclientomnvar("loot_container_quantity_" + index);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45ab
// Size: 0x19b
function iscontainerempty(container, opener) {
    if (function_532eac3c428e5b9b(container)) {
        return 0;
    }
    container = function_59b9c8081b873a10(opener, container);
    if (!isdefined(container.contents)) {
        return 1;
    }
    contents = container.contents;
    foreach (content in contents) {
        if (!isdefined(content["lootID"]) || !isdefined(content["quantity"])) {
            continue;
        }
        if (content["lootID"] > 0 && content["quantity"] > 0) {
            return 0;
        }
    }
    if (isdefined(container.customweaponname)) {
        return 0;
    }
    if (istrue(container.var_4f6cde716e0c3d7)) {
        return 0;
    }
    if (function_54066dbd8ef44fe1(container)) {
        if (isdefined(container.var_bf23a60678978c19)) {
            foreach (content in container.var_bf23a60678978c19) {
                if (!isdefined(content["lootID"]) || !isdefined(content["quantity"])) {
                    continue;
                }
                if (content["lootID"] > 0 && content["quantity"] > 0) {
                    return 0;
                }
            }
        }
        if (isdefined(container.var_a0e9fef038504bd0)) {
            return 0;
        }
    }
    return 1;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x474e
// Size: 0x3ad
function function_60d2295ccc45d8c0(player, lootid, quantity, container) {
    if (isdefined(quantity) && quantity < 0) {
        return;
    }
    method = namespace_aad14af462a74d08::function_6d40f12a09494350(0, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"loot"));
    scriptablename = container.type;
    var_46a3a8565ac0c17c = container.var_46a3a8565ac0c17c;
    if (isdefined(var_46a3a8565ac0c17c) && (var_46a3a8565ac0c17c == 2 || var_46a3a8565ac0c17c == 6 || var_46a3a8565ac0c17c >= 7 && var_46a3a8565ac0c17c <= 12)) {
        method = namespace_aad14af462a74d08::function_6d40f12a09494350(method, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"backpack"));
    } else {
        method = namespace_aad14af462a74d08::function_6d40f12a09494350(method, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"cache"));
    }
    lootsource = 0;
    var_d330fa8595db7e4f = 0;
    if (isdefined(scriptablename)) {
        switch (scriptablename) {
        case #"hash_3b6111354af78459":
            lootsource = namespace_aad14af462a74d08::function_6d40f12a09494350(lootsource, function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"hash_b7d4384f34a1807f"));
            break;
        case #"hash_469a90a45e97eda9":
        case #"hash_50e52e4dc37fb7a8":
            lootsource = namespace_aad14af462a74d08::function_6d40f12a09494350(lootsource, function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"hash_e57057f8c389d76"));
            break;
        case #"hash_44904bb5898785d9":
            lootsource = namespace_aad14af462a74d08::function_6d40f12a09494350(lootsource, function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"hash_e124881640495511"));
            break;
        case #"hash_61f36140da68c992":
            lootsource = namespace_aad14af462a74d08::function_6d40f12a09494350(lootsource, function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"supply_drop"));
            lootsource = namespace_aad14af462a74d08::function_6d40f12a09494350(lootsource, function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"hash_8f2ebe6038c7957d"));
            var_d330fa8595db7e4f = 1;
            break;
        case #"hash_993262832973e0d":
            lootsource = namespace_aad14af462a74d08::function_6d40f12a09494350(lootsource, function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"supply_drop"));
            lootsource = namespace_aad14af462a74d08::function_6d40f12a09494350(lootsource, function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"hash_bc50426fe5f0eab1"));
            var_d330fa8595db7e4f = 1;
            break;
        case #"hash_1a50c41f80fb532b":
            lootsource = namespace_aad14af462a74d08::function_6d40f12a09494350(lootsource, function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"hash_d594288b25c9fc26"));
            break;
        case #"hash_763609926e3b8ed":
            lootsource = namespace_aad14af462a74d08::function_6d40f12a09494350(lootsource, function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"hash_64f687fff06916de"));
            break;
        case #"hash_93553b29704c0d3":
            lootsource = namespace_aad14af462a74d08::function_6d40f12a09494350(lootsource, function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"hash_45c41c3b2e6d475a"));
            break;
        case #"hash_2808ce3c4558142d":
            lootsource = namespace_aad14af462a74d08::function_6d40f12a09494350(lootsource, function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"hash_45c41c3b2e6d475a"));
            break;
        case #"hash_5fe210289499bd6e":
            var_d330fa8595db7e4f = 1;
            break;
        default:
            break;
        }
    }
    if (var_d330fa8595db7e4f) {
        function_ce5d71baed479274(player, container);
    }
    if (function_7ba31cb6b21c346f()) {
        if (player function_c28d94289c4a6ecd(container, lootid)) {
            player thread function_36edf91561322753(3);
        }
    }
    namespace_aad14af462a74d08::function_d24138b32084fc3e(player, lootid, undefined, method, quantity, lootsource);
    player notify("looted_item", lootid);
    if (!game_utility::isbrstylegametype()) {
        namespace_cb965d2f71fefddc::function_acddab6fa6e914a(player, player.origin);
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b02
// Size: 0x1bd
function function_ce5d71baed479274(var_f2983979dd4f1ff0, container) {
    var_7ecbd4f07f6882d0 = getdvarint(@"hash_a1e254e5a2b575d7", 1) == 1;
    var_ba03253452037335 = 0;
    players = namespace_54d20dd0dd79277f::getteamdata(var_f2983979dd4f1ff0.team, "players");
    if (isdefined(container)) {
        if (isdefined(container.var_8697902b8b8a79b1)) {
            if (!var_7ecbd4f07f6882d0) {
                var_243d9ea347100ef1 = 0;
                foreach (player in players) {
                    if (array_contains(container.var_8697902b8b8a79b1, player)) {
                        var_243d9ea347100ef1 = 1;
                        break;
                    }
                }
                if (!var_243d9ea347100ef1) {
                    container.var_8697902b8b8a79b1 = array_combine_unique(container.var_8697902b8b8a79b1, players);
                    var_ba03253452037335 = 1;
                }
            }
        } else {
            container.var_8697902b8b8a79b1 = [];
            container.var_8697902b8b8a79b1 = array_combine_unique(container.var_8697902b8b8a79b1, players);
            var_ba03253452037335 = 1;
        }
    }
    if (!var_ba03253452037335) {
        return;
    }
    foreach (player in players) {
        if (!isdefined(player.var_320a8ba98ae41575)) {
            player.var_320a8ba98ae41575 = 0;
        }
        player.var_320a8ba98ae41575++;
        player namespace_48a08c5037514e04::doscoreevent(#"hash_9a68d11b1688325a");
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cc6
// Size: 0x32
function function_f3557caf4562bff7(container) {
    if (!isdefined(container) || !isdefined(container.var_46a3a8565ac0c17c)) {
        return 0;
    }
    return container.var_46a3a8565ac0c17c == 14;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d00
// Size: 0x73
function function_532eac3c428e5b9b(container) {
    if (!isdefined(container.var_46a3a8565ac0c17c)) {
        return 0;
    }
    return container.var_46a3a8565ac0c17c == 13 || container.var_46a3a8565ac0c17c == 15 || container.var_46a3a8565ac0c17c == 17 || container.var_46a3a8565ac0c17c == 18 || container.var_46a3a8565ac0c17c == 19;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d7b
// Size: 0x61
function function_54066dbd8ef44fe1(container) {
    if (!isdefined(container.var_46a3a8565ac0c17c)) {
        return 0;
    }
    return container.var_46a3a8565ac0c17c == 16 || container.var_46a3a8565ac0c17c == 6 || container.var_46a3a8565ac0c17c >= 7 && container.var_46a3a8565ac0c17c <= 12;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4de4
// Size: 0x146
function function_86d77b1dbd44b06e(opener, container, var_4472b62c1fa150e5) {
    level endon("game_ended");
    opener endon("death_or_disconnect");
    opener endon("enter_live_ragdoll");
    container endon("death");
    waittime = 0.35;
    var_97072eeae32ebd38 = getdvarfloat(@"hash_d9e519d9c89af2f3", 0);
    if (var_97072eeae32ebd38 > 0) {
        waittime = var_97072eeae32ebd38;
    }
    container waittill_any_timeout_1(waittime, "closed");
    if (!isreallyalive(opener)) {
        return;
    }
    if (var_4472b62c1fa150e5) {
        var_95592165f5ba7fb4 = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", namespace_cd0b2d039510b38d::getsubgametype(), "_lootingSpecialXPOverride"), 0);
        if (var_95592165f5ba7fb4 == 0) {
            var_95592165f5ba7fb4 = undefined;
        }
        opener thread namespace_48a08c5037514e04::doscoreevent(#"hash_f396d39fee1a8054", undefined, undefined, var_95592165f5ba7fb4);
        opener playsoundtoplayer("uin_loot_container_open_epic", opener);
    } else {
        var_4b5a99c16abfdfb1 = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", namespace_cd0b2d039510b38d::getsubgametype(), "_lootingXPOverride"), 0);
        if (var_4b5a99c16abfdfb1 == 0) {
            var_4b5a99c16abfdfb1 = undefined;
        }
        opener thread namespace_48a08c5037514e04::doscoreevent(#"br_cacheopen", undefined, undefined, var_4b5a99c16abfdfb1);
        opener playsoundtoplayer("uin_loot_container_open_common", opener);
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f31
// Size: 0x240
function function_1791c1e8974e9bd7(player, lootid, quantity, weaponref, var_cc768ff46f3f6339, var_96c7526f4ab04875, var_7591ed99e87a77d3, var_4a08890fd43d6bc7) {
    ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    success = 0;
    if (ref == "cash") {
        var_3466c10973e9c476 = namespace_c6ccccd95254983f::getplundernamebyamount(quantity);
        var_60227bff1e9478cc = spawnstruct();
        var_60227bff1e9478cc.scriptablename = var_3466c10973e9c476;
        var_60227bff1e9478cc.var_8598d3d3bc3d9ceb = 1;
        var_60227bff1e9478cc.count = quantity;
        player namespace_cb965d2f71fefddc::playpickupfeedback(var_60227bff1e9478cc);
        player namespace_c6ccccd95254983f::playerplunderpickup(quantity, undefined, undefined, 1);
        player namespace_aad14af462a74d08::onpickupitem("plunder");
        success = 1;
    } else if (ref == "dmz_loot_quest_intel" || ref == "dmz_trap_quest_trigger") {
        player namespace_cb965d2f71fefddc::function_37be6e543436f3b3(lootid, undefined, 1);
        success = 1;
    } else if (namespace_d3d40f75bb4e4c32::isammo(ref)) {
        success = player namespace_cb965d2f71fefddc::function_54dac56d15dd3d93(ref, lootid, quantity, 1);
    } else if (namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(lootid) && namespace_85cd45b4fe0d86fb::function_d9f5c5090de1241b(player, quantity)) {
        var_c0014462498c439d = namespace_85cd45b4fe0d86fb::getdogtagvictimandkiller(quantity);
        _ = var_c0014462498c439d[1];
        victimindex = var_c0014462498c439d[0];
        var_773f62bf746fc586 = level.dogtaginfo[victimindex].player;
        if (isdefined(var_773f62bf746fc586)) {
            namespace_85cd45b4fe0d86fb::function_8e643d6706defeea(var_773f62bf746fc586, quantity);
        }
        if (!isdefined(var_773f62bf746fc586) || var_773f62bf746fc586 != player) {
            namespace_d696adde758cbe79::showdmzsplash("dmz_recover_dog_tag", [0:player], undefined);
        }
        success = 1;
    } else if (istrue(isweaponitem(lootid))) {
        var_4a08890fd43d6bc7 = istrue(var_4a08890fd43d6bc7) && namespace_aead94004cf4c147::function_b13e35608b336d65(player) >= 7 && !namespace_aead94004cf4c147::function_efab78b72d131d76(player);
        success = player namespace_cb965d2f71fefddc::function_d8cd9c1941a88194(lootid, quantity, weaponref, 1, undefined, undefined, var_96c7526f4ab04875, var_7591ed99e87a77d3, var_cc768ff46f3f6339, var_4a08890fd43d6bc7);
    } else {
        success = player namespace_cb965d2f71fefddc::function_d8cd9c1941a88194(lootid, quantity, weaponref, 1, !istrue(var_cc768ff46f3f6339), undefined, var_96c7526f4ab04875, var_7591ed99e87a77d3, var_cc768ff46f3f6339);
    }
    return success;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5179
// Size: 0x1e3
function function_a335aa664caa37c9(player, container) {
    if (istrue(player.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
        return;
    }
    lootid = namespace_aead94004cf4c147::function_d9b1550011525161(player);
    var_6064fb4b46498174 = container;
    container = function_59b9c8081b873a10(player, container);
    if (!isdefined(container.var_6fb67c8525b1d79e)) {
        return;
    }
    var_c161ec212069668d = 1;
    foreach (weaponobj in player.primaryinventory) {
        if (weaponobj.basename == "iw9_me_fists_mp") {
            var_c161ec212069668d = 0;
            break;
        }
    }
    if (var_c161ec212069668d && namespace_aead94004cf4c147::function_efab78b72d131d76(player)) {
        namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.br_pickupdenyequipnoroom);
        return;
    }
    function_60d2295ccc45d8c0(player, lootid, 1, var_6064fb4b46498174);
    if (!var_c161ec212069668d) {
        namespace_3f0ea7483345a2c0::function_a92926d5b02cf6ed(player, var_6064fb4b46498174);
        return;
    }
    var_c0014162498c3d04 = function_775a7fc396485a9a(player, container);
    _ = var_c0014162498c3d04[6];
    _ = var_c0014162498c3d04[5];
    _ = var_c0014162498c3d04[4];
    metadata = var_c0014162498c3d04[3];
    var_e1147886ccf51970 = var_c0014162498c3d04[2];
    weaponobj = var_c0014162498c3d04[1];
    _ = var_c0014162498c3d04[0];
    namespace_aead94004cf4c147::function_e35a7cb7e7c8c17e(player, weaponobj, undefined, metadata);
    namespace_3bcd40a3005712ec::function_ae30366a2d519a57(player, 2, var_e1147886ccf51970);
    function_505e8eb7e77704c5(player, var_6064fb4b46498174);
    player playsoundtoplayer("br_pickup_weap", player);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5363
// Size: 0x362
function function_2f00ca0526f3edc6(player, index, quantity, container, var_cc768ff46f3f6339) {
    lootid = 0;
    var_35eabffb2f0f31e3 = 0;
    var_c0013862498c2939 = function_edb397974ae6ee68(player, container, index, var_cc768ff46f3f6339);
    var_35eabffb2f0f31e3 = var_c0013862498c2939[1];
    lootid = var_c0013862498c2939[0];
    if (lootid == 0 || var_35eabffb2f0f31e3 == 0) {
        return;
    }
    weaponref = function_4b96aa12974840c0(player, container, index);
    var_609578472524b507 = undefined;
    var_4a08890fd43d6bc7 = undefined;
    if (isdefined(weaponref)) {
        if (istrue(player.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
            player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
            return;
        }
        var_60227bff1e9478cc = spawnstruct();
        var_60227bff1e9478cc.scriptablename = weaponref;
        var_4a08890fd43d6bc7 = 1;
        newweapon = namespace_3bcd40a3005712ec::function_55c5d35c8c76a95b(var_60227bff1e9478cc)[0];
        foreach (weap in self.primaryweapons) {
            if (issameweapon(weap, newweapon)) {
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(newweapon));
                var_35eabffb2f0f31e3 = weaponclipsize(newweapon);
                quantity = var_35eabffb2f0f31e3;
                var_609578472524b507 = 1;
                break;
            }
        }
    }
    var_cb325ddb4a764623 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    if (isdefined(var_cb325ddb4a764623) && var_cb325ddb4a764623 == "cash") {
        var_b3d7d06e99efd05e = function_53c4c53197386572(player.plundercount, 0);
        maxplunder = function_53c4c53197386572(level.br_plunder.plunderlimit, var_b3d7d06e99efd05e + var_35eabffb2f0f31e3);
        if (var_b3d7d06e99efd05e + var_35eabffb2f0f31e3 > level.br_plunder.plunderlimit) {
            quantity = level.br_plunder.plunderlimit - var_b3d7d06e99efd05e;
        }
    }
    if (!isdefined(quantity)) {
        quantity = var_35eabffb2f0f31e3;
    }
    /#
        assert(var_35eabffb2f0f31e3 >= quantity, "Attempting to loot a higher quantity than what is available.");
    #/
    if (lootid == 0 || quantity == 0) {
        return 1;
    }
    var_96c7526f4ab04875 = distance2d(container.origin, player.origin) / 2;
    var_7591ed99e87a77d3 = undefined;
    if (function_f3557caf4562bff7(container)) {
        var_7591ed99e87a77d3 = container.origin;
    }
    success = function_1791c1e8974e9bd7(player, lootid, quantity, weaponref, var_cc768ff46f3f6339, var_96c7526f4ab04875, var_7591ed99e87a77d3, var_4a08890fd43d6bc7);
    if (success || istrue(var_609578472524b507)) {
        var_a28bd7f30254c8a0 = var_35eabffb2f0f31e3 - quantity;
        var_699de62155c8c832 = lootid;
        function_60d2295ccc45d8c0(player, var_699de62155c8c832, quantity, container);
        if (namespace_3c37cb17ade254d::issharedfuncdefined("pmc_missions", "onContainerLooted")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("pmc_missions", "onContainerLooted") ]](player, var_699de62155c8c832, quantity, container);
        }
        function_153d3281e46e14da(player, container, index, var_699de62155c8c832, var_a28bd7f30254c8a0);
        function_f3c9e05d4767d037(lootid, player, container, index);
    }
    return success;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56cd
// Size: 0x27c
function function_a92926d5b02cf6ed(player, container, itemtype, var_96c7526f4ab04875) {
    if (!isdefined(container)) {
        return 1;
    }
    if (istrue(player.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
        return;
    }
    var_c0173f6249a46bd1 = function_775a7fc396485a9a(player, container);
    var_cf4fd93a53325100 = var_c0173f6249a46bd1[6];
    var_18c2c5b0a787d075 = var_c0173f6249a46bd1[5];
    quantity = var_c0173f6249a46bd1[4];
    metadata = var_c0173f6249a46bd1[3];
    var_e1147886ccf51970 = var_c0173f6249a46bd1[2];
    var_6fb67c8525b1d79e = var_c0173f6249a46bd1[1];
    _ = var_c0173f6249a46bd1[0];
    if (!isdefined(var_6fb67c8525b1d79e)) {
        return 1;
    }
    weapon = var_6fb67c8525b1d79e;
    foreach (weap in self.primaryweapons) {
        if (issameweapon(weap, weapon)) {
            namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.br_pickupdenyalreadyhaveweapon);
            return;
        }
    }
    if (namespace_aead94004cf4c147::function_efab78b72d131d76(player)) {
        var_4d2b659118f5c515 = namespace_aead94004cf4c147::function_2985254128b1c262(player);
        if (issameweapon(var_4d2b659118f5c515, weapon)) {
            namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.br_pickupdenyalreadyhaveweapon);
            return;
        }
    }
    quantity = function_53c4c53197386572(quantity, weaponclipsize(weapon));
    var_7591ed99e87a77d3 = undefined;
    if (function_f3557caf4562bff7(container)) {
        var_7591ed99e87a77d3 = container.origin;
    }
    namespace_cb965d2f71fefddc::function_e5845ff9b61ac5d7(weapon, quantity, undefined, var_18c2c5b0a787d075, undefined, undefined, metadata, var_96c7526f4ab04875, var_7591ed99e87a77d3, undefined, var_cf4fd93a53325100);
    weaponindex = namespace_3bcd40a3005712ec::function_2ab3bda08c595a32(player, weapon);
    if (isdefined(weaponindex)) {
        namespace_3bcd40a3005712ec::function_ae30366a2d519a57(player, weaponindex, var_e1147886ccf51970);
    }
    namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("pmc_missions", "onPickupWeapon", player, var_6fb67c8525b1d79e, metadata);
    function_505e8eb7e77704c5(player, container);
    if (function_f3557caf4562bff7(container)) {
        player setclientomnvar("loot_container_open", 0);
        container notify("closed");
        namespace_cb965d2f71fefddc::loothide(container);
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5950
// Size: 0x362
function function_3ae3712fe76d0c6a(player, index, loadoutindex, container) {
    lootid = 0;
    quantity = 0;
    var_96c7526f4ab04875 = distance2d(container.origin, self.origin) / 2;
    if (function_c3d68fb7b175edd(player, container) && loadoutindex != 0) {
        function_e183b2e94298bb75(loadoutindex, player, container, 0);
    } else {
        var_c017426249a4726a = function_edb397974ae6ee68(player, container, index);
        quantity = var_c017426249a4726a[1];
        lootid = var_c017426249a4726a[0];
    }
    if (lootid == 0 || quantity == 0) {
        return;
    }
    ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    if (function_430df78a3a4143c1(player, container, index)) {
        ref = container.contents[index]["ref"];
    }
    var_10bbeacb1429824e = 0;
    if (namespace_d3d40f75bb4e4c32::isammo(ref)) {
        var_bada25504e8844d7 = spawnstruct();
        var_bada25504e8844d7.scriptablename = ref;
        var_bada25504e8844d7.count = quantity;
        if (function_f3557caf4562bff7(container)) {
            var_bada25504e8844d7.origin = container.origin;
        }
        player namespace_aead94004cf4c147::additemtobackpack(lootid, var_bada25504e8844d7);
    } else if (namespace_cb965d2f71fefddc::function_5449da9d3d0358a4(ref)) {
        namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_fde0e27b3a09bf3);
        return;
    } else if (function_430df78a3a4143c1(player, container, index)) {
        if (istrue(player.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
            player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
            return;
        }
        var_7591ed99e87a77d3 = undefined;
        if (function_f3557caf4562bff7(container)) {
            var_7591ed99e87a77d3 = container.origin;
        }
        if (loadoutindex > 0) {
            namespace_cb965d2f71fefddc::function_62f068cec343a111(player, 1, loadoutindex - 1, undefined, 0, 0, var_96c7526f4ab04875, var_7591ed99e87a77d3);
        }
        weaponobj = namespace_cb965d2f71fefddc::getfullweaponobjforscriptablepartname(ref);
        quantity = weaponclipsize(weaponobj);
        success = namespace_cb965d2f71fefddc::function_e5845ff9b61ac5d7(weaponobj, quantity, undefined, undefined, undefined, undefined, undefined, var_96c7526f4ab04875, var_7591ed99e87a77d3, undefined, quantity);
        if (namespace_3c37cb17ade254d::issharedfuncdefined("pmc_missions", "onPickupWeapon")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("pmc_missions", "onPickupWeapon") ]](player, weaponobj);
        }
        if (!istrue(success)) {
            return;
        }
    } else {
        var_6a80b9f81cd7ad99 = undefined;
        if (getdvarint(@"hash_1903ee79b0fffb17", 0)) {
            var_6a80b9f81cd7ad99 = namespace_aead94004cf4c147::getavailabledmzbackpackindex();
        }
        var_7591ed99e87a77d3 = undefined;
        if (function_f3557caf4562bff7(container)) {
            var_7591ed99e87a77d3 = container.origin;
        }
        var_10bbeacb1429824e = namespace_cb965d2f71fefddc::function_fe539e37b6579930(lootid, quantity, var_6a80b9f81cd7ad99, undefined, undefined, undefined, var_96c7526f4ab04875, var_7591ed99e87a77d3);
        if (!isdefined(var_10bbeacb1429824e)) {
            return;
        }
    }
    function_60d2295ccc45d8c0(player, lootid, quantity, container);
    if (function_f3557caf4562bff7(container)) {
        player setclientomnvar("loot_container_open", 0);
        container notify("closed");
        namespace_cb965d2f71fefddc::loothide(container);
        return;
    }
    var_4327207228ce0185 = lootid;
    lootid = ter_op(var_10bbeacb1429824e == 0, 0, lootid);
    function_153d3281e46e14da(player, container, index, lootid, quantity);
    function_f3c9e05d4767d037(var_4327207228ce0185, player, container, index);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cb9
// Size: 0xb2d
function function_f0617ad70b7e7792(var_8817e4fbe0f63228, backpackslot, container) {
    if (!isalive(self)) {
        return;
    }
    if (function_f3557caf4562bff7(container) && isdefined(self.var_e0c39101bfc15d2) && istrue(self.var_e0c39101bfc15d2[backpackslot])) {
        self setclientomnvar("loot_container_open", 0);
        container notify("closed");
        return;
    }
    if (backpackslot == 100) {
        if (istrue(self.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
            namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
            return;
        }
        if (namespace_3c37cb17ade254d::issharedfuncdefined("pmc_missions", "onPickupWeapon")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("pmc_missions", "onPickupWeapon") ]](self);
        }
        if (namespace_aead94004cf4c147::function_efab78b72d131d76(self)) {
            var_fcbb55496a5ba4cb = namespace_aead94004cf4c147::function_2985254128b1c262(self);
            var_45d3e9c928ee2a64 = getcompleteweaponname(var_fcbb55496a5ba4cb);
            dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
            if (isdefined(container.dropstruct)) {
                dropstruct = container.dropstruct;
            }
            var_7591ed99e87a77d3 = undefined;
            if (function_f3557caf4562bff7(container)) {
                var_7591ed99e87a77d3 = container.origin;
            }
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, undefined, undefined, undefined, undefined, var_7591ed99e87a77d3);
            item = namespace_cb965d2f71fefddc::spawnpickup(var_45d3e9c928ee2a64, var_cb4fad49263e20c4, 1, 1, var_fcbb55496a5ba4cb, 0);
            var_96c4059aa2eabfb8 = undefined;
            if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
                var_96c4059aa2eabfb8 = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, 2);
                if (isdefined(var_96c4059aa2eabfb8)) {
                    item.metadata = var_96c4059aa2eabfb8;
                }
            }
            item.var_e1147886ccf51970 = namespace_3bcd40a3005712ec::function_86a5c7670325346b(self, 2);
            namespace_aead94004cf4c147::function_954372d604277278(self);
        }
        var_c017436249a4749d = function_775a7fc396485a9a(self, container, var_8817e4fbe0f63228);
        var_cf4fd93a53325100 = var_c017436249a4749d[6];
        _ = var_c017436249a4749d[5];
        quantity = var_c017436249a4749d[4];
        metadata = var_c017436249a4749d[3];
        var_e1147886ccf51970 = var_c017436249a4749d[2];
        weaponobj = var_c017436249a4749d[1];
        lootid = var_c017436249a4749d[0];
        if (!isdefined(weaponobj)) {
            return;
        }
        quantity = function_53c4c53197386572(quantity, weaponclipsize(weaponobj));
        self setweaponammoclip(weaponobj, quantity);
        if (namespace_68e641469fde3fa7::isakimbo(weaponobj)) {
            var_cf4fd93a53325100 = function_53c4c53197386572(var_cf4fd93a53325100, weaponclipsize(weaponobj));
            self setweaponammoclip(weaponobj, var_cf4fd93a53325100, "left");
        }
        namespace_aead94004cf4c147::function_e35a7cb7e7c8c17e(self, weaponobj, 1);
        namespace_3bcd40a3005712ec::function_ae30366a2d519a57(self, 2, var_e1147886ccf51970);
        if (namespace_3c37cb17ade254d::issharedfuncdefined("pmc_missions", "onPickupWeapon")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("pmc_missions", "onPickupWeapon") ]](self, weaponobj, metadata);
        }
        function_505e8eb7e77704c5(self, container, var_8817e4fbe0f63228);
        return;
    }
    var_c017406249a46e04 = function_edb397974ae6ee68(self, container, var_8817e4fbe0f63228);
    var_ea1dcc638e88b8c9 = var_c017406249a46e04[1];
    var_879d3e9d5c72b703 = var_c017406249a46e04[0];
    var_b358c0df5898a29b = namespace_38b993c4618e76cd::getscriptablefromlootid(var_879d3e9d5c72b703);
    var_c017416249a47037 = namespace_aead94004cf4c147::function_6738846da50730f1(backpackslot);
    var_dfab44d4d8d10b36 = var_c017416249a47037[1];
    var_f27898e4afd922b4 = var_c017416249a47037[0];
    var_2789584b4d4cb228 = namespace_38b993c4618e76cd::getscriptablefromlootid(var_f27898e4afd922b4);
    var_ab2190c9f802c652 = isdefined(var_b358c0df5898a29b) && namespace_708f627020de59d3::function_43044da0ed44d79f(var_b358c0df5898a29b);
    var_fa65d19c2d55b80d = isdefined(var_2789584b4d4cb228) && namespace_708f627020de59d3::function_43044da0ed44d79f(var_2789584b4d4cb228);
    var_3c295612e84d714 = isdefined(var_2789584b4d4cb228) && namespace_cb965d2f71fefddc::function_e4b6260dbb04b43d(var_2789584b4d4cb228);
    if (function_f3557caf4562bff7(container) && namespace_3c37cb17ade254d::issharedfuncdefined(var_f27898e4afd922b4, "canQuickDrop")) {
        if (!namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2(var_f27898e4afd922b4, "canQuickDrop", self)) {
            self setclientomnvar("loot_container_open", 0);
            container notify("closed");
            namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_58d0559b458fd450);
            return;
        }
    }
    if (var_fa65d19c2d55b80d) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        if (isdefined(container.dropstruct)) {
            dropstruct = container.dropstruct;
        }
        dropstruct.var_dfba5a2c3c6f0a07 = backpackslot;
        var_7591ed99e87a77d3 = undefined;
        if (function_f3557caf4562bff7(container)) {
            var_7591ed99e87a77d3 = container.origin;
        }
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, undefined, undefined, undefined, undefined, var_7591ed99e87a77d3);
        perkdata = namespace_708f627020de59d3::function_3634d41e203bc04e(backpackslot);
        if (isdefined(perkdata.perks)) {
            var_cb4fad49263e20c4.var_a0597a25c511b0ac = [0:#"customperkpackage"];
            foreach (perk in perkdata.perks) {
                var_cb4fad49263e20c4.var_a0597a25c511b0ac[var_cb4fad49263e20c4.var_a0597a25c511b0ac.size] = namespace_38b993c4618e76cd::getlootidfromref(perk);
            }
        }
        var_dfab44d4d8d10b36 = 1;
        item = namespace_cb965d2f71fefddc::spawnpickup(var_2789584b4d4cb228, var_cb4fad49263e20c4, var_dfab44d4d8d10b36, 1, undefined, 0);
        namespace_708f627020de59d3::function_bbb44bd3b8347efc(backpackslot, item);
    } else if (var_3c295612e84d714) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        if (isdefined(container.dropstruct)) {
            dropstruct = container.dropstruct;
        }
        var_7591ed99e87a77d3 = undefined;
        if (function_f3557caf4562bff7(container)) {
            var_7591ed99e87a77d3 = container.origin;
        }
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, undefined, undefined, undefined, undefined, var_7591ed99e87a77d3);
        namespace_6c622b52017c6808::function_3a7809be256adadb(var_cb4fad49263e20c4, self);
        element = namespace_cb965d2f71fefddc::spawnpickup(var_2789584b4d4cb228, var_cb4fad49263e20c4, var_dfab44d4d8d10b36, 1, undefined, 0);
        namespace_6c622b52017c6808::function_a5130b39363778b7(self, element, backpackslot);
    } else if (namespace_cb965d2f71fefddc::function_282d89f7705a2d63(var_2789584b4d4cb228)) {
        namespace_cb965d2f71fefddc::function_bfc82c27ed3d9308(var_f27898e4afd922b4, var_dfab44d4d8d10b36, var_2789584b4d4cb228, backpackslot);
    }
    namespace_aead94004cf4c147::function_db1dd76061352e5b(backpackslot, var_dfab44d4d8d10b36);
    var_60227bff1e9478cc = spawnstruct();
    var_60227bff1e9478cc.scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(var_879d3e9d5c72b703);
    var_60227bff1e9478cc.count = var_ea1dcc638e88b8c9;
    var_60227bff1e9478cc.var_8598d3d3bc3d9ceb = 1;
    var_60227bff1e9478cc.origin = container.origin;
    var_60227bff1e9478cc.dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    var_60227bff1e9478cc.instance = container;
    if (namespace_cb965d2f71fefddc::function_2d86ba79a58bb62(var_60227bff1e9478cc.scriptablename)) {
        var_60227bff1e9478cc.blacksite = container.blacksite;
        var_60227bff1e9478cc.originalteam = container.originalteam;
    }
    if (var_ab2190c9f802c652) {
        namespace_708f627020de59d3::function_1ca82d98d7519e1f(backpackslot, container);
        quantity = 1;
        var_99d72c999b9a85fa = 0;
        if (isdefined(container.perks)) {
            var_c01bc46249a98627 = namespace_cb965d2f71fefddc::function_b29b252cdfa9a7d6(container.perks);
            var_99d72c999b9a85fa = var_c01bc46249a98627[1];
            quantity = var_c01bc46249a98627[0];
        }
        namespace_aead94004cf4c147::function_11f48ae5b87b4525(self, backpackslot, var_879d3e9d5c72b703, quantity, var_99d72c999b9a85fa);
    } else if (namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(var_879d3e9d5c72b703) && namespace_85cd45b4fe0d86fb::function_d9f5c5090de1241b(self, var_ea1dcc638e88b8c9)) {
        var_c01bc36249a983f4 = namespace_85cd45b4fe0d86fb::getdogtagvictimandkiller(var_ea1dcc638e88b8c9);
        _ = var_c01bc36249a983f4[1];
        victimindex = var_c01bc36249a983f4[0];
        var_773f62bf746fc586 = level.dogtaginfo[victimindex].player;
        if (isdefined(var_773f62bf746fc586)) {
            namespace_85cd45b4fe0d86fb::function_8e643d6706defeea(var_773f62bf746fc586, var_ea1dcc638e88b8c9);
        }
        if (!isdefined(var_773f62bf746fc586) || var_773f62bf746fc586 != self) {
            namespace_d696adde758cbe79::showdmzsplash("dmz_recover_dog_tag", [0:self], undefined);
        }
    } else {
        namespace_aead94004cf4c147::additemtobackpack(var_879d3e9d5c72b703, var_60227bff1e9478cc);
        namespace_cb965d2f71fefddc::onpickuptakenintobackpack(var_60227bff1e9478cc);
        namespace_cb965d2f71fefddc::playpickupfeedback(var_60227bff1e9478cc);
        if (!function_f3557caf4562bff7(container)) {
            function_60d2295ccc45d8c0(self, var_879d3e9d5c72b703, var_ea1dcc638e88b8c9, container);
        } else {
            namespace_cb965d2f71fefddc::function_56dd1faa25a3414f(self, var_60227bff1e9478cc, 0, 20);
        }
    }
    if (!getdvarint(@"hash_8b40bee5a7e0fc04", 0) || function_f3557caf4562bff7(container) || function_54066dbd8ef44fe1(container)) {
        function_153d3281e46e14da(self, container, var_8817e4fbe0f63228, 0, 0);
        maxcount = level.br_pickups.var_4138f9ddc1cd22d[var_60227bff1e9478cc.scriptablename];
        if (!isdefined(maxcount) || maxcount == 0) {
            maxcount = level.br_pickups.maxcounts[var_60227bff1e9478cc.scriptablename];
        }
        dropstruct = var_60227bff1e9478cc.dropstruct;
        if (isdefined(container.dropstruct)) {
            dropstruct = container.dropstruct;
        }
        if (!var_fa65d19c2d55b80d && !var_3c295612e84d714) {
            var_7591ed99e87a77d3 = undefined;
            var_284fd7f2566f4eb5 = 1;
            scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(var_f27898e4afd922b4);
            if (function_f3557caf4562bff7(container)) {
                if (getdvarint(@"hash_8367f78074282ef0", 0) && istrue(container.var_343c584e7e00192)) {
                    loadouttype = level.br_pickups.br_itemtype[var_60227bff1e9478cc.scriptablename];
                    var_14ab898d93fd9b3f = level.br_pickups.br_itemtype[scriptablename];
                    if (isdefined(loadouttype) && isdefined(var_14ab898d93fd9b3f) && loadouttype == var_14ab898d93fd9b3f) {
                        namespace_cb965d2f71fefddc::function_fe539e37b6579930(var_f27898e4afd922b4, var_dfab44d4d8d10b36);
                        var_284fd7f2566f4eb5 = 0;
                    }
                }
                if (!istrue(container.var_343c584e7e00192) && dropstruct.dropcount < 1) {
                    var_7591ed99e87a77d3 = container.origin;
                }
            }
            if (var_284fd7f2566f4eb5) {
                if (namespace_cb965d2f71fefddc::function_2d86ba79a58bb62(scriptablename)) {
                    namespace_bd614c3c2275579a::function_f9ff7c89b3792ccc(dropstruct, self.blacksite);
                } else {
                    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, undefined, undefined, undefined, undefined, var_7591ed99e87a77d3);
                    newent = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, var_dfab44d4d8d10b36, 1, undefined, 0);
                    if (isdefined(newent)) {
                        namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2(scriptablename, "dropped", newent, self, var_cb4fad49263e20c4.origin);
                    }
                }
            }
        }
    } else {
        function_153d3281e46e14da(self, container, var_8817e4fbe0f63228, var_f27898e4afd922b4, var_dfab44d4d8d10b36);
        if (getdvarint(@"hash_c85a9bcc06a81a1f", 0)) {
            if (!isdefined(container.var_2568210352be1ecf)) {
                container.var_2568210352be1ecf = [];
            }
            container.var_2568210352be1ecf[var_8817e4fbe0f63228] = [];
            container.var_2568210352be1ecf[var_8817e4fbe0f63228]["lootID"] = var_f27898e4afd922b4;
            container.var_2568210352be1ecf[var_8817e4fbe0f63228]["quantity"] = var_dfab44d4d8d10b36;
        }
    }
    if (function_f3557caf4562bff7(container)) {
        self setclientomnvar("loot_container_open", 0);
        container notify("closed");
        namespace_cb965d2f71fefddc::loothide(container);
    }
    function_f3c9e05d4767d037(var_879d3e9d5c72b703, self, container, var_8817e4fbe0f63228);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67ed
// Size: 0x239
function function_e183b2e94298bb75(loadoutindex, player, container, itemtype) {
    if (istrue(player.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
        return;
    }
    var_c01bc66249a98a8d = function_775a7fc396485a9a(player, container);
    _ = var_c01bc66249a98a8d[6];
    _ = var_c01bc66249a98a8d[5];
    quantity = var_c01bc66249a98a8d[4];
    metadata = var_c01bc66249a98a8d[3];
    var_e1147886ccf51970 = var_c01bc66249a98a8d[2];
    var_6fb67c8525b1d79e = var_c01bc66249a98a8d[1];
    lootid = var_c01bc66249a98a8d[0];
    if (!isdefined(var_6fb67c8525b1d79e)) {
        return;
    }
    namespace_cb965d2f71fefddc::function_62f068cec343a111(player, 1, loadoutindex - 1, undefined, 0, 0);
    var_45d3e9c928ee2a64 = getcompleteweaponname(var_6fb67c8525b1d79e);
    var_d8aea6bbfacdff1 = undefined;
    if (isdefined(var_6fb67c8525b1d79e.basename)) {
        var_d8aea6bbfacdff1 = var_6fb67c8525b1d79e.basename;
    } else {
        var_d8aea6bbfacdff1 = getweaponbasename(var_6fb67c8525b1d79e);
    }
    var_7591ed99e87a77d3 = undefined;
    if (function_f3557caf4562bff7(container)) {
        var_7591ed99e87a77d3 = container.origin;
    }
    success = namespace_3bcd40a3005712ec::br_forcegivecustomweapon(player, var_6fb67c8525b1d79e, var_45d3e9c928ee2a64, var_d8aea6bbfacdff1, undefined, undefined, var_7591ed99e87a77d3, undefined, var_e1147886ccf51970);
    if (success) {
        weaponslot = 0;
        var_5cedeaa00f81a480 = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(player, 0);
        var_1859b2a5c0f86ed0 = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(player, 1);
        if (isdefined(var_5cedeaa00f81a480) && var_5cedeaa00f81a480 == var_6fb67c8525b1d79e) {
            weaponslot = 0;
        } else if (isdefined(var_1859b2a5c0f86ed0) && var_1859b2a5c0f86ed0 == var_6fb67c8525b1d79e) {
            weaponslot = 1;
        }
        namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("pmc_missions", "onPickupWeapon", player, var_6fb67c8525b1d79e, metadata);
        namespace_a38a2e1fe7519183::function_5d94b2dfabbc4cce(player, var_6fb67c8525b1d79e, weaponslot, 1, metadata);
        function_505e8eb7e77704c5(player, container);
        if (function_f3557caf4562bff7(container)) {
            player setclientomnvar("loot_container_open", 0);
            container notify("closed");
            namespace_cb965d2f71fefddc::loothide(container);
        }
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a2d
// Size: 0x223
function function_68ca06034b8aaccd(opener, container) {
    var_c01bc56249a9885a = function_438749eb7a7b738(container.contents, opener, container);
    var_77dc0a100921c5a7 = var_c01bc56249a9885a[1];
    items = var_c01bc56249a9885a[0];
    container.contents = items;
    opener.var_2fa5b49969def47 = container;
    opener.var_f2aa9ae949179907 = opener.origin;
    if (isdefined(container.var_bf8e5f003146af44)) {
        opener.var_f2aa9ae949179907 = rotatevectorinverted(opener.origin - container.var_bf8e5f003146af44.origin, container.var_bf8e5f003146af44.angles);
    }
    /#
        if (items.size > 11) {
            println("commonOption" + items.size + "<unknown string>" + 11 + "<unknown string>");
        }
    #/
    for (itemindex = 0; itemindex < 11; itemindex++) {
        if (itemindex <= var_77dc0a100921c5a7) {
            function_446c7ad7bcc70992(opener, container, itemindex, items[itemindex]["lootID"], items[itemindex]["quantity"], items[itemindex]["ref"]);
        } else {
            function_c7294f5b9b5006d5(opener, itemindex);
        }
    }
    opener setclientomnvar("loot_container_weapon", 0);
    if (!isdefined(container.var_46a3a8565ac0c17c)) {
        container.var_46a3a8565ac0c17c = 1;
    }
    var_46a3a8565ac0c17c = container.var_46a3a8565ac0c17c;
    foreach (player in level.players) {
        container disablescriptableplayeruse(player);
    }
    opener setclientomnvar("loot_container_open", var_46a3a8565ac0c17c);
    container thread function_71a59f067d5fe986(container, opener);
    container thread function_47b931d76ffd028f(container, opener);
    opener namespace_ede58c1e66c2c280::function_faa3cbec7243fe72();
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c57
// Size: 0x8b
function function_601d9afc257af3ff(player, var_e1d097c517c3af5b, container, var_cc768ff46f3f6339, quantity) {
    if (isdefined(container) && function_f3557caf4562bff7(container)) {
        return;
    }
    if (var_e1d097c517c3af5b == 100) {
        function_a335aa664caa37c9(player, container);
    } else {
        function_9d924aea120c2693(player, var_e1d097c517c3af5b, container);
        function_2f00ca0526f3edc6(player, var_e1d097c517c3af5b, quantity, container, var_cc768ff46f3f6339);
    }
    if (isdefined(container) && iscontainerempty(container, player) && function_6f45e7311f77eac4(player)) {
        function_68085c72d7b628ec(container, player);
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ce9
// Size: 0x1c8
function function_e146f016a8a7244f(notification, var_e1d097c517c3af5b) {
    if (istrue(level.infilcinematicactive)) {
        return;
    }
    if (isdefined(notification)) {
        if (!isdefined(self.var_2fa5b49969def47)) {
            return;
        }
        container = self.var_2fa5b49969def47;
        switch (notification) {
        case #"hash_31a47c100531f34f":
            function_601d9afc257af3ff(self, var_e1d097c517c3af5b, container, undefined, 1);
            break;
        case #"hash_b7e2e7e659da3043":
            function_601d9afc257af3ff(self, var_e1d097c517c3af5b, container);
            break;
        case #"hash_453445f0e586a78e":
            loadoutindex = var_e1d097c517c3af5b >> 8;
            itemtype = var_e1d097c517c3af5b & 255;
            if ((itemtype == 3 || itemtype == 150) && loadoutindex != 0) {
                function_e183b2e94298bb75(loadoutindex, self, container, itemtype);
            } else if (var_e1d097c517c3af5b == 100 || itemtype == 150) {
                function_a92926d5b02cf6ed(self, container, itemtype);
            } else {
                function_9d924aea120c2693(self, itemtype, container);
                function_3ae3712fe76d0c6a(self, itemtype, loadoutindex, container);
            }
            if (isdefined(container) && iscontainerempty(container, self) && function_6f45e7311f77eac4(self)) {
                function_68085c72d7b628ec(container, self);
            }
            break;
        case #"hash_fb84b605789df05e":
            if (isdefined(container)) {
                function_68085c72d7b628ec(container, self);
            }
            break;
        case #"hash_10217053947e341b":
            var_8817e4fbe0f63228 = var_e1d097c517c3af5b >> 8;
            backpackslot = var_e1d097c517c3af5b & 255;
            if (function_6f45e7311f77eac4(self) && isdefined(container)) {
                function_f0617ad70b7e7792(var_8817e4fbe0f63228, backpackslot, container);
            }
            if (isdefined(container) && iscontainerempty(container, self) && function_6f45e7311f77eac4(self)) {
                function_68085c72d7b628ec(container, self);
            }
            break;
        default:
            break;
        }
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6eb8
// Size: 0xc9
function function_9d924aea120c2693(player, var_e1d097c517c3af5b, container) {
    if (function_c26e54ffd0c8be94(container, var_e1d097c517c3af5b)) {
        return;
    }
    lootid = getlootidatcontainerindex(player, var_e1d097c517c3af5b, container);
    var_35eabffb2f0f31e3 = function_8e5978971b5dcd16(player, var_e1d097c517c3af5b, container);
    if (lootid == 0 || var_35eabffb2f0f31e3 == 0) {
        return;
    }
    var_4ab0c4b064f3c0ba = function_59b9c8081b873a10(player, container);
    contents = var_4ab0c4b064f3c0ba.contents;
    if (isdefined(contents[var_e1d097c517c3af5b]) && isdefined(contents[var_e1d097c517c3af5b]["callback"])) {
        thread [[ self.var_2fa5b49969def47.contents[var_e1d097c517c3af5b]["callback"] ]](self.var_2fa5b49969def47, player);
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f88
// Size: 0x1d
function function_55b384ecb923003e() {
    return function_53c4c53197386572(getmatchrulesdata("commonOption", "lootCacheInventoryStrip"), 1) == 1;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fad
// Size: 0x269
function function_c929a8ad95b46fda(container) {
    if (isdefined(container.type) && container.type == "br_loot_cache_april") {
        return 0;
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz" && !getdvarint(@"hash_597831555a246842", 0)) {
        return 1;
    }
    if (isdefined(container.type) && container.type != "br_loot_cache" && container.type != "br_reusable_loot_cache" && container.type != "br_loot_cache_yellow" && container.type != "br_loot_cache_yellow_quiet" && container.type != "br_loot_cache_lege" && container.type != "br_loot_cache_gulag" && container.type != "br_loot_cache_personal_supply" && container.type != "br_loot_cache_stronghold" && container.type != "br_loot_cache_blacksite" && container.type != "cache_medicine_cabinet" && container.type != "cache_cash_register" && container.type != "cache_cash_register_clean" && container.type != "cache_medical_box_wall" && container.type != "dmz_hidden_container_common" && container.type != "cache_duffel_bag_01" && container.type != "cache_duffel_bag_02" && container.type != "cache_weapon_locker" && container.type != "br_loot_cache_holiday_common" && container.type != "br_loot_cache_holiday_lege" && container.type != "br_loot_cache_holiday_dth" && container.type != "ob_loot_cache_large" && container.type != "br_loot_cache_roguesignal") {
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("shouldGametypeContainerUseStrip")) {
            return namespace_71073fa38f11492::runbrgametypefunc("shouldGametypeContainerUseStrip", container);
        }
        return 1;
    }
    if (!getdvarint(@"hash_f6c12cf19ac66121", 1)) {
        return 1;
    }
    return 0;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x721e
// Size: 0x1c
function function_4749c1a092e650bd() {
    return function_53c4c53197386572(getmatchrulesdata("commonOption", "aiBackpackDrop"), 0) == 1;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7242
// Size: 0x1d
function function_8306d72ea2e8889c() {
    return function_53c4c53197386572(getmatchrulesdata("commonOption", "playerBackpackDrop"), 1) == 1;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7267
// Size: 0x1d
function function_310ab06891cb4517() {
    return function_4749c1a092e650bd() || function_8306d72ea2e8889c() || function_55b384ecb923003e();
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x728c
// Size: 0x2a2
function getindexforlootidincontainer(container, lootid, player) {
    if (!isdefined(container)) {
        return [0:undefined, 1:undefined];
    }
    container = function_59b9c8081b873a10(player, container);
    if (!isdefined(container.contents) || !isdefined(lootid)) {
        return [0:undefined, 1:undefined];
    }
    if (namespace_3f0ea7483345a2c0::function_54066dbd8ef44fe1(container)) {
        foreach (index, item in container.contents) {
            if (!isdefined(item["lootID"]) || !isdefined(item["quantity"]) || item["lootID"] == 0 || item["quantity"] == 0) {
                continue;
            }
            if (item["lootID"] == lootid) {
                return [0:index, 1:0];
            }
        }
        if (isdefined(container.var_bf23a60678978c19)) {
            foreach (index, item in container.var_bf23a60678978c19) {
                if (!isdefined(item["lootID"]) || !isdefined(item["quantity"]) || item["lootID"] == 0 || item["quantity"] == 0) {
                    continue;
                }
                if (item["lootID"] == lootid) {
                    return [0:index, 1:1];
                }
            }
        }
        if (isdefined(container.var_a06e7128c001851d) && isdefined(container.var_a0e9fef038504bd0) && lootid == container.var_a06e7128c001851d) {
            return [0:100, 1:1];
        }
    }
    foreach (index, item in container.contents) {
        if (!isdefined(item["lootID"]) || !isdefined(item["quantity"]) || item["lootID"] == 0 || item["quantity"] == 0) {
            continue;
        }
        if (item["lootID"] == lootid) {
            return [0:index, 1:0];
        }
    }
    if (isdefined(container.var_4f6cde716e0c3d7) && lootid == container.var_4f6cde716e0c3d7) {
        return [0:100, 1:0];
    }
    return [0:undefined, 1:undefined];
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7536
// Size: 0x29
function function_59b9c8081b873a10(opener, container) {
    if (function_e3081772bbf7a51c(opener, container)) {
        return function_3aae4431f00c347f(opener, container);
    }
    return container;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7567
// Size: 0x91
function function_edb397974ae6ee68(opener, container, index, var_cc768ff46f3f6339) {
    var_42dcd1dafc60ca9 = function_c26e54ffd0c8be94(container, index);
    if (var_42dcd1dafc60ca9) {
        index = index - 11;
        lootid = getloadoutdoublebackpacklootid(container, index, var_cc768ff46f3f6339);
        var_35eabffb2f0f31e3 = function_dc8d7c1709adcd67(container, index, var_cc768ff46f3f6339);
    } else {
        lootid = getlootidatcontainerindex(opener, index, container, var_cc768ff46f3f6339);
        var_35eabffb2f0f31e3 = function_8e5978971b5dcd16(opener, index, container, var_cc768ff46f3f6339);
    }
    return [0:lootid, 1:var_35eabffb2f0f31e3];
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7600
// Size: 0x9e
function function_3f23dfe9eb1bee5f(opener, container, index, quantity) {
    if (!isdefined(container)) {
        return;
    }
    if (function_c26e54ffd0c8be94(container, index)) {
        container.var_bf23a60678978c19[index - 11]["quantity"] = quantity;
    } else if (function_e3081772bbf7a51c(opener, container)) {
        container.var_556db0b72a96514e[opener.guid].contents[index]["quantity"] = quantity;
    } else {
        container.contents[index]["quantity"] = quantity;
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76a5
// Size: 0x9e
function function_69532a81d0171769(opener, container, index, lootid) {
    if (!isdefined(container)) {
        return;
    }
    if (function_c26e54ffd0c8be94(container, index)) {
        container.var_bf23a60678978c19[index - 11]["lootID"] = lootid;
    } else if (function_e3081772bbf7a51c(opener, container)) {
        container.var_556db0b72a96514e[opener.guid].contents[index]["lootID"] = lootid;
    } else {
        container.contents[index]["lootID"] = lootid;
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x774a
// Size: 0xad
function function_153d3281e46e14da(opener, container, index, lootid, quantity) {
    if (!isdefined(container) || !isdefined(opener) || !isdefined(index) || !isdefined(lootid) || !isdefined(quantity)) {
        return;
    }
    lootid = ter_op(lootid > 0, lootid, 0);
    quantity = ter_op(quantity > 0, quantity, 0);
    if (lootid == 0 || quantity == 0) {
        lootid = 0;
        quantity = 0;
    }
    function_69532a81d0171769(opener, container, index, lootid);
    function_3f23dfe9eb1bee5f(opener, container, index, quantity);
    var_c3ee5296b29cb5f6 = function_59b9c8081b873a10(opener, container);
    function_446c7ad7bcc70992(opener, var_c3ee5296b29cb5f6, index, lootid, quantity);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77fe
// Size: 0x6c
function function_c3d68fb7b175edd(opener, container) {
    if (!isdefined(container)) {
        return 0;
    }
    if (isdefined(container.var_a06e7128c001851d) && isdefined(container.var_a0e9fef038504bd0)) {
        return 1;
    }
    var_4ab0c4b064f3c0ba = function_59b9c8081b873a10(opener, container);
    return isdefined(var_4ab0c4b064f3c0ba.var_4f6cde716e0c3d7) && isdefined(var_4ab0c4b064f3c0ba.var_6fb67c8525b1d79e);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7872
// Size: 0x1ff
function function_775a7fc396485a9a(opener, container, index) {
    weaponref = function_4b96aa12974840c0(opener, container, index);
    if (isdefined(weaponref)) {
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(weaponref);
        weaponobj = namespace_cb965d2f71fefddc::getfullweaponobjforscriptablepartname(weaponref);
        return [0:lootid, 1:weaponobj, 2:undefined, 3:undefined, 4:weaponclipsize(weaponobj)];
    }
    if (!function_c3d68fb7b175edd(opener, container)) {
        return [0:undefined, 1:undefined, 2:undefined, 3:undefined, 4:undefined];
    }
    lootid = undefined;
    weaponobj = undefined;
    var_e1147886ccf51970 = undefined;
    metadata = undefined;
    quantity = undefined;
    var_18c2c5b0a787d075 = undefined;
    var_cf4fd93a53325100 = undefined;
    if (isdefined(container.var_a06e7128c001851d) && isdefined(container.var_a0e9fef038504bd0)) {
        lootid = container.var_a06e7128c001851d;
        weaponobj = container.var_a0e9fef038504bd0;
        var_e1147886ccf51970 = container.var_c31356a794d8cb46;
        metadata = container.var_bb6791b7369ef71a;
        quantity = container.var_27990aa12decffdd;
        var_18c2c5b0a787d075 = container.var_49cd0247f1c08a6e;
        var_cf4fd93a53325100 = container.var_c693663e1bbdd8e9;
    } else {
        var_c3ee5296b29cb5f6 = function_59b9c8081b873a10(opener, container);
        lootid = var_c3ee5296b29cb5f6.var_4f6cde716e0c3d7;
        weaponobj = var_c3ee5296b29cb5f6.var_6fb67c8525b1d79e;
        var_e1147886ccf51970 = var_c3ee5296b29cb5f6.var_275f4441ab7920c8;
        metadata = var_c3ee5296b29cb5f6.metadata;
        quantity = var_c3ee5296b29cb5f6.var_3ef503345dc57957;
        var_18c2c5b0a787d075 = var_c3ee5296b29cb5f6.var_86b32aff94b5714e;
        var_cf4fd93a53325100 = var_c3ee5296b29cb5f6.var_ad7897ecdbcb63;
    }
    return [0:lootid, 1:weaponobj, 2:var_e1147886ccf51970, 3:metadata, 4:quantity, 5:var_18c2c5b0a787d075, 6:var_cf4fd93a53325100];
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a79
// Size: 0x202
function function_505e8eb7e77704c5(opener, container, index) {
    if (function_430df78a3a4143c1(opener, container, index)) {
        function_153d3281e46e14da(opener, container, index, 0, 0);
        return;
    }
    if (function_e3081772bbf7a51c(opener, container)) {
        container.var_556db0b72a96514e[opener.guid].var_6fb67c8525b1d79e = undefined;
        container.var_556db0b72a96514e[opener.guid].var_4f6cde716e0c3d7 = 0;
        container.var_556db0b72a96514e[opener.guid].metadata = undefined;
        container.var_556db0b72a96514e[opener.guid].var_275f4441ab7920c8 = undefined;
        container.var_556db0b72a96514e[opener.guid].var_3ef503345dc57957 = undefined;
        container.var_556db0b72a96514e[opener.guid].var_ad7897ecdbcb63 = undefined;
        container.var_556db0b72a96514e[opener.guid].var_86b32aff94b5714e = undefined;
    } else if (isdefined(container.var_a06e7128c001851d) && isdefined(container.var_a0e9fef038504bd0)) {
        container.var_a0e9fef038504bd0 = undefined;
        container.var_a06e7128c001851d = 0;
        container.var_bb6791b7369ef71a = undefined;
        container.var_c31356a794d8cb46 = undefined;
        container.var_27990aa12decffdd = undefined;
        container.var_49cd0247f1c08a6e = undefined;
        container.var_c693663e1bbdd8e9 = undefined;
        function_7f855164a30a5f5f(opener);
        return;
    } else {
        container.var_6fb67c8525b1d79e = undefined;
        container.var_4f6cde716e0c3d7 = 0;
        container.metadata = undefined;
        container.var_275f4441ab7920c8 = undefined;
        container.var_3ef503345dc57957 = undefined;
        container.var_86b32aff94b5714e = undefined;
        container.var_ad7897ecdbcb63 = undefined;
    }
    opener setclientomnvar("loot_container_weapon", 0);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c82
// Size: 0xb6
function function_67be8d119fa22135(container, lootid, weaponobj, var_e1147886ccf51970, noextract, quantity, metadata, var_35cd020cf27c8866, var_cf4fd93a53325100) {
    container.var_4f6cde716e0c3d7 = lootid;
    container.var_6fb67c8525b1d79e = weaponobj;
    container.var_275f4441ab7920c8 = var_e1147886ccf51970;
    container.var_5a90d1a92f9af4e3 = noextract;
    container.var_3ef503345dc57957 = quantity;
    container.var_ad7897ecdbcb63 = var_cf4fd93a53325100;
    container.var_86b32aff94b5714e = var_35cd020cf27c8866;
    container.metadata = metadata;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d3f
// Size: 0xda
function function_a0952bc59c9afa3f(player, var_dff481f07e235198, weaponobj, lootid, itemtype, itemindex, quantity, metadata, noextract, var_35cd020cf27c8866, var_cf4fd93a53325100) {
    var_e1147886ccf51970 = namespace_3bcd40a3005712ec::function_1a561e5ef2eca63a(player, weaponobj);
    if (isdefined(var_dff481f07e235198)) {
        function_67be8d119fa22135(var_dff481f07e235198, lootid, weaponobj, var_e1147886ccf51970, noextract, quantity, metadata, var_35cd020cf27c8866, var_cf4fd93a53325100);
    } else {
        function_67be8d119fa22135(player.var_2fa5b49969def47, lootid, weaponobj, var_e1147886ccf51970, noextract, quantity, metadata, var_35cd020cf27c8866, var_cf4fd93a53325100);
    }
    function_62ad0c002d54cbcc(player, var_dff481f07e235198, "loot_container_weapon", lootid, weaponobj);
    if (isdefined(itemtype) && isdefined(itemindex)) {
        player thread namespace_cb965d2f71fefddc::quickdropitem(itemtype, itemindex, 1);
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e20
// Size: 0x6f
function function_430df78a3a4143c1(opener, container, index) {
    if (!isdefined(opener) || !isdefined(container) || !isdefined(index)) {
        return 0;
    }
    var_4ab0c4b064f3c0ba = function_59b9c8081b873a10(opener, container);
    return isdefined(var_4ab0c4b064f3c0ba) && isdefined(var_4ab0c4b064f3c0ba.contents[index]) && isdefined(var_4ab0c4b064f3c0ba.contents[index]["ref"]);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e97
// Size: 0x50
function function_4b96aa12974840c0(opener, container, index) {
    if (!function_430df78a3a4143c1(opener, container, index)) {
        return undefined;
    }
    var_4ab0c4b064f3c0ba = function_59b9c8081b873a10(opener, container);
    return var_4ab0c4b064f3c0ba.contents[index]["ref"];
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eef
// Size: 0x58
function function_932e5252b650e475(opener, container) {
    partname = container function_ec5f4851431f3382();
    if (function_e3081772bbf7a51c(opener, container)) {
        function_9ad640ba63792064(opener, container);
    } else if (container getscriptableparthasstate(partname, "fully_opening_unusable")) {
        container setscriptablepartstate(partname, "fully_opening_unusable");
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f4e
// Size: 0x167
function function_f3c9e05d4767d037(lootid, player, container, index) {
    if (!function_54066dbd8ef44fe1(container) || !namespace_cb965d2f71fefddc::function_b1e944a2b3e15e9d(namespace_38b993c4618e76cd::getscriptablefromlootid(lootid)) || !function_7eda25c90cc3aaa1(index)) {
        return;
    }
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    baseorigin = container.origin;
    baseangles = container.angles;
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(baseorigin, baseangles);
    if (isdefined(container.var_bf8e5f003146af44)) {
        var_cb4fad49263e20c4.groundentity = container.var_bf8e5f003146af44;
    }
    var_b8dba75f79d1baa3 = namespace_cb965d2f71fefddc::loot_getitemcount(container);
    lefthand = namespace_cb965d2f71fefddc::loot_getitemcountlefthand(container);
    var_d00f368c9df807cf = namespace_cb965d2f71fefddc::function_3a5f7703319142dd(container);
    var_87583859f07b58e3 = namespace_cb965d2f71fefddc::spawnpickup("brloot_backpack_player_small", var_cb4fad49263e20c4, var_b8dba75f79d1baa3, 0, undefined, undefined, lefthand, var_d00f368c9df807cf);
    function_3883d0bb982156f3(container, var_87583859f07b58e3);
    var_87583859f07b58e3 setscriptablepartstate("body", "partially_open_usable");
    if (isdefined(container.opener)) {
        namespace_3f0ea7483345a2c0::function_30f5ea60517f9e06(container.opener, var_87583859f07b58e3);
    }
    namespace_cb965d2f71fefddc::loothide(container, "body");
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80bc
// Size: 0x2a0
function function_3883d0bb982156f3(container, backpack) {
    backpack.contents = container.contents;
    backpack.var_46a3a8565ac0c17c = container.var_46a3a8565ac0c17c;
    backpack.var_846a20d8e6f30b8e = container.var_846a20d8e6f30b8e;
    backpack.owner = container.owner;
    backpack.var_4f6cde716e0c3d7 = container.var_4f6cde716e0c3d7;
    backpack.var_6fb67c8525b1d79e = container.var_6fb67c8525b1d79e;
    backpack.var_3ef503345dc57957 = container.var_3ef503345dc57957;
    backpack.var_ad7897ecdbcb63 = container.var_ad7897ecdbcb63;
    backpack.var_275f4441ab7920c8 = container.var_275f4441ab7920c8;
    backpack.metadata = container.var_fd8a9b46f4a1e27c;
    backpack.var_86b32aff94b5714e = container.var_86b32aff94b5714e;
    backpack.backpacksize = container.backpacksize;
    backpack.var_bf23a60678978c19 = container.var_bf23a60678978c19;
    backpack.var_a06e7128c001851d = container.var_a06e7128c001851d;
    backpack.var_a0e9fef038504bd0 = container.var_a0e9fef038504bd0;
    backpack.var_27990aa12decffdd = container.var_27990aa12decffdd;
    backpack.var_c693663e1bbdd8e9 = container.var_c693663e1bbdd8e9;
    backpack.var_49cd0247f1c08a6e = container.var_49cd0247f1c08a6e;
    backpack.var_bb6791b7369ef71a = container.var_bb6791b7369ef71a;
    backpack.var_c31356a794d8cb46 = container.var_c31356a794d8cb46;
    if (isdefined(container.owner) && isdefined(container.owner.var_6a4360dcf2a8f3d4)) {
        container.owner.var_6a4360dcf2a8f3d4 = backpack;
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz") {
        backpack.var_bbc200bc77c5db2b = 1;
    }
    foreach (item in backpack.contents) {
        namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2(item["lootID"], "addedToContainer", backpack);
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8363
// Size: 0x65
function function_bf4465d9535802ba(container, player, items) {
    function_cf0b3e7d1e5a3274(player, container, container.var_46a3a8565ac0c17c);
    if (!isdefined(container.var_e0aea15595ecf1a9)) {
        container.var_e0aea15595ecf1a9 = [];
    }
    container.var_e0aea15595ecf1a9[player.guid] = items;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83cf
// Size: 0x6b
function function_40b46e7298657a93(container, players, items) {
    foreach (player in players) {
        function_bf4465d9535802ba(container, player, items);
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8441
// Size: 0x189
function function_cf0b3e7d1e5a3274(player, container, var_46a3a8565ac0c17c, weaponslot) {
    if (!isdefined(container.var_556db0b72a96514e)) {
        container.var_556db0b72a96514e = [];
    }
    if (!isdefined(container.var_556db0b72a96514e[player.guid])) {
        container.var_556db0b72a96514e[player.guid] = spawnstruct();
        container.var_556db0b72a96514e[player.guid].contents = [];
    }
    container.var_46a3a8565ac0c17c = 1;
    container.var_556db0b72a96514e[player.guid].var_46a3a8565ac0c17c = 1;
    if (isdefined(var_46a3a8565ac0c17c)) {
        container.var_46a3a8565ac0c17c = var_46a3a8565ac0c17c;
        container.var_556db0b72a96514e[player.guid].var_46a3a8565ac0c17c = var_46a3a8565ac0c17c;
    }
    container.var_556db0b72a96514e[player.guid].type = container.type;
    container.var_556db0b72a96514e[player.guid].origin = container.origin;
    container.var_556db0b72a96514e[player.guid].angles = container.angles;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85d1
// Size: 0x144
function function_618f897065a12122(player, container, items) {
    if (!function_e3081772bbf7a51c(player, container)) {
        function_cf0b3e7d1e5a3274(player, container);
    }
    if (!isarray(items)) {
        items = [0:items];
    }
    foreach (item in items) {
        index = container.var_556db0b72a96514e[player.guid].contents.size;
        container.var_556db0b72a96514e[player.guid].contents[index] = [];
        container.var_556db0b72a96514e[player.guid].contents[index]["lootID"] = item["lootID"];
        container.var_556db0b72a96514e[player.guid].contents[index]["quantity"] = function_53c4c53197386572(item["quantity"], 1);
    }
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x871c
// Size: 0x15a
function function_3be0b970932fa47e(player, container, lootid, quantity, weaponobj, metadata, var_e1147886ccf51970, var_18c2c5b0a787d075, var_cf4fd93a53325100) {
    if (!function_e3081772bbf7a51c(player, container)) {
        function_cf0b3e7d1e5a3274(player, container);
    }
    container.var_556db0b72a96514e[player.guid].var_4f6cde716e0c3d7 = lootid;
    container.var_556db0b72a96514e[player.guid].var_6fb67c8525b1d79e = weaponobj;
    container.var_556db0b72a96514e[player.guid].metadata = metadata;
    container.var_556db0b72a96514e[player.guid].var_275f4441ab7920c8 = var_e1147886ccf51970;
    container.var_556db0b72a96514e[player.guid].var_3ef503345dc57957 = quantity;
    container.var_556db0b72a96514e[player.guid].var_ad7897ecdbcb63 = var_cf4fd93a53325100;
    container.var_556db0b72a96514e[player.guid].var_86b32aff94b5714e = var_18c2c5b0a787d075;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x887d
// Size: 0x48
function function_e3081772bbf7a51c(opener, container) {
    return isdefined(container) && isdefined(opener) && isdefined(container.var_556db0b72a96514e) && isdefined(container.var_556db0b72a96514e[opener.guid]);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88cd
// Size: 0x59
function function_3aae4431f00c347f(opener, container) {
    if (!isdefined(container.var_556db0b72a96514e) || !isdefined(container.var_556db0b72a96514e[opener.guid])) {
        return undefined;
    }
    return container.var_556db0b72a96514e[opener.guid];
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x892e
// Size: 0x63
function function_3c85cbbfd2d2a3da(opener, container) {
    if (!isdefined(container.var_556db0b72a96514e) || !isdefined(container.var_556db0b72a96514e[opener.guid])) {
        return undefined;
    }
    return container.var_556db0b72a96514e[opener.guid].contents;
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8999
// Size: 0x1c
function function_c24e299b175682e4(player, container) {
    container disablescriptableplayeruse(player);
}

// Namespace loot/namespace_3f0ea7483345a2c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89bc
// Size: 0xe8
function function_9ad640ba63792064(opener, container) {
    totalplayers = container.var_556db0b72a96514e.size;
    totalcount = 0;
    foreach (guid, var_556db0b72a96514e in container.var_556db0b72a96514e) {
        player = getplayerforguid(guid);
        if (iscontainerempty(var_556db0b72a96514e, player)) {
            totalcount++;
            function_c24e299b175682e4(player, container);
        }
    }
    partname = container function_ec5f4851431f3382();
    if (totalcount >= totalplayers && container getscriptableparthasstate(partname, "fully_opening_unusable")) {
        container setscriptablepartstate(partname, "fully_opening_unusable");
    }
}

