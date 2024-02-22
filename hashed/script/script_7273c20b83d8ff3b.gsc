// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5bc86a57086a4774;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_90161fde3c96091c;

// Namespace namespace_90161fde3c96091c/namespace_fd6c84ecada320b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120
// Size: 0x2f
function function_fe852f92145c24a6() {
    function_ac97a4f2ab8c2d53("kfe", "tryAssignTask", &function_36f7c6b5bf8ad6f4);
    function_ac97a4f2ab8c2d53("kfe", "tryBindObjective", &trybindobjective);
}

// Namespace namespace_90161fde3c96091c/namespace_fd6c84ecada320b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156
// Size: 0x3c
function function_36f7c6b5bf8ad6f4(var_17953215dd7c5f9b) {
    flag = function_87e60ed6830d13bc(var_17953215dd7c5f9b.info.subcategory);
    thread function_cf75ac38fdbda3f6(var_17953215dd7c5f9b, flag);
}

// Namespace namespace_90161fde3c96091c/namespace_fd6c84ecada320b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199
// Size: 0x59
function function_87e60ed6830d13bc(subcategory) {
    switch (subcategory) {
    case #"hash_9593e481c78bc405":
        return "fieldUpgrade_used_";
    case #"hash_93c71e7b6c0b81d7":
        return "equipment_used_";
    case #"hash_1cac65e1b8bf24a7":
        return "killstreak_used_";
    default:
        return undefined;
        break;
    }
}

// Namespace namespace_90161fde3c96091c/namespace_fd6c84ecada320b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9
// Size: 0x92
function function_cf75ac38fdbda3f6(var_17953215dd7c5f9b, flag) {
    level endon("game_ended");
    var_17953215dd7c5f9b endon("task_end");
    while (1) {
        itemname = level waittill(flag + var_17953215dd7c5f9b.team);
        if (isdefined(itemname) && (itemname == var_17953215dd7c5f9b.info.ref || issubstr(var_17953215dd7c5f9b.info.ref, "any"))) {
            function_89b8bce3baa45edc(var_17953215dd7c5f9b, 1);
        }
    }
}

// Namespace namespace_90161fde3c96091c/namespace_fd6c84ecada320b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x292
// Size: 0x15b
function function_59c1dbdc2ad03ad6(var_17953215dd7c5f9b, loot) {
    partname = loot function_ec5f4851431f3382();
    state = loot getscriptablepartstate(partname, 1);
    if (!isdefined(state) || state == "hidden") {
        return 0;
    }
    if (isdefined(self.pickupitem) && self.pickupitem == loot) {
        return 0;
    }
    scriptablename = namespace_cb965d2f71fefddc::lootgetscriptablename(loot);
    if (!isdefined(scriptablename)) {
        return 0;
    }
    var_a0ce8000d303764c = level.br_pickups.var_14bd11727c4b6629[scriptablename];
    if (isdefined(var_a0ce8000d303764c) && var_a0ce8000d303764c == var_17953215dd7c5f9b.info.ref) {
        return 1;
    }
    if (issubstr(var_17953215dd7c5f9b.info.ref, "any")) {
        switch (var_17953215dd7c5f9b.info.subcategory) {
        case #"hash_9593e481c78bc405":
            return namespace_cb965d2f71fefddc::issuperpickup(scriptablename);
        case #"hash_93c71e7b6c0b81d7":
            return (namespace_cb965d2f71fefddc::function_b989edd9af4f42c7(scriptablename) || namespace_cb965d2f71fefddc::function_d7c5786a0c42ef6c(scriptablename));
        case #"hash_1cac65e1b8bf24a7":
            return namespace_cb965d2f71fefddc::iskillstreak(scriptablename);
        default:
            return 0;
            break;
        }
    }
    return 0;
}

// Namespace namespace_90161fde3c96091c/namespace_fd6c84ecada320b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f5
// Size: 0x38
function trybindobjective(var_17953215dd7c5f9b) {
    items = getlootscriptablearrayinradius(undefined, undefined, self.origin, 20000);
    function_2e55101ffd0d483c(var_17953215dd7c5f9b, items, &function_59c1dbdc2ad03ad6);
}

