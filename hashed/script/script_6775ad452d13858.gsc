// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_600b944a95c3a7bf;

#namespace operator;

// Namespace operator/namespace_465d40bb08a5337a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x274
// Size: 0x39
function private function_8ab21b307bdd9495() {
    /#
        if (getdvarint(@"hash_e6afce2cf5cf7515", 0) == 1) {
            return 1;
        }
        if (getdvar(@"hash_742caa13b3c2e685") == "<unknown string>") {
            return 1;
        }
    #/
    return 0;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b5
// Size: 0x193
function private function_a10148d5861bcad7() {
    if (isdefined(level.var_b4e3b6bdd3147659)) {
        return;
    }
    level.var_b4e3b6bdd3147659 = [];
    if (function_8ab21b307bdd9495()) {
        return;
    }
    var_1a2b600a06ec21f4 = level.var_1a2b600a06ec21f4;
    if (!isdefined(var_1a2b600a06ec21f4.var_1c8e094a23415ce5)) {
        return;
    }
    var_a860f7f507953da5 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_303f703d848b60b4", var_1a2b600a06ec21f4.var_1c8e094a23415ce5));
    /#
        if (!isdefined(var_a860f7f507953da5)) {
            println("<unknown string>" + var_1a2b600a06ec21f4.var_1c8e094a23415ce5);
            return;
        }
    #/
    var_1c8e094a23415ce5 = var_a860f7f507953da5.var_1c8e094a23415ce5;
    for (i = 0; i < var_1c8e094a23415ce5.size; i++) {
        if (!isdefined(var_1c8e094a23415ce5[i].operator)) {
            continue;
        }
        operatorref = var_1c8e094a23415ce5[i].operator;
        /#
            var_6e3de93805f15b71 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_7a53ff4b0b6730f0", var_1c8e094a23415ce5[i].operator));
            if (!isdefined(var_6e3de93805f15b71)) {
                println("<unknown string>" + var_1a2b600a06ec21f4.var_1c8e094a23415ce5 + "<unknown string>" + var_1c8e094a23415ce5[i].operator);
                continue;
            }
        #/
        level.var_b4e3b6bdd3147659[level.var_b4e3b6bdd3147659.size] = operatorref;
    }
    level.var_a4400aa5857d6e62[0] = var_a860f7f507953da5.var_6f8d31c2e53e42c1;
    level.var_a4400aa5857d6e62[1] = var_a860f7f507953da5.var_5b398f7cbbb428fb;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x44f
// Size: 0x20b
function private function_c1fb26911511dc66() {
    if (isdefined(level.var_fbf434d7e58c4d3c)) {
        return;
    }
    function_a10148d5861bcad7();
    level.var_6a1f54ff203845ec = [];
    level.var_fbf434d7e58c4d3c = [];
    level.var_c1a0b417f098e70c = [];
    level.var_a9f4f3ca6a32942f = [];
    if (function_8ab21b307bdd9495()) {
        return;
    }
    foreach (operatorref in level.var_b4e3b6bdd3147659) {
        var_6e3de93805f15b71 = function_a185fde559db8123(operatorref);
        if (!isdefined(var_6e3de93805f15b71)) {
            continue;
        }
        foreach (var_7d6ffe57986670d0 in var_6e3de93805f15b71.skins) {
            if (!isdefined(var_7d6ffe57986670d0.skin)) {
                continue;
            }
            var_ff73ed080233394c = getscriptbundle(function_2ef675c13ca1c4af(%"hash_600bc392d3fffb6f", var_7d6ffe57986670d0.skin));
            skinref = var_7d6ffe57986670d0.skin;
            level.var_6a1f54ff203845ec[level.var_6a1f54ff203845ec.size] = skinref;
            level.var_fbf434d7e58c4d3c[skinref] = operatorref;
            if (isdefined(level.var_c1a0b417f098e70c[operatorref])) {
                level.var_c1a0b417f098e70c[operatorref] = array_add(level.var_c1a0b417f098e70c[operatorref], skinref);
            } else {
                level.var_c1a0b417f098e70c[operatorref] = [0:skinref];
            }
        }
        if (isdefined(var_6e3de93805f15b71.var_f91a44e31cde7d97)) {
            var_ff73ed080233394c = getscriptbundle(function_2ef675c13ca1c4af(%"hash_600bc392d3fffb6f", var_6e3de93805f15b71.var_f91a44e31cde7d97));
            skinref = var_6e3de93805f15b71.var_f91a44e31cde7d97;
            if (isdefined(var_ff73ed080233394c)) {
                level.var_a9f4f3ca6a32942f[operatorref] = skinref;
            }
        }
    }
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x661
// Size: 0x177
function private function_36a7c07e40354ae7() {
    if (isdefined(level.var_ea38f52d9a056cbf)) {
        return;
    }
    level.var_ea38f52d9a056cbf = undefined;
    level.var_4426ab1a2f16d0c5 = [];
    level.var_ac25d91749a63b94 = [];
    level.defaultbody = spawnstruct();
    if (function_8ab21b307bdd9495()) {
        return;
    }
    var_95e750bc139e9da9 = level.var_21e8a7768c0260f2;
    var_728e4ee3adb777cd = getscriptbundle(function_2ef675c13ca1c4af(%"hash_630c0fff6758a320", var_95e750bc139e9da9.var_bc9940f5b35f3ff5));
    /#
        if (!isdefined(var_728e4ee3adb777cd)) {
            println("<unknown string>" + var_95e750bc139e9da9.var_bc9940f5b35f3ff5);
            return;
        }
    #/
    var_8cb8b4b4888c342d = var_728e4ee3adb777cd.var_bc9940f5b35f3ff5;
    level.var_ea38f52d9a056cbf = [];
    var_d636631af61ab72f = 0;
    for (i = 0; i < var_8cb8b4b4888c342d.size; i++) {
        var_2404f74193c5e52 = var_8cb8b4b4888c342d[i].var_e61c16dcbaffd749;
        if (isdefined(var_2404f74193c5e52) && var_2404f74193c5e52 != "") {
            var_d40ce6f1122a9111 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_5401bb5448ac823c", var_2404f74193c5e52));
            level.var_ea38f52d9a056cbf[level.var_ea38f52d9a056cbf.size] = var_d40ce6f1122a9111;
            level.var_4426ab1a2f16d0c5[var_d40ce6f1122a9111.model] = var_d636631af61ab72f;
            level.var_ac25d91749a63b94[var_d40ce6f1122a9111.idx] = var_d636631af61ab72f;
            var_d636631af61ab72f++;
        }
    }
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7df
// Size: 0x17b
function private function_53b243a75e43d0af() {
    if (isdefined(level.var_7b5ee4f867ed7544)) {
        return;
    }
    level.var_7b5ee4f867ed7544 = [];
    level.var_7aa36883fc908dd1 = [];
    if (function_8ab21b307bdd9495()) {
        return;
    }
    var_1a2b600a06ec21f4 = level.var_1a2b600a06ec21f4;
    if (!isdefined(var_1a2b600a06ec21f4.execution_list)) {
        return;
    }
    var_edd8be499278b105 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_3cf279fa8ccaf24e", var_1a2b600a06ec21f4.execution_list));
    /#
        if (!isdefined(var_edd8be499278b105)) {
            println("<unknown string>" + var_1a2b600a06ec21f4.execution_list);
            return;
        }
    #/
    executionlist = var_edd8be499278b105.var_f56937ae2076fd;
    for (i = 0; i < executionlist.size; i++) {
        if (!isdefined(executionlist[i].var_a024afaa383fbb1)) {
            continue;
        }
        var_e294f074de5622d1 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_3c0bcccfd8362f86", executionlist[i].var_a024afaa383fbb1));
        executionref = executionlist[i].var_a024afaa383fbb1;
        /#
            if (!isdefined(var_e294f074de5622d1)) {
                println("<unknown string>" + var_1a2b600a06ec21f4.execution_list + "<unknown string>" + executionlist[i].var_a024afaa383fbb1);
                continue;
            }
        #/
        level.var_7b5ee4f867ed7544[executionref] = var_e294f074de5622d1;
        level.var_7aa36883fc908dd1[level.var_7aa36883fc908dd1.size] = executionref;
    }
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x961
// Size: 0x6c
function private function_a185fde559db8123(operatorref, var_faa66d6f4c6c9e1d) {
    function_a10148d5861bcad7();
    if (isdefined(var_faa66d6f4c6c9e1d)) {
        var_6e3de93805f15b71 = function_50f8a8f765bad85e(function_2ef675c13ca1c4af(%"hash_7a53ff4b0b6730f0", operatorref), var_faa66d6f4c6c9e1d);
    } else {
        var_6e3de93805f15b71 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_7a53ff4b0b6730f0", operatorref));
    }
    /#
        assertex(isdefined(var_6e3de93805f15b71), "Can't find operator bundle: " + operatorref);
    #/
    return var_6e3de93805f15b71;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d5
// Size: 0xe1
function private function_a2f84a43b99f877a(skinref, var_faa66d6f4c6c9e1d) {
    function_c1fb26911511dc66();
    if (isdefined(level.var_6a1f54ff203845ec) && function_73e183e02834309d(skinref)) {
        foreach (var_75e4598cf524ee17 in level.var_6a1f54ff203845ec) {
            if (function_40fd49171fad19d3(var_75e4598cf524ee17) == skinref) {
                skinref = var_75e4598cf524ee17;
                break;
            }
        }
    }
    if (isdefined(var_faa66d6f4c6c9e1d)) {
        var_ff73ed080233394c = function_50f8a8f765bad85e(function_2ef675c13ca1c4af(%"hash_600bc392d3fffb6f", skinref), var_faa66d6f4c6c9e1d);
    } else {
        var_ff73ed080233394c = getscriptbundle(function_2ef675c13ca1c4af(%"hash_600bc392d3fffb6f", skinref));
    }
    /#
        assertex(isdefined(var_ff73ed080233394c), "Can't find operator skin bundle: " + skinref);
    #/
    return var_ff73ed080233394c;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xabe
// Size: 0x3a
function private function_23dac01799fd34a3(executionref) {
    function_53b243a75e43d0af();
    /#
        assertex(isdefined(level.var_7b5ee4f867ed7544[executionref]), "Can't find operator execution bundle: " + executionref);
    #/
    return level.var_7b5ee4f867ed7544[executionref];
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb00
// Size: 0x19
function function_54240a5fc41f6590(operatorref) {
    return array_contains(function_462ac94dd54da47d(), operatorref);
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb21
// Size: 0x13
function function_462ac94dd54da47d() {
    function_a10148d5861bcad7();
    return level.var_b4e3b6bdd3147659;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3c
// Size: 0x5a
function getoperatorsuperfaction(operatorref) {
    var_6e3de93805f15b71 = function_a185fde559db8123(operatorref, [0:#"superfaction"]);
    if (isdefined(var_6e3de93805f15b71) && isdefined(var_6e3de93805f15b71.superfaction) && var_6e3de93805f15b71.superfaction == "EAST") {
        return 1;
    }
    return 0;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9e
// Size: 0x52
function getoperatorvoice(operatorref) {
    var_6e3de93805f15b71 = function_a185fde559db8123(operatorref, [0:#"voice"]);
    if (isdefined(var_6e3de93805f15b71) && isdefined(var_6e3de93805f15b71.voice)) {
        return var_6e3de93805f15b71.voice;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf8
// Size: 0x61
function getoperatorgender(operatorref) {
    var_6e3de93805f15b71 = function_a185fde559db8123(operatorref, [0:#"gender"]);
    if (isdefined(var_6e3de93805f15b71) && isdefined(var_6e3de93805f15b71.gender) && var_6e3de93805f15b71.gender == "FEMALE") {
        return "female";
    }
    return "male";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc61
// Size: 0x37
function function_df7d12571397a2b5(operatorref) {
    function_c1fb26911511dc66();
    if (array_contains_key(level.var_a9f4f3ca6a32942f, operatorref)) {
        return level.var_a9f4f3ca6a32942f[operatorref];
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca0
// Size: 0x52
function function_a9722d35258230d2(operatorref) {
    var_6e3de93805f15b71 = function_a185fde559db8123(operatorref, [0:#"hash_ec2fa63fd3594894"]);
    if (isdefined(var_6e3de93805f15b71) && isdefined(var_6e3de93805f15b71.var_3c80c6ef0e6b3da0)) {
        return var_6e3de93805f15b71.var_3c80c6ef0e6b3da0;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfa
// Size: 0x52
function function_179d82270f3ce3bf(operatorref) {
    var_6e3de93805f15b71 = function_a185fde559db8123(operatorref, [0:#"hash_c171c2debd3a3d69"]);
    if (isdefined(var_6e3de93805f15b71) && isdefined(var_6e3de93805f15b71.var_7e1d7d1524ec8b55)) {
        return var_6e3de93805f15b71.var_7e1d7d1524ec8b55;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd54
// Size: 0x52
function function_ada9a2308a4046e2(operatorref) {
    var_6e3de93805f15b71 = function_a185fde559db8123(operatorref, [0:#"suit"]);
    if (isdefined(var_6e3de93805f15b71) && isdefined(var_6e3de93805f15b71.suit)) {
        return var_6e3de93805f15b71.suit;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdae
// Size: 0x4f
function function_422b054f4a5573e0(operatorref) {
    var_6e3de93805f15b71 = function_a185fde559db8123(operatorref, [0:#"hash_1aad59b5bb5eb9fe"]);
    if (isdefined(var_6e3de93805f15b71) && isdefined(var_6e3de93805f15b71.var_842b638c4baa9422)) {
        return var_6e3de93805f15b71.var_842b638c4baa9422;
    }
    return 1;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe05
// Size: 0x58
function function_119cb1191ea939ca(operatorref) {
    var_6e3de93805f15b71 = function_a185fde559db8123(operatorref, [0:#"hash_8be47fb8c17a90ed"]);
    if (isdefined(var_6e3de93805f15b71)) {
        if (isdefined(var_6e3de93805f15b71.var_7a3b40a14e6e0759)) {
            return !var_6e3de93805f15b71.var_7a3b40a14e6e0759;
        } else {
            return 1;
        }
    } else {
        return 0;
    }
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe64
// Size: 0x52
function function_efe20cf7f3e2a003(operatorref) {
    var_6e3de93805f15b71 = function_a185fde559db8123(operatorref, [0:#"hash_ba0793b838dc83b1"]);
    if (isdefined(var_6e3de93805f15b71) && isdefined(var_6e3de93805f15b71.var_31ba528e4a274a85)) {
        return var_6e3de93805f15b71.var_31ba528e4a274a85;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebe
// Size: 0x4e
function function_396b82c66e727528(operatorref) {
    var_6e3de93805f15b71 = function_a185fde559db8123(operatorref, [0:#"lootid"]);
    if (isdefined(var_6e3de93805f15b71) && isdefined(var_6e3de93805f15b71.lootid)) {
        return var_6e3de93805f15b71.lootid;
    }
    return 0;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf14
// Size: 0x53
function function_c0d1f4a038f29b6b(operatorref, var_962ef6817910ec78) {
    function_c1fb26911511dc66();
    if (isdefined(level.var_c1a0b417f098e70c[operatorref])) {
        skinrefs = level.var_c1a0b417f098e70c[operatorref];
        if (var_962ef6817910ec78 >= 0 && var_962ef6817910ec78 < skinrefs.size) {
            return skinrefs[var_962ef6817910ec78];
        }
    }
    return undefined;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6f
// Size: 0x4e
function function_29b2af59258d6501(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"lootid"]);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.lootid)) {
        return var_ff73ed080233394c.lootid;
    }
    return 0;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfc5
// Size: 0x33
function function_58145d3d8b15c8(operatorref) {
    function_c1fb26911511dc66();
    if (array_contains_key(level.var_c1a0b417f098e70c, operatorref)) {
        return level.var_c1a0b417f098e70c[operatorref];
    }
    return [];
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1000
// Size: 0x8d
function function_b3b2c9581b1eea75(operatorref) {
    var_d947b7e87c7243ab = 0;
    if (!isagent(self)) {
        if (utility::issharedfuncdefined("instanceInventory", "getActiveOperatorSkinLootID")) {
            var_d947b7e87c7243ab = [[ utility::getsharedfunc("instanceInventory", "getActiveOperatorSkinLootID") ]](self);
        } else {
            var_d947b7e87c7243ab = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "skin");
        }
    }
    if (!isdefined(var_d947b7e87c7243ab) || var_d947b7e87c7243ab == 0) {
        return function_df7d12571397a2b5(operatorref);
    } else {
        return namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_d947b7e87c7243ab);
    }
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1094
// Size: 0xa3
function function_5e2fa33279816be2(operatorref, var_8e0a26a04f19263d) {
    var_a87fb54d797adf46 = 0;
    if (!isagent(self)) {
        if (utility::issharedfuncdefined("instanceInventory", "getActiveOperatorExecutionLootID")) {
            var_a87fb54d797adf46 = [[ utility::getsharedfunc("instanceInventory", "getActiveOperatorExecutionLootID") ]](self);
        } else {
            var_a87fb54d797adf46 = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "execution");
        }
    }
    if (var_a87fb54d797adf46 == 0) {
        if (isdefined(var_8e0a26a04f19263d) && var_8e0a26a04f19263d != "") {
            return var_8e0a26a04f19263d;
        } else {
            return function_a9722d35258230d2(operatorref);
        }
    } else {
        return namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_a87fb54d797adf46);
    }
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x113e
// Size: 0x6d
function function_ac45022bf37cddfb(operatorref) {
    var_b6c27c8ef03597ed = 0;
    if (!isagent(self)) {
        var_b6c27c8ef03597ed = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "taunt");
    }
    if (var_b6c27c8ef03597ed == 0) {
        return function_179d82270f3ce3bf(operatorref);
    } else {
        var_3ea9cac28c2b94c7 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_b6c27c8ef03597ed);
        return function_45a67ff0b6b4624c(var_3ea9cac28c2b94c7);
    }
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b2
// Size: 0x13
function function_6ab347c553a20a68() {
    function_c1fb26911511dc66();
    return level.var_6a1f54ff203845ec;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11cd
// Size: 0x3a
function function_605079124463a67b(skinref) {
    function_c1fb26911511dc66();
    /#
        assertex(isdefined(level.var_fbf434d7e58c4d3c[skinref]), "Can't find operator from skin ref: " + skinref);
    #/
    return level.var_fbf434d7e58c4d3c[skinref];
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120f
// Size: 0x52
function function_223061772e2a61b9(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"headmodel"]);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.headmodel)) {
        return var_ff73ed080233394c.headmodel;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1269
// Size: 0x52
function function_8eba78e65f4be793(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"bodymodel"]);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.bodymodel)) {
        return var_ff73ed080233394c.bodymodel;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c3
// Size: 0x52
function function_6fa0ec9562a76f6c(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_f171c2efd1b161cf"]);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.var_e3ce410e060b25db)) {
        return var_ff73ed080233394c.var_e3ce410e060b25db;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131d
// Size: 0x52
function function_3af837eb38560aad(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_f0045d079ca24066"]);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.var_dd7ae969382854ba)) {
        return var_ff73ed080233394c.var_dd7ae969382854ba;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1377
// Size: 0x4f
function function_9c50981a840033dc(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_51c2f48c6768f2f3"]);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.var_df0cfcc0964acc07)) {
        return var_ff73ed080233394c.var_df0cfcc0964acc07;
    }
    return 1;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ce
// Size: 0x58
function function_539b94879a3b6157(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_8be47fb8c17a90ed"]);
    if (isdefined(var_ff73ed080233394c)) {
        if (isdefined(var_ff73ed080233394c.var_7a3b40a14e6e0759)) {
            return !var_ff73ed080233394c.var_7a3b40a14e6e0759;
        } else {
            return 1;
        }
    } else {
        return 0;
    }
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142d
// Size: 0x52
function function_9e28d6dc0ac60d69(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_c86ce4ec93e75cac"]);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.var_9fa222741d6899c8)) {
        return var_ff73ed080233394c.var_9fa222741d6899c8;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1487
// Size: 0x52
function function_32d5918a7844bd9a(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_a190b92d12131db0"]);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.var_43e35a3d7240fb8c)) {
        return var_ff73ed080233394c.var_43e35a3d7240fb8c;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e1
// Size: 0x52
function function_112bf281c4f02cd5(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_2e5c6d338f029967"]);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.var_c39442ad4d5b1983)) {
        return var_ff73ed080233394c.var_c39442ad4d5b1983;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x153b
// Size: 0x52
function function_3d7626401bb1161a(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"brinfilsmokesuffix"]);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.brinfilsmokesuffix)) {
        return var_ff73ed080233394c.brinfilsmokesuffix;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1595
// Size: 0x52
function function_c7f632b62e2da6dc(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_e5cac6afd35e1f45"]);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.var_9a0058cb6bccd641)) {
        return var_ff73ed080233394c.var_9a0058cb6bccd641;
    }
    return "";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15ef
// Size: 0x4e
function function_7efecf1510ed84a1(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"lootid"]);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.lootid)) {
        return var_ff73ed080233394c.lootid;
    }
    return 0;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1645
// Size: 0x13
function function_232a4826a2bd2bfd() {
    function_53b243a75e43d0af();
    return level.var_7aa36883fc908dd1;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1660
// Size: 0x3a
function function_ddfc149035f1c97c(var_90b23edbb5fca35c) {
    function_53b243a75e43d0af();
    /#
        assertex(isdefined(level.var_7aa36883fc908dd1[var_90b23edbb5fca35c]), "Can't find operator execution with ID: " + var_90b23edbb5fca35c);
    #/
    return level.var_7aa36883fc908dd1[var_90b23edbb5fca35c];
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a2
// Size: 0x41
function function_3daf6bb451cf826e(executionref) {
    function_53b243a75e43d0af();
    var_90b23edbb5fca35c = array_find(level.var_7aa36883fc908dd1, executionref);
    /#
        assertex(isdefined(var_90b23edbb5fca35c), "Can't find operator execution with ref: " + executionref);
    #/
    return var_90b23edbb5fca35c;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16eb
// Size: 0x40
function function_bbc044f8ae9428a8(executionref) {
    var_e294f074de5622d1 = function_23dac01799fd34a3(executionref);
    if (isdefined(var_e294f074de5622d1) && isdefined(var_e294f074de5622d1.lootid)) {
        return var_e294f074de5622d1.lootid;
    }
    return 0;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1733
// Size: 0x44
function function_75322d3c8f9c9ccb(executionref) {
    var_e294f074de5622d1 = function_23dac01799fd34a3(executionref);
    if (isdefined(var_e294f074de5622d1) && isdefined(var_e294f074de5622d1.execution)) {
        return var_e294f074de5622d1.execution;
    }
    return "none";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x177f
// Size: 0x44
function function_3bd82b573b8f64f3(executionref) {
    var_e294f074de5622d1 = function_23dac01799fd34a3(executionref);
    if (isdefined(var_e294f074de5622d1) && isdefined(var_e294f074de5622d1.propweapon)) {
        return var_e294f074de5622d1.propweapon;
    }
    return "none";
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17cb
// Size: 0x1a
function function_834ef5d317d107fd(var_cf6bbe0312cc267b) {
    return tablelookup("operatorQuips.csv", 0, var_cf6bbe0312cc267b, 1);
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ed
// Size: 0x1b
function function_45a67ff0b6b4624c(var_3ea9cac28c2b94c7) {
    return tablelookup("operatorQuips.csv", 1, var_3ea9cac28c2b94c7, 6);
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1810
// Size: 0x61
function function_8b76557a4ddccf83(bodymodel) {
    function_36a7c07e40354ae7();
    if (array_contains_key(level.var_4426ab1a2f16d0c5, bodymodel)) {
        var_d0adf714c26662f3 = level.var_4426ab1a2f16d0c5[bodymodel];
        return level.var_ea38f52d9a056cbf[var_d0adf714c26662f3];
    }
    /#
        assertmsg("Can't find operator body data by model: " + bodymodel);
    #/
    return level.defaultbody;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1879
// Size: 0x61
function function_bc7534da0e22321a(bodyindex) {
    function_36a7c07e40354ae7();
    if (array_contains_key(level.var_ac25d91749a63b94, bodyindex)) {
        var_d0adf714c26662f3 = level.var_ac25d91749a63b94[bodyindex];
        return level.var_ea38f52d9a056cbf[var_d0adf714c26662f3];
    }
    /#
        assertmsg("Can't find operator body data by index: " + bodyindex);
    #/
    return level.defaultbody;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e2
// Size: 0x40
function function_3cacd1cd869c0feb(bodyindex) {
    var_d40ce6f1122a9111 = function_bc7534da0e22321a(bodyindex);
    return isdefined(var_d40ce6f1122a9111.model) ? "" : var_d40ce6f1122a9111.model;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192a
// Size: 0x40
function function_aa32c85a2c2a2d8b(bodymodel) {
    var_d40ce6f1122a9111 = function_8b76557a4ddccf83(bodymodel);
    return isdefined(var_d40ce6f1122a9111.var_a6d11cbe1850c1a6) ? "" : var_d40ce6f1122a9111.var_a6d11cbe1850c1a6;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1972
// Size: 0x40
function function_6fd12f8316d3acc6(bodymodel) {
    var_d40ce6f1122a9111 = function_8b76557a4ddccf83(bodymodel);
    return isdefined(var_d40ce6f1122a9111.var_b8038eb8d24df748) ? "vestlight" : var_d40ce6f1122a9111.var_b8038eb8d24df748;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ba
// Size: 0x3c
function function_9745c4739bb8fdc0(bodymodel) {
    var_d40ce6f1122a9111 = function_8b76557a4ddccf83(bodymodel);
    return isdefined(var_d40ce6f1122a9111.var_9350091af671d6d8) ? 0 : var_d40ce6f1122a9111.var_9350091af671d6d8;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19fe
// Size: 0x40
function function_df03c0302b44fe9f(bodymodel) {
    var_d40ce6f1122a9111 = function_8b76557a4ddccf83(bodymodel);
    return isdefined(var_d40ce6f1122a9111.var_c235b5cbfdaa44c1) ? "" : var_d40ce6f1122a9111.var_c235b5cbfdaa44c1;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a46
// Size: 0x76
function function_515a572a9271c11b(operator) {
    if (function_8ab21b307bdd9495()) {
        return;
    }
    var_6e3de93805f15b71 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_7a53ff4b0b6730f0", operator));
    operatorref = operator;
    /#
        if (!isdefined(var_6e3de93805f15b71)) {
            println("<unknown string>" + operator);
            return;
        }
    #/
    level.var_b4e3b6bdd3147659[level.var_b4e3b6bdd3147659.size] = operatorref;
    function_1886c9c9213a60a2(operatorref, var_6e3de93805f15b71);
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ac3
// Size: 0x178
function private function_1886c9c9213a60a2(operatorref, var_6e3de93805f15b71) {
    if (function_8ab21b307bdd9495()) {
        return;
    }
    /#
        assert(isdefined(level.var_fbf434d7e58c4d3c));
    #/
    foreach (var_7d6ffe57986670d0 in var_6e3de93805f15b71.skins) {
        var_ff73ed080233394c = getscriptbundle(function_2ef675c13ca1c4af(%"hash_600bc392d3fffb6f", var_7d6ffe57986670d0.skin));
        skinref = var_7d6ffe57986670d0.skin;
        level.var_6a1f54ff203845ec[level.var_6a1f54ff203845ec.size] = skinref;
        level.var_fbf434d7e58c4d3c[skinref] = operatorref;
        if (isdefined(level.var_c1a0b417f098e70c[operatorref])) {
            level.var_c1a0b417f098e70c[operatorref] = array_add(level.var_c1a0b417f098e70c[operatorref], skinref);
        } else {
            level.var_c1a0b417f098e70c[operatorref] = [0:skinref];
        }
    }
    if (isdefined(var_6e3de93805f15b71.var_f91a44e31cde7d97)) {
        var_ff73ed080233394c = getscriptbundle(function_2ef675c13ca1c4af(%"hash_600bc392d3fffb6f", var_6e3de93805f15b71.var_f91a44e31cde7d97));
        skinref = var_6e3de93805f15b71.var_f91a44e31cde7d97;
        if (isdefined(var_ff73ed080233394c)) {
            level.var_a9f4f3ca6a32942f[operatorref] = skinref;
        }
    }
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c42
// Size: 0x40
function function_2dc6ef8b84dfec64(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_6474931f3a449b2a"]);
    return isdefined(var_ff73ed080233394c) ? var_ff73ed080233394c.var_3291e2cbec055766 : undefined;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8a
// Size: 0x40
function function_a317055d4d0a4605(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_b74126130fe1bde8"]);
    return isdefined(var_ff73ed080233394c) ? var_ff73ed080233394c.var_6012de269b5278ac : undefined;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd2
// Size: 0x40
function function_81360519d4836bf7(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_a30796472eab0efe"]);
    return isdefined(var_ff73ed080233394c) ? var_ff73ed080233394c.var_c32ff41e38b39322 : undefined;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1a
// Size: 0x40
function function_8d92d3fb88a9d34(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_babfddf124746871"]);
    return isdefined(var_ff73ed080233394c) ? var_ff73ed080233394c.var_e2ce402981e2259d : undefined;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d62
// Size: 0x40
function function_e0b3eff8c73f5475(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_321fae418d44abbc"]);
    return isdefined(var_ff73ed080233394c) ? var_ff73ed080233394c.var_887c00efb656cce0 : undefined;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1daa
// Size: 0x40
function function_a3195a1d60bb2d90(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref, [0:#"hash_3f979bdff8dd6b0d"]);
    return isdefined(var_ff73ed080233394c) ? var_ff73ed080233394c.var_942d00befa8c1d9 : undefined;
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df2
// Size: 0xe
function function_71eed529fc87a7c3() {
    return level.var_a4400aa5857d6e62[0];
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e08
// Size: 0xf
function function_28b97877f95c9049() {
    return level.var_a4400aa5857d6e62[1];
}

// Namespace operator/namespace_465d40bb08a5337a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1f
// Size: 0x24
function function_9242a55834c7ead8(var_e9a5f25420e74f74) {
    if (var_e9a5f25420e74f74 == 1) {
        return function_28b97877f95c9049();
    } else {
        return function_71eed529fc87a7c3();
    }
}

