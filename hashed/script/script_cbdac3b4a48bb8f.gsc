// mwiii decomp prototype
#using script_7ef95bba57dc4b82;
#using script_7b2517368c79e5bc;
#using script_600b944a95c3a7bf;
#using scripts\engine\utility.gsc;
#using scripts\mp\equipment.gsc;

#namespace namespace_f808ba0ae0debcf5;

// Namespace namespace_f808ba0ae0debcf5/namespace_2c26c0b30925e75
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1
// Size: 0xab
function function_1a53aa54f5e85b78() {
    if (isdefined(level.var_a06c1e2e5bb30bbd)) {
        [[ level.var_a06c1e2e5bb30bbd ]]();
    } else {
        function_900f562c61c6a5d6("lethal", &function_18327558e46010d7, &function_122b813904873d2b, undefined, &function_39b9fdb77f6046ba, &function_1d00e4c0929ece86);
        function_900f562c61c6a5d6("tactical", &function_18327558e46010d7, &function_122b813904873d2b, undefined, &function_bed0a54fd4a86617, &function_a57dfcd418fa8691);
        function_5958815b72ad58a0("lethal", #"hash_c94d2b323951a101", &function_62fa129f91896347);
        function_5958815b72ad58a0("tactical", #"hash_c94d2b323951a101", &function_62fa129f91896347);
        utility::registersharedfunc("game", "dropItem_equipment_lethal", &function_6aaed72439e0a22a);
    }
}

// Namespace namespace_f808ba0ae0debcf5/namespace_2c26c0b30925e75
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193
// Size: 0xa7
function function_122b813904873d2b(itembundle, item, var_b2635db617b09abd, var_8bd8fa2792aa0511) {
    var_cbb2b3d05e48bd27 = function_f6c92134390e67b5(itembundle.type);
    var_2609eaa87f8f47c6 = namespace_1a507865f681850e::getcurrentequipment(var_cbb2b3d05e48bd27);
    if (isdefined(var_2609eaa87f8f47c6)) {
        if (var_b2635db617b09abd && var_2609eaa87f8f47c6 != itembundle.ref) {
            return 0;
        }
        if (var_2609eaa87f8f47c6 == itembundle.ref) {
            ammo = namespace_1a507865f681850e::getequipmentammo(var_2609eaa87f8f47c6);
            maxammo = namespace_1a507865f681850e::getequipmentmaxammo(var_2609eaa87f8f47c6);
            return (ammo < maxammo);
        }
    }
    return 0;
}

// Namespace namespace_f808ba0ae0debcf5/namespace_2c26c0b30925e75
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x242
// Size: 0x11b
function function_18327558e46010d7(itembundle, item, var_b2635db617b09abd) {
    var_5486524e0058f303 = function_f6c92134390e67b5(itembundle.type);
    var_f938d1f69f014a80 = itembundle.ref;
    var_3531700e2b091b5 = namespace_2abc885019e1956::function_b8bfea9514c89a77(item.count);
    var_fcaee046e7015d1d = namespace_1a507865f681850e::getequipmentmaxammo(var_f938d1f69f014a80);
    var_9a4bfefba093608 = 0;
    var_d13692417de5892b = namespace_1a507865f681850e::getcurrentequipment(var_5486524e0058f303);
    if (isdefined(var_d13692417de5892b) && var_d13692417de5892b == var_f938d1f69f014a80) {
        var_712f30cf602bc5e4 = namespace_1a507865f681850e::getequipmentammo(var_d13692417de5892b);
        var_3531700e2b091b5 = var_3531700e2b091b5 + var_712f30cf602bc5e4;
    }
    if (var_3531700e2b091b5 > var_fcaee046e7015d1d) {
        var_9a4bfefba093608 = var_3531700e2b091b5 - var_fcaee046e7015d1d;
        var_3531700e2b091b5 = var_fcaee046e7015d1d;
    }
    variantid = undefined;
    if (isdefined(self.var_a6dd5c7e74106ce3)) {
        variantid = self.var_a6dd5c7e74106ce3[var_f938d1f69f014a80];
    }
    if (!isdefined(var_d13692417de5892b) || var_d13692417de5892b != var_f938d1f69f014a80) {
        namespace_1a507865f681850e::giveequipment(var_f938d1f69f014a80, var_5486524e0058f303, undefined, variantid);
    }
    namespace_1a507865f681850e::setequipmentammo(var_f938d1f69f014a80, var_3531700e2b091b5);
    return var_9a4bfefba093608;
}

// Namespace namespace_f808ba0ae0debcf5/namespace_2c26c0b30925e75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x365
// Size: 0x3a
function function_f6c92134390e67b5(itemtype) {
    switch (itemtype) {
    case #"hash_339227cb650975db":
        return "primary";
    case #"hash_850999d7864fa3b4":
        return "secondary";
        break;
    }
    return undefined;
}

// Namespace namespace_f808ba0ae0debcf5/namespace_2c26c0b30925e75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a7
// Size: 0x80
function function_6bf5d4e670f4f0ff(slot) {
    itembundle = undefined;
    quantity = 0;
    var_52860556dee4b1a7 = namespace_1a507865f681850e::getcurrentequipment(slot);
    if (!isdefined(var_52860556dee4b1a7)) {
        return [0:itembundle, 1:quantity];
    }
    var_fbe755f0978c0369 = function_61d960957fcf3ca0(var_52860556dee4b1a7);
    if (isdefined(var_fbe755f0978c0369)) {
        itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
        quantity = namespace_1a507865f681850e::getequipmentammo(var_52860556dee4b1a7);
    }
    return [0:itembundle, 1:quantity];
}

// Namespace namespace_f808ba0ae0debcf5/namespace_2c26c0b30925e75
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42f
// Size: 0xe
function function_39b9fdb77f6046ba() {
    return function_6bf5d4e670f4f0ff("primary");
}

// Namespace namespace_f808ba0ae0debcf5/namespace_2c26c0b30925e75
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x445
// Size: 0xe
function function_bed0a54fd4a86617() {
    return function_6bf5d4e670f4f0ff("secondary");
}

// Namespace namespace_f808ba0ae0debcf5/namespace_2c26c0b30925e75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b
// Size: 0x18
function function_1d00e4c0929ece86(quantity) {
    return function_20738e750332ef3b("primary", quantity);
}

// Namespace namespace_f808ba0ae0debcf5/namespace_2c26c0b30925e75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47b
// Size: 0x18
function function_a57dfcd418fa8691(quantity) {
    return function_20738e750332ef3b("secondary", quantity);
}

// Namespace namespace_f808ba0ae0debcf5/namespace_2c26c0b30925e75
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49b
// Size: 0x87
function function_20738e750332ef3b(var_11d2f075e9a0e643, quantity) {
    if (!isdefined(var_11d2f075e9a0e643)) {
        return 0;
    }
    equipmentref = getcurrentequipment(var_11d2f075e9a0e643);
    if (!isdefined(equipmentref)) {
        return 0;
    }
    var_ff239359935aa777 = getequipmentammo(equipmentref);
    var_a28bd7f30254c8a0 = 0;
    if (isdefined(quantity) && quantity >= 0 && quantity <= var_ff239359935aa777) {
        var_a28bd7f30254c8a0 = var_ff239359935aa777 - quantity;
    }
    if (var_a28bd7f30254c8a0 == 0) {
        namespace_1a507865f681850e::takeequipment(var_11d2f075e9a0e643);
    } else {
        namespace_1a507865f681850e::setequipmentammo(equipmentref, var_a28bd7f30254c8a0);
    }
    return var_ff239359935aa777 - var_a28bd7f30254c8a0;
}

// Namespace namespace_f808ba0ae0debcf5/namespace_2c26c0b30925e75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52a
// Size: 0x6c
function function_6aaed72439e0a22a(quantity) {
    var_57accdc40b2f50e = function_39b9fdb77f6046ba();
    var_ff239359935aa777 = var_57accdc40b2f50e[1];
    var_2814cca693e6ef2d = var_57accdc40b2f50e[0];
    var_1a827f12b6347e9d = var_ff239359935aa777;
    if (isdefined(quantity) && quantity < var_ff239359935aa777) {
        var_1a827f12b6347e9d = quantity;
    }
    if (!isdefined(var_2814cca693e6ef2d)) {
        return;
    }
    if (var_1a827f12b6347e9d <= 0) {
        return;
    }
    function_a2560fe66d697e02(var_2814cca693e6ef2d, var_1a827f12b6347e9d);
}

// Namespace namespace_f808ba0ae0debcf5/namespace_2c26c0b30925e75
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59d
// Size: 0x78
function function_62fa129f91896347(lootid) {
    blueprintIndex = function_64ccc54bdbae5cf6(lootid);
    if (isdefined(blueprintIndex) && blueprintIndex != 0) {
        var_93b3002ebef628b = loot::function_793e8a72cedb8ef3(lootid);
        var_fb5397c466f84c61 = equipment::function_f4f687e4e1edb923(var_93b3002ebef628b);
        return level.var_986acb83cc29ed77.var_970a8dd2fe7c510b[var_fb5397c466f84c61];
    }
    return level.var_986acb83cc29ed77.var_b09fc2aeb718c263[lootid];
}

