// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;

#namespace namespace_7bf99ef58659a6f1;

// Namespace namespace_7bf99ef58659a6f1/namespace_c510755feb6d2d16
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80
// Size: 0x149
function init() {
    level.var_7bf99ef58659a6f1 = [];
    if (isdefined(level.var_1a2b600a06ec21f4.var_5f311b186975c63d)) {
        var_cf4e196fe0e8f2aa = getscriptbundle(level.var_1a2b600a06ec21f4.var_5f311b186975c63d);
        if (isdefined(var_cf4e196fe0e8f2aa) && isdefined(var_cf4e196fe0e8f2aa.var_ff9f17f677292fe6)) {
            foreach (i, menu in var_cf4e196fe0e8f2aa.var_ff9f17f677292fe6) {
                if (isdefined(menu.var_572d018639cd59e7)) {
                    level.var_7bf99ef58659a6f1[menu.var_572d018639cd59e7] = function_61a76cc038f69d62(menu.var_7bf99ef58659a6f1);
                    if (isdefined(level.var_7bf99ef58659a6f1[menu.var_572d018639cd59e7])) {
                        level.var_7bf99ef58659a6f1[menu.var_572d018639cd59e7].id = i + 1;
                        level.var_7bf99ef58659a6f1[menu.var_572d018639cd59e7].ref = menu.var_572d018639cd59e7;
                    }
                }
            }
        }
    }
}

// Namespace namespace_7bf99ef58659a6f1/namespace_c510755feb6d2d16
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0
// Size: 0x196
function function_904f24ea774b8f6f(var_572d018639cd59e7, itemindex) {
    if (!isdefined(var_572d018639cd59e7) || !isdefined(itemindex) || !isdefined(level.var_7bf99ef58659a6f1[var_572d018639cd59e7])) {
        return;
    }
    item = level.var_7bf99ef58659a6f1[var_572d018639cd59e7].items[itemindex];
    if (!isdefined(item)) {
        return;
    }
    var_c1c3ecdd33dec5b7 = getscriptbundle(item.asset);
    if (isdefined(var_c1c3ecdd33dec5b7)) {
        item_struct = spawnstruct();
        item_struct.cost = var_c1c3ecdd33dec5b7.cost;
        item_struct.var_91839babd32261f4 = var_c1c3ecdd33dec5b7.scriptablename;
        item_struct.tier = var_c1c3ecdd33dec5b7.tier;
        item_struct.var_cb325ddb4a764623 = var_c1c3ecdd33dec5b7.var_cb325ddb4a764623;
        item_struct.itemid = var_c1c3ecdd33dec5b7.itemid;
        item_struct.var_aa0377db58a92018 = var_c1c3ecdd33dec5b7.var_aa0377db58a92018;
        item_struct.maxstack = var_c1c3ecdd33dec5b7.maxstack;
        item_struct.category = item.category;
        item_struct.index = itemindex;
        if (isdefined(var_c1c3ecdd33dec5b7.currency)) {
            var_ba55b52ed97c10f9 = getscriptbundle(var_c1c3ecdd33dec5b7.currency);
            if (isdefined(var_ba55b52ed97c10f9)) {
                item_struct.currency = var_ba55b52ed97c10f9.var_54d8fe06789b6851;
            }
        }
        return item_struct;
    }
}

// Namespace namespace_7bf99ef58659a6f1/namespace_c510755feb6d2d16
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36d
// Size: 0x2ed
function function_61a76cc038f69d62(var_32c25303e9f9ee5) {
    if (!isdefined(var_32c25303e9f9ee5)) {
        return;
    }
    var_d74e5bf68df5bc0e = spawnstruct();
    var_d74e5bf68df5bc0e.items = [];
    var_7cb237de52d0aac6 = getscriptbundle(var_32c25303e9f9ee5);
    var_d74e5bf68df5bc0e.var_8b8931f97eef184 = var_7cb237de52d0aac6.var_cf869621963a1479;
    var_d74e5bf68df5bc0e.var_fd0ea8a834fa0398 = var_7cb237de52d0aac6.var_fd0ea8a834fa0398;
    var_d74e5bf68df5bc0e.var_c7ffb2549ca8ab4b = var_7cb237de52d0aac6.var_479e72ccbb6469b4;
    var_d74e5bf68df5bc0e.var_ffb59359995043a = var_7cb237de52d0aac6.var_412c66c598fa294f;
    if (isdefined(var_7cb237de52d0aac6.var_3a5cecc53aff7c5b)) {
        var_97a2bf47be64d1bd = getscriptbundle(var_7cb237de52d0aac6.var_3a5cecc53aff7c5b);
        globalindex = 0;
        if (isdefined(var_97a2bf47be64d1bd) && isdefined(var_97a2bf47be64d1bd.var_7ba8aecb362b5db7)) {
            foreach (tab in var_97a2bf47be64d1bd.var_7ba8aecb362b5db7) {
                var_c67a0b24b28ed595 = getscriptbundle(tab.var_dd6ac48cdd89da1e);
                var_50ad891a1213acd8 = getscriptbundle(var_c67a0b24b28ed595.var_158da238f6c4491e);
                foreach (index, item in var_50ad891a1213acd8.purchaseitems) {
                    if (isdefined(item.purchaseitem)) {
                        item_struct = spawnstruct();
                        item_struct.asset = item.purchaseitem;
                        item_struct.category = var_c67a0b24b28ed595.var_7d5026edc4984160;
                        var_d74e5bf68df5bc0e.items[globalindex] = item_struct;
                        globalindex++;
                    }
                }
            }
        }
    } else if (isdefined(var_7cb237de52d0aac6.var_b3d5e4ca666276bc)) {
        var_c67a0b24b28ed595 = getscriptbundle(var_7cb237de52d0aac6.var_b3d5e4ca666276bc);
        var_50ad891a1213acd8 = getscriptbundle(var_c67a0b24b28ed595.var_158da238f6c4491e);
        globalindex = 0;
        foreach (item in var_50ad891a1213acd8.purchaseitems) {
            if (isdefined(item.purchaseitem)) {
                item_struct = spawnstruct();
                item_struct.asset = item.purchaseitem;
                item_struct.category = var_c67a0b24b28ed595.var_7d5026edc4984160;
                var_d74e5bf68df5bc0e.items[globalindex] = item_struct;
                globalindex++;
            }
        }
    }
    return var_d74e5bf68df5bc0e;
}

// Namespace namespace_7bf99ef58659a6f1/namespace_c510755feb6d2d16
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x662
// Size: 0x1d
function function_cfd0e1fb13d7e080(ref) {
    if (isdefined(ref)) {
        return level.var_7bf99ef58659a6f1[ref];
    }
}

// Namespace namespace_7bf99ef58659a6f1/namespace_c510755feb6d2d16
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x686
// Size: 0x47
function function_fcb72b7f642e750e(ref, index) {
    if (isdefined(ref) && isdefined(index) && isdefined(level.var_7bf99ef58659a6f1[ref])) {
        return level.var_7bf99ef58659a6f1[ref].items[index];
    }
}

// Namespace namespace_7bf99ef58659a6f1/namespace_c510755feb6d2d16
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d4
// Size: 0x42
function function_5c9b6f1c3c67dd97(var_572d018639cd59e7, channel) {
    if (isdefined(channel) && isdefined(level.var_7bf99ef58659a6f1[var_572d018639cd59e7])) {
        return (level.var_7bf99ef58659a6f1[var_572d018639cd59e7].var_ffb59359995043a == channel);
    }
    return 0;
}

