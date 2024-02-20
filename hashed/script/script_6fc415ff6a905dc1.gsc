// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_247745a526421ba7;
#using script_2d9d24f7c63ac143;
#using script_b7a9ce0a2282b79;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\weapons.gsc;
#using script_6fc415ff6a905dc1;
#using script_2391409ef7b431e1;
#using script_3aacf02225ca0da5;
#using script_6a8ec730b2bfa844;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\gasmask.gsc;

#namespace namespace_771165fe61010ab2;

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x344
// Size: 0x28e
function function_f09e47b124561928() {
    if (isai(self)) {
        return;
    }
    if (!function_e37ca8120dc19c6a()) {
        return;
    }
    function_7f04a682872040db(self);
    /#
        println(self.name + "cosmeticAttachment");
    #/
    if (function_e0fc1230452cf4e7()) {
        function_33366ade5697aa38(self);
        var_1f290b334e7ea5 = function_aad5c8b478df88c4(self);
        if (var_1f290b334e7ea5 > 0) {
            namespace_aead94004cf4c147::function_c2f16e2bbb4e38c0("brloot_armor_plate", var_1f290b334e7ea5);
        }
    } else {
        function_f95e462ad75806a2();
        function_2d55e66e05614871();
    }
    /#
        println(self.name + "<unknown string>");
    #/
    if (!function_b0d22762c7ee8fe4()) {
        function_568d5b6b51690c6a();
    }
    function_5baaa0ce73d6fe84(self);
    if (!isdefined(level.var_eb4ad3d9b8c36077)) {
        filename = "mp/dmz_starting_inventory_ae_whitelist.csv";
        level.var_eb4ad3d9b8c36077 = [];
        numrows = tablelookupgetnumrows(filename);
        for (row = 0; row < numrows; row++) {
            level.var_eb4ad3d9b8c36077[level.var_eb4ad3d9b8c36077.size] = int(tablelookupbyrow(filename, row, 1));
        }
    }
    method = namespace_aad14af462a74d08::function_6d40f12a09494350(0, function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"hash_e916855474bdfbde"));
    foreach (item in function_9cd290910c24d4d3()) {
        var_f6c9f9bbbc46c8e7 = item.lootid;
        if (isdefined(item.objweapon)) {
            var_49d6c5a42ebcf947 = namespace_3bbb5a98b932c46f::function_7a91162092cc11ec(item.lootid);
            if (isdefined(var_49d6c5a42ebcf947)) {
                var_f6c9f9bbbc46c8e7 = var_49d6c5a42ebcf947;
            }
        }
        if (array_contains(level.var_eb4ad3d9b8c36077, var_f6c9f9bbbc46c8e7)) {
            namespace_aad14af462a74d08::function_d24138b32084fc3e(self, var_f6c9f9bbbc46c8e7, undefined, method, item.quantity);
        }
    }
    foreach (item in function_254150d1e667dee7()) {
        if (array_contains(level.var_eb4ad3d9b8c36077, item.lootid)) {
            namespace_aad14af462a74d08::function_d24138b32084fc3e(self, item.lootid, undefined, method, item.quantity);
        }
    }
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d9
// Size: 0x448
function function_5332e1c0f06b0245(var_3064fa24dbbd5bbf) {
    if (isai(self)) {
        return;
    }
    if (!function_e37ca8120dc19c6a()) {
        return;
    }
    /#
        println(self.name + "<unknown string>");
    #/
    self setplayerdata(level.var_5d69837cf4db0407, "lootedCash", self.plundercount);
    var_1d4db10d5290694a = function_254150d1e667dee7();
    foreach (item in var_1d4db10d5290694a) {
        namespace_512200f0f9e6ebc9::function_a82decee54864929(item.lootid);
    }
    var_6be2e3de0644e52 = [];
    var_31949ce029b087d1 = [];
    if (isdefined(self.var_9405380a2f34c55d)) {
        foreach (var_784dd6733f8f56a5 in self.var_9405380a2f34c55d) {
            var_57ac4dc40b2e376 = namespace_85cd45b4fe0d86fb::getDogTagVictimAndKiller(var_784dd6733f8f56a5);
            killerindex = var_57ac4dc40b2e376[1];
            victimindex = var_57ac4dc40b2e376[0];
            if (isdefined(killerindex) && isdefined(level.dogTagInfo[killerindex]) && isdefined(level.dogTagInfo[killerindex].name)) {
                var_6be2e3de0644e52[var_6be2e3de0644e52.size] = level.dogTagInfo[victimindex].name;
                var_31949ce029b087d1[var_6be2e3de0644e52.size] = level.dogTagInfo[killerindex].name;
            }
        }
    }
    self dlog_recordplayerevent("dlog_event_dmz_exfil_dogtags", [0:"tags_victim", 1:var_6be2e3de0644e52, 2:"tags_killer", 3:var_31949ce029b087d1]);
    self.var_9405380a2f34c55d = undefined;
    inventory = function_9cd290910c24d4d3();
    foreach (item in inventory) {
        namespace_512200f0f9e6ebc9::function_a82decee54864929(item.lootid);
    }
    inventory = function_9cd290910c24d4d3();
    var_ebd34e72023fc5a9 = function_254150d1e667dee7();
    clipammo = function_c1106d5209a8b595();
    if (!function_e0fc1230452cf4e7()) {
        foreach (item in inventory) {
            function_c324d060cde743e3(item.lootid, item.quantity);
        }
        if (!function_b0d22762c7ee8fe4()) {
            function_cfc379803b1dd46f();
        }
        foreach (item in var_ebd34e72023fc5a9) {
            function_c324d060cde743e3(item.lootid, item.quantity);
            function_6f39f9916649ac48(item.lootid, item.quantity);
        }
        foreach (lootid in namespace_a8b2b88699fc40fb::function_8f6753648e94e7ec(self)) {
            function_c324d060cde743e3(lootid);
        }
    }
    namespace_a8b2b88699fc40fb::function_5704ab2a9381630f(self);
    namespace_a38a2e1fe7519183::function_ed325a060adcbe65(self);
    var_68c58fc50db46dc6 = self getplayerdata(level.var_5d69837cf4db0407, "dmzBankedCash");
    self setplayerdata(level.var_5d69837cf4db0407, "dmzBankedCash", var_68c58fc50db46dc6 + self.plundercount);
    namespace_8361bad7391de074::function_3172b1344f4e08a0(self, inventory, var_1d4db10d5290694a, clipammo, self.plundercount, var_3064fa24dbbd5bbf);
    /#
        println(self.name + "<unknown string>");
    #/
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa28
// Size: 0x19f
function private function_f95e462ad75806a2() {
    inventory = function_9cd290910c24d4d3();
    var_113572a27a3ac22 = function_774fef5f034555ba();
    foreach (item in inventory) {
        index = undefined;
        if (var_113572a27a3ac22) {
            index = function_752a16f10a698186(item.lootid, &function_25be694d7a22db61);
        } else {
            index = function_752a16f10a698186(item.lootid);
        }
        if (isdefined(index)) {
            var_ff239359935aa777 = self getplayerdata(level.var_5d69837cf4db0407, "dmzInventory", index, "quantity");
            ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(item.lootid);
            /#
                println("<unknown string>");
                println("<unknown string>" + index + "<unknown string>" + item.lootid + "<unknown string>" + ref + "<unknown string>" + var_ff239359935aa777);
            #/
            if (var_ff239359935aa777 == 1) {
                if (var_113572a27a3ac22) {
                    itemtype = namespace_38b993c4618e76cd::function_282cf83c9eeda744(item.lootid);
                    if (itemtype == "weapon") {
                        scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(item.lootid);
                    }
                }
                function_e249cffd8b8f7a9(index, 0, 0);
            } else {
                function_e249cffd8b8f7a9(index, item.lootid, var_ff239359935aa777 - 1);
            }
        }
    }
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbce
// Size: 0x1b
function function_d347b1e01ae5d066() {
    cooldown = namespace_a38a2e1fe7519183::function_319dc9ed3b41647();
    return getsystemtime() + cooldown;
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf1
// Size: 0x269
function function_e2f4f470c55123b8(var_a9241440b3109a63, var_c481d6c6144f4c31) {
    var_bbac576aade31a1e = 0;
    if (isdefined(var_a9241440b3109a63)) {
        var_ebd34e72023fc5a9 = var_a9241440b3109a63;
    } else {
        var_ebd34e72023fc5a9 = function_254150d1e667dee7();
    }
    self.var_9405380a2f34c55d = [];
    foreach (item in var_ebd34e72023fc5a9) {
        ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(item.lootid);
        var_25978461c6e4f61b = level.br_pickups.var_838863c4848d4c26[ref];
        itemtype = undefined;
        if (isdefined(var_25978461c6e4f61b)) {
            itemtype = level.br_pickups.br_itemtype[var_25978461c6e4f61b];
        }
        if (isdefined(itemtype) && itemtype == #"plunder") {
            var_bbac576aade31a1e = var_bbac576aade31a1e + item.quantity;
        } else if (isdefined(var_25978461c6e4f61b) && isdefined(itemtype)) {
            var_b87f7fae01ce754f = level.br_pickups.var_d93566a78e29d583[var_25978461c6e4f61b];
            if (itemtype == #"dogtag") {
                self.var_9405380a2f34c55d[self.var_9405380a2f34c55d.size] = item.quantity;
                value = level.br_pickups.var_d93566a78e29d583[var_25978461c6e4f61b];
                var_bbac576aade31a1e = var_bbac576aade31a1e + value;
                if (!istrue(var_c481d6c6144f4c31)) {
                    function_db1dd76061352e5b(item.index, item.quantity);
                }
            } else if (!namespace_cb965d2f71fefddc::function_a38e261031751c09(var_25978461c6e4f61b)) {
                if (isdefined(var_b87f7fae01ce754f) && isdefined(itemtype)) {
                    if (itemtype == #"valuable" || itemtype == #"personal" || itemtype == #"note") {
                        var_bbac576aade31a1e = var_bbac576aade31a1e + var_b87f7fae01ce754f * item.quantity;
                    }
                }
                var_4183295edcc21db0 = namespace_aead94004cf4c147::function_c578cff4de96af82(var_25978461c6e4f61b);
                if (itemtype == #"valuable" && !istrue(var_4183295edcc21db0) && !istrue(var_c481d6c6144f4c31)) {
                    function_6f39f9916649ac48(item.lootid, item.quantity);
                }
            }
        }
    }
    var_bbac576aade31a1e = var_bbac576aade31a1e + namespace_a8b2b88699fc40fb::function_baf5e17d7033a223(self);
    return var_bbac576aade31a1e;
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe62
// Size: 0x31
function function_b0d22762c7ee8fe4() {
    if (!isdefined(level.var_a488de48eee3f95e)) {
        level.var_a488de48eee3f95e = getdvarint(@"hash_b3d354dab8da45d4", 0);
    }
    return level.var_a488de48eee3f95e;
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9b
// Size: 0xfa
function function_e249cffd8b8f7a9(index, lootid, quantity, cooldown) {
    ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
    /#
        println(self.name + "<unknown string>" + index + "<unknown string>" + lootid + "<unknown string>" + quantity + "<unknown string>");
        println("<unknown string>" + index + "<unknown string>" + lootid + "<unknown string>" + ref + "<unknown string>" + quantity);
    #/
    if (lootid == 0 || quantity <= 0) {
        lootid = 0;
        quantity = 0;
    }
    if (!isdefined(cooldown)) {
        cooldown = 0;
    }
    self setplayerdata(level.var_5d69837cf4db0407, "dmzInventory", index, "lootID", lootid);
    self setplayerdata(level.var_5d69837cf4db0407, "dmzInventory", index, "quantity", quantity);
    self setplayerdata(level.var_5d69837cf4db0407, "dmzInventory", index, "cooldownEndTime", cooldown);
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9c
// Size: 0x39
function function_7f18210bf7cedd4b(index, lootedQuantity) {
    if (lootedQuantity <= 0) {
        lootedQuantity = 0;
    }
    self setplayerdata(level.var_5d69837cf4db0407, "dmzInventory", index, "lootedQuantity", lootedQuantity);
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfdc
// Size: 0x181
function function_c324d060cde743e3(lootid, quantity) {
    if (!isdefined(quantity)) {
        quantity = 1;
    }
    if (function_774fef5f034555ba()) {
        itemtype = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
        if (isdefined(itemtype) && itemtype == "weapon") {
            for (i = 0; i < quantity; i++) {
                index = function_752a16f10a698186(lootid, &function_ae513b3a65d8bfbc);
                if (isdefined(index) && self getplayerdata(level.var_5d69837cf4db0407, "dmzInventory", index, "cooldownEndTime") > getsystemtime()) {
                    function_e249cffd8b8f7a9(index, lootid, 1, 0);
                    function_7f18210bf7cedd4b(index, 1);
                }
                var_a5321c6e027413f8 = function_e89462f915a860fd();
                if (isdefined(var_a5321c6e027413f8)) {
                    function_e249cffd8b8f7a9(var_a5321c6e027413f8, lootid, 1);
                    function_7f18210bf7cedd4b(var_a5321c6e027413f8, 1);
                }
            }
            return;
        }
    }
    index = function_752a16f10a698186(lootid);
    if (isdefined(index)) {
        var_ff239359935aa777 = self getplayerdata(level.var_5d69837cf4db0407, "dmzInventory", index, "quantity");
        var_fdfd1b213ef1e39c = self getplayerdata(level.var_5d69837cf4db0407, "dmzInventory", index, "lootedQuantity");
        function_e249cffd8b8f7a9(index, lootid, var_ff239359935aa777 + quantity);
        function_7f18210bf7cedd4b(index, var_fdfd1b213ef1e39c + quantity);
    } else {
        index = function_e89462f915a860fd();
        if (isdefined(index)) {
            function_e249cffd8b8f7a9(index, lootid, quantity);
            function_7f18210bf7cedd4b(index, quantity);
        }
    }
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1164
// Size: 0x7e
function function_4be4a391f94837bf(lootid) {
    if (lootid == 0) {
        return undefined;
    }
    for (i = 0; i < 50; i++) {
        var_eeeae9defa0c1e95 = self getplayerdata(level.var_5d69837cf4db0407, "dmzInventory", i, "lootID");
        if (lootid == var_eeeae9defa0c1e95) {
            if (self getplayerdata(level.var_5d69837cf4db0407, "dmzInventory", i, "cooldownEndTime") > getsystemtime()) {
                return i;
            }
        }
    }
    return undefined;
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ea
// Size: 0x33
function function_25be694d7a22db61(itemindex) {
    if (self getplayerdata(level.var_5d69837cf4db0407, "dmzInventory", itemindex, "cooldownEndTime") > getsystemtime()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1225
// Size: 0x33
function function_ae513b3a65d8bfbc(itemindex) {
    if (self getplayerdata(level.var_5d69837cf4db0407, "dmzInventory", itemindex, "cooldownEndTime") > getsystemtime()) {
        return 1;
    }
    return 0;
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1260
// Size: 0x72
function function_752a16f10a698186(lootid, var_7191caa0aead68a5) {
    if (lootid == 0) {
        return undefined;
    }
    for (i = 0; i < 50; i++) {
        var_eeeae9defa0c1e95 = self getplayerdata(level.var_5d69837cf4db0407, "dmzInventory", i, "lootID");
        if (lootid == var_eeeae9defa0c1e95) {
            if (!isdefined(var_7191caa0aead68a5) || self [[ var_7191caa0aead68a5 ]](i)) {
                return i;
            }
        }
    }
    return undefined;
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12da
// Size: 0x4a
function function_e89462f915a860fd() {
    for (i = 0; i < 50; i++) {
        var_eeeae9defa0c1e95 = self getplayerdata(level.var_5d69837cf4db0407, "dmzInventory", i, "lootID");
        if (var_eeeae9defa0c1e95 == 0) {
            return i;
        }
    }
    return undefined;
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132c
// Size: 0x41
function function_7f04a682872040db(player) {
    for (itemindex = 0; itemindex < 50; itemindex++) {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzInventory", itemindex, "lootedQuantity", 0);
    }
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1374
// Size: 0x95
function function_ee79f56d03f6a83d(player) {
    for (itemindex = 0; itemindex < 50; itemindex++) {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzInventory", itemindex, "lootID", 0);
        player setplayerdata(level.var_5d69837cf4db0407, "dmzInventory", itemindex, "quantity", 0);
        player setplayerdata(level.var_5d69837cf4db0407, "dmzInventory", itemindex, "lootedQuantity", 0);
        player setplayerdata(level.var_5d69837cf4db0407, "dmzInventory", itemindex, "cooldownEndTime", 0);
    }
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1410
// Size: 0x32
function function_774fef5f034555ba() {
    if (!isdefined(level.var_113572a27a3ac22)) {
        level.var_113572a27a3ac22 = getdvarint(@"hash_e28234d5ed130fb4", 1);
    }
    return level.var_113572a27a3ac22;
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144a
// Size: 0xab
function function_c1106d5209a8b595() {
    items = [];
    if (!isdefined(self.br_ammo)) {
        return items;
    }
    foreach (ammotype, count in self.br_ammo) {
        if (count == 0) {
            continue;
        }
        item = spawnstruct();
        item.lootid = namespace_38b993c4618e76cd::getLootIDFromRef(ammotype);
        item.quantity = count;
        items[items.size] = item;
    }
    return items;
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fd
// Size: 0x3f1
function function_9cd290910c24d4d3() {
    items = [];
    var_9fd35ffd09e2a230 = function_57931a717f140ebe(self);
    foreach (weapon in var_9fd35ffd09e2a230) {
        variantid = weapon.variantid;
        if (!isdefined(weapon.variantid)) {
            variantid = 0;
        }
        rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
        lootid = namespace_e0ee43ef2dddadaa::function_79d6e6c22245687a(rootname, variantid);
        if (isdefined(lootid) && lootid > 0) {
            item = spawnstruct();
            item.lootid = lootid;
            item.quantity = 1;
            item.objweapon = weapon;
            weaponindex = namespace_3bcd40a3005712ec::function_2ab3bda08c595a32(self, weapon);
            if (isdefined(weaponindex)) {
                item.var_e1147886ccf51970 = namespace_3bcd40a3005712ec::function_86a5c7670325346b(self, weaponindex);
            }
            if (isdefined(weaponindex)) {
                var_96c4059aa2eabfb8 = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, weaponindex);
                if (isdefined(var_96c4059aa2eabfb8)) {
                    item.metadata = var_96c4059aa2eabfb8;
                }
            }
            items[items.size] = item;
        }
    }
    ref = namespace_1a507865f681850e::getcurrentequipment("primary");
    if (isdefined(ref)) {
        var_212e6b7d207a0089 = namespace_1a507865f681850e::getequipmentslotammo("primary");
        lootid = namespace_38b993c4618e76cd::getLootIDFromRef(ref);
        if (isdefined(lootid) && var_212e6b7d207a0089 > 0) {
            item = spawnstruct();
            item.lootid = lootid;
            item.quantity = var_212e6b7d207a0089;
            items[items.size] = item;
        }
    }
    ref = namespace_1a507865f681850e::getcurrentequipment("secondary");
    if (isdefined(ref)) {
        var_212e6b7d207a0089 = namespace_1a507865f681850e::getequipmentslotammo("secondary");
        lootid = namespace_38b993c4618e76cd::getLootIDFromRef(ref);
        if (isdefined(lootid) && isdefined(var_212e6b7d207a0089) && var_212e6b7d207a0089 > 0) {
            item = spawnstruct();
            item.lootid = lootid;
            item.quantity = var_212e6b7d207a0089;
            items[items.size] = item;
        }
    }
    ref = namespace_1a507865f681850e::getcurrentequipment("super");
    ref = namespace_38b993c4618e76cd::function_151b82e1257f4cde(ref);
    var_212e6b7d207a0089 = namespace_d20f8ef223912e12::getsuperweapondisabledammobr();
    lootid = namespace_38b993c4618e76cd::getLootIDFromRef(ref);
    if (isdefined(lootid) && isdefined(var_212e6b7d207a0089) && var_212e6b7d207a0089 > 0) {
        item = spawnstruct();
        item.lootid = lootid;
        item.quantity = var_212e6b7d207a0089;
        items[items.size] = item;
    }
    ref = namespace_58a74e7d54b56e8d::getkillstreakinslot(1);
    if (isdefined(ref)) {
        lootid = namespace_38b993c4618e76cd::getLootIDFromRef(ref.streakname);
        if (isdefined(lootid)) {
            item = spawnstruct();
            item.lootid = lootid;
            item.quantity = 1;
            items[items.size] = item;
        }
    }
    if (namespace_d3d40f75bb4e4c32::hasplatepouch()) {
        lootid = namespace_38b993c4618e76cd::getLootIDFromRef("armor_satchel");
        if (isdefined(lootid)) {
            item = spawnstruct();
            item.lootid = lootid;
            item.quantity = 1;
            items[items.size] = item;
        }
    }
    if (namespace_9c6cddd872ad75f7::hasgasmask(self)) {
        lootid = namespace_38b993c4618e76cd::getLootIDFromRef("gas_mask");
        if (isdefined(lootid)) {
            item = spawnstruct();
            item.lootid = lootid;
            item.quantity = 1;
            items[items.size] = item;
        }
    }
    itemname = self.equipment["health"];
    itemcount = namespace_1a507865f681850e::getequipmentslotammo("health");
    if (isdefined(itemname) && isdefined(itemcount) && itemcount > 0) {
        item = spawnstruct();
        item.lootid = namespace_38b993c4618e76cd::getLootIDFromRef("armor_plate");
        item.quantity = itemcount;
        items[items.size] = item;
    }
    return items;
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f6
// Size: 0x43
function function_8c5b523b8e941dc2(classindex, weaponindex, ref) {
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "weapon", ref);
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1940
// Size: 0x43
function function_e5a485a5370debc1(classindex, weaponindex, lootid) {
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "lootItemID", lootid);
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x198a
// Size: 0x1bb
function function_e2b623e5ad975ee(classindex, weaponindex) {
    function_8c5b523b8e941dc2(classindex, weaponindex, "iw9_me_fists");
    function_e5a485a5370debc1(classindex, weaponindex, 0);
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "camo", "none");
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "reticle", "none");
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "cosmeticAttachment", "none");
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "variantID", 0);
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "blueprintName", "");
    for (var_40e4b9c48b36c9ec = 0; var_40e4b9c48b36c9ec < 5; var_40e4b9c48b36c9ec++) {
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", var_40e4b9c48b36c9ec, "attachment", "none");
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", var_40e4b9c48b36c9ec, "variantID", 0);
    }
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 4; var_36d2abbdcbcb186c++) {
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "sticker", var_36d2abbdcbcb186c, "none");
    }
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4c
// Size: 0x43
function function_7734d7b754df1192(classindex, var_50b79e19f823671d, ref) {
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "equipmentSetups", var_50b79e19f823671d, "equipment", ref);
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b96
// Size: 0x35
function function_5f0596c296180f6c(index, ref) {
    self setplayerdata(level.loadoutdata, "squadMembers", "killstreakSetups", index, "killstreak", ref);
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd2
// Size: 0x3d
function function_e93ff591a55c2cd6(classindex, var_a780f473a6275df4, ref) {
    return self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "fieldUpgrades", var_a780f473a6275df4, ref);
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c17
// Size: 0x4e
function function_568d5b6b51690c6a() {
    function_e2b623e5ad975ee(0, 0);
    function_e2b623e5ad975ee(0, 1);
    function_7734d7b754df1192(0, 0, "none");
    function_7734d7b754df1192(0, 1, "none");
    function_e93ff591a55c2cd6(0, 0, "none");
    function_5f0596c296180f6c(0, "none");
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c6c
// Size: 0x1aa
function function_cfc379803b1dd46f() {
    weaponindex = 0;
    var_9fd35ffd09e2a230 = function_57931a717f140ebe(self);
    foreach (weapon in var_9fd35ffd09e2a230) {
        if (weaponindex > 1) {
            continue;
        }
        variantid = weapon.variantid;
        if (!isdefined(weapon.variantid)) {
            variantid = 0;
        }
        rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
        lootid = namespace_e0ee43ef2dddadaa::function_79d6e6c22245687a(rootname, variantid);
        function_8c5b523b8e941dc2(0, weaponindex, rootname);
        if (!isdefined(lootid)) {
            lootid = 0;
        }
        function_e5a485a5370debc1(0, weaponindex, lootid);
        weaponindex++;
    }
    ref = namespace_1a507865f681850e::getcurrentequipment("primary");
    var_212e6b7d207a0089 = namespace_1a507865f681850e::getequipmentslotammo("primary");
    if (isdefined(ref) && var_212e6b7d207a0089 > 0) {
        function_7734d7b754df1192(0, 0, ref);
    }
    ref = namespace_1a507865f681850e::getcurrentequipment("secondary");
    var_212e6b7d207a0089 = namespace_1a507865f681850e::getequipmentslotammo("secondary");
    if (isdefined(ref) && var_212e6b7d207a0089 > 0) {
        function_7734d7b754df1192(0, 1, ref);
    }
    ref = namespace_1a507865f681850e::getcurrentequipment("super");
    ref = namespace_38b993c4618e76cd::function_151b82e1257f4cde(ref);
    var_212e6b7d207a0089 = namespace_d20f8ef223912e12::getsuperweapondisabledammobr();
    if (isdefined(ref) && var_212e6b7d207a0089 > 0) {
        function_e93ff591a55c2cd6(0, 0, ref);
    }
    ref = namespace_58a74e7d54b56e8d::getkillstreakinslot(1);
    if (isdefined(ref)) {
        function_5f0596c296180f6c(0, ref.streakname);
    }
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1d
// Size: 0x137
function function_bac731e0fdaa0ccb(lootid) {
    /#
        println(self.name + "<unknown string>" + "<unknown string>" + lootid);
    #/
    if (!isdefined(lootid)) {
        return;
    }
    type = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
    if (!isdefined(type)) {
        return;
    }
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
        if (isdefined(level.var_b33c035c483c2893) && isdefined(level.var_b33c035c483c2893["onMatchStart"]) && isdefined(level.var_b33c035c483c2893["onMatchStart"][ref])) {
            [[ level.var_b33c035c483c2893["onMatchStart"][ref] ]](self);
        }
        return;
    }
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f5c
// Size: 0x128
function function_a82decee54864929(lootid) {
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
        break;
    case #"hash_7d516d84d0a82f2":
        if (isdefined(level.var_b33c035c483c2893) && isdefined(level.var_b33c035c483c2893["onExtract"]) && isdefined(level.var_b33c035c483c2893["onExtract"][ref])) {
            [[ level.var_b33c035c483c2893["onExtract"][ref] ]](self);
        }
        break;
    }
    if (namespace_cb965d2f71fefddc::function_a38e261031751c09(ref)) {
        namespace_a38a2e1fe7519183::function_ddbc94f52a1947b5(self, lootid);
    }
}

// Namespace namespace_771165fe61010ab2/namespace_512200f0f9e6ebc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x208c
// Size: 0x273
function function_2d55e66e05614871() {
    /#
        println(self.name + "<unknown string>");
    #/
    for (i = 0; i < 11; i++) {
        lootid = self getplayerdata(level.var_5d69837cf4db0407, "dmzBackpackFE", i, "lootID");
        quantity = self getplayerdata(level.var_5d69837cf4db0407, "dmzBackpackFE", i, "quantity");
        ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
        /#
            println("<unknown string>" + i + "<unknown string>" + lootid + "<unknown string>" + ref + "<unknown string>" + lootid);
            println("<unknown string>" + i + "<unknown string>" + lootid + "<unknown string>" + ref + "<unknown string>" + quantity);
        #/
        function_6196d9ea9a30e609(i);
        function_897b29adb37f06a7(i);
        namespace_512200f0f9e6ebc9::function_bac731e0fdaa0ccb(lootid);
        self setplayerdata(level.var_5d69837cf4db0407, "dmzBackpackFE", i, "lootID", 0);
        self setplayerdata(level.var_5d69837cf4db0407, "dmzBackpackFE", i, "quantity", 0);
    }
    /#
        println(self.name + "<unknown string>");
    #/
    for (i = 0; i < 11; i++) {
        lootid = self getplayerdata(level.var_5d69837cf4db0407, "dmzBackpackFE", i, "lootID");
        quantity = self getplayerdata(level.var_5d69837cf4db0407, "dmzBackpackFE", i, "quantity");
        ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
        /#
            println("<unknown string>" + i + "<unknown string>" + lootid + "<unknown string>" + ref + "<unknown string>" + lootid);
            println("<unknown string>" + i + "<unknown string>" + lootid + "<unknown string>" + ref + "<unknown string>" + quantity);
        #/
    }
    /#
        println(self.name + "<unknown string>");
    #/
    for (i = 0; i < 11; i++) {
        lootid = function_6196d9ea9a30e609(i);
        quantity = function_897b29adb37f06a7(i);
        ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
        /#
            println("<unknown string>" + i + "<unknown string>" + lootid + "<unknown string>" + ref + "<unknown string>" + lootid);
            println("<unknown string>" + i + "<unknown string>" + lootid + "<unknown string>" + ref + "<unknown string>" + quantity);
        #/
    }
}

