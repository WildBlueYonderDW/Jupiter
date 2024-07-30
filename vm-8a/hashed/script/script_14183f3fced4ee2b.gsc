#using script_7b2517368c79e5bc;
#using script_398835140857d740;

#namespace namespace_ab72fb42cd326323;

// Namespace namespace_ab72fb42cd326323 / namespace_abc8365716fb73a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d
// Size: 0x3e
function function_4113bac1fcc24f04() {
    if (isdefined(level.var_435b6cca8be74d31)) {
        [[ level.var_435b6cca8be74d31 ]]();
        return;
    }
    function_900f562c61c6a5d6("perk", &use_perk, &function_60a287a143186571, &can_use_perk, &function_aac0b757b5a813f6);
}

// Namespace namespace_ab72fb42cd326323 / namespace_abc8365716fb73a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3
// Size: 0x8e
function use_perk(itembundle, item) {
    usedperk = 0;
    if (!istrue(item.fromcache)) {
        usedperk = function_fd9a6fb7a67bcf3e(itembundle.ref);
    } else if (!has_perk(itembundle.ref)) {
        give_perk(itembundle.ref, 1);
        usedperk = 1;
    }
    if (usedperk) {
        return (item.count - 1);
    }
    return item.count;
}

// Namespace namespace_ab72fb42cd326323 / namespace_abc8365716fb73a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a
// Size: 0x24
function function_60a287a143186571(itembundle, item, autouse, allowswap) {
    return false;
}

// Namespace namespace_ab72fb42cd326323 / namespace_abc8365716fb73a3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x187
// Size: 0x35
function can_use_perk(itembundle, item, autouse, allowswap) {
    return !has_perk(itembundle.ref);
}

// Namespace namespace_ab72fb42cd326323 / namespace_abc8365716fb73a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5
// Size: 0x25
function function_aac0b757b5a813f6() {
    itembundle = undefined;
    quantity = 0;
    return [itembundle, quantity];
}

