#using script_600b944a95c3a7bf;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace operator;

// Namespace operator / namespace_465d40bb08a5337a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x274
// Size: 0x38
function private function_8ab21b307bdd9495() {
    /#
        if (getdvarint(@"hash_e6afce2cf5cf7515", 0) == 1) {
            return true;
        }
        if (getdvar(@"hash_742caa13b3c2e685") == "<dev string:x1c>") {
            return true;
        }
    #/
    return false;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2b5
// Size: 0x192
function private function_a10148d5861bcad7() {
    if (isdefined(level.var_b4e3b6bdd3147659)) {
        return;
    }
    level.var_b4e3b6bdd3147659 = [];
    if (function_8ab21b307bdd9495()) {
        return;
    }
    gamemodebundle = level.gamemodebundle;
    if (!isdefined(gamemodebundle.operatorlist)) {
        return;
    }
    operatorlistbundle = getscriptbundle(hashcat(%"hash_303f703d848b60b4", gamemodebundle.operatorlist));
    /#
        if (!isdefined(operatorlistbundle)) {
            println("<dev string:x1e>" + gamemodebundle.operatorlist);
            return;
        }
    #/
    operatorlist = operatorlistbundle.operatorlist;
    for (i = 0; i < operatorlist.size; i++) {
        if (!isdefined(operatorlist[i].operator)) {
            continue;
        }
        operatorbundle = getscriptbundle(hashcat(%"hash_7a53ff4b0b6730f0", operatorlist[i].operator));
        operatorref = operatorlist[i].operator;
        /#
            if (!isdefined(operatorbundle)) {
                println("<dev string:x49>" + gamemodebundle.operatorlist + "<dev string:x7d>" + operatorlist[i].operator);
                continue;
            }
        #/
        level.var_b4e3b6bdd3147659[level.var_b4e3b6bdd3147659.size] = operatorref;
    }
    level.var_a4400aa5857d6e62[0] = operatorlistbundle.var_6f8d31c2e53e42c1;
    level.var_a4400aa5857d6e62[1] = operatorlistbundle.var_5b398f7cbbb428fb;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x44f
// Size: 0x202
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
        operatorbundle = function_a185fde559db8123(operatorref);
        if (!isdefined(operatorbundle)) {
            continue;
        }
        foreach (var_7d6ffe57986670d0 in operatorbundle.skins) {
            if (!isdefined(var_7d6ffe57986670d0.skin)) {
                continue;
            }
            var_ff73ed080233394c = getscriptbundle(hashcat(%"hash_600bc392d3fffb6f", var_7d6ffe57986670d0.skin));
            skinref = var_7d6ffe57986670d0.skin;
            level.var_6a1f54ff203845ec[level.var_6a1f54ff203845ec.size] = skinref;
            level.var_fbf434d7e58c4d3c[skinref] = operatorref;
            if (isdefined(level.var_c1a0b417f098e70c[operatorref])) {
                level.var_c1a0b417f098e70c[operatorref] = array_add(level.var_c1a0b417f098e70c[operatorref], skinref);
                continue;
            }
            level.var_c1a0b417f098e70c[operatorref] = [skinref];
        }
        if (isdefined(operatorbundle.var_f91a44e31cde7d97)) {
            var_ff73ed080233394c = getscriptbundle(hashcat(%"hash_600bc392d3fffb6f", operatorbundle.var_f91a44e31cde7d97));
            skinref = operatorbundle.var_f91a44e31cde7d97;
            if (isdefined(var_ff73ed080233394c)) {
                level.var_a9f4f3ca6a32942f[operatorref] = skinref;
            }
        }
    }
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x659
// Size: 0x179
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
    projectscriptbundle = level.projectbundle;
    var_728e4ee3adb777cd = getscriptbundle(hashcat(%"hash_630c0fff6758a320", projectscriptbundle.var_bc9940f5b35f3ff5));
    /#
        if (!isdefined(var_728e4ee3adb777cd)) {
            println("<dev string:x80>" + projectscriptbundle.var_bc9940f5b35f3ff5);
            return;
        }
    #/
    bodylist = var_728e4ee3adb777cd.var_bc9940f5b35f3ff5;
    level.var_ea38f52d9a056cbf = [];
    numbodies = 0;
    for (i = 0; i < bodylist.size; i++) {
        bodybundlename = bodylist[i].operatorbody;
        if (isdefined(bodybundlename) && bodybundlename != "") {
            bodydata = getscriptbundle(hashcat(%"hash_5401bb5448ac823c", bodybundlename));
            level.var_ea38f52d9a056cbf = array_add(level.var_ea38f52d9a056cbf, bodydata);
            level.var_4426ab1a2f16d0c5[bodydata.model] = numbodies;
            level.var_ac25d91749a63b94[bodydata.idx] = numbodies;
            numbodies++;
        }
    }
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7da
// Size: 0x17a
function private function_53b243a75e43d0af() {
    if (isdefined(level.var_7b5ee4f867ed7544)) {
        return;
    }
    level.var_7b5ee4f867ed7544 = [];
    level.var_7aa36883fc908dd1 = [];
    if (function_8ab21b307bdd9495()) {
        return;
    }
    gamemodebundle = level.gamemodebundle;
    if (!isdefined(gamemodebundle.execution_list)) {
        return;
    }
    var_edd8be499278b105 = getscriptbundle(hashcat(%"hash_3cf279fa8ccaf24e", gamemodebundle.execution_list));
    /#
        if (!isdefined(var_edd8be499278b105)) {
            println("<dev string:xaf>" + gamemodebundle.execution_list);
            return;
        }
    #/
    executionlist = var_edd8be499278b105.var_f56937ae2076fd;
    for (i = 0; i < executionlist.size; i++) {
        if (!isdefined(executionlist[i].operatorexecution)) {
            continue;
        }
        executionbundle = getscriptbundle(hashcat(%"hash_3c0bcccfd8362f86", executionlist[i].operatorexecution));
        executionref = executionlist[i].operatorexecution;
        /#
            if (!isdefined(executionbundle)) {
                println("<dev string:xdc>" + gamemodebundle.execution_list + "<dev string:x7d>" + executionlist[i].operatorexecution);
                continue;
            }
        #/
        level.var_7b5ee4f867ed7544[executionref] = executionbundle;
        level.var_7aa36883fc908dd1[level.var_7aa36883fc908dd1.size] = executionref;
    }
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x95c
// Size: 0x44
function private function_a185fde559db8123(operatorref) {
    function_a10148d5861bcad7();
    operatorbundle = getscriptbundle(hashcat(%"hash_7a53ff4b0b6730f0", operatorref));
    assertex(isdefined(operatorbundle), "Can't find operator bundle: " + operatorref);
    return operatorbundle;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9a9
// Size: 0xb5
function private function_a2f84a43b99f877a(skinref) {
    function_c1fb26911511dc66();
    if (isdefined(level.var_6a1f54ff203845ec) && function_73e183e02834309d(skinref)) {
        foreach (var_75e4598cf524ee17 in level.var_6a1f54ff203845ec) {
            if (function_40fd49171fad19d3(var_75e4598cf524ee17) == skinref) {
                skinref = var_75e4598cf524ee17;
                break;
            }
        }
    }
    var_ff73ed080233394c = getscriptbundle(hashcat(%"hash_600bc392d3fffb6f", skinref));
    assertex(isdefined(var_ff73ed080233394c), "Can't find operator skin bundle: " + skinref);
    return var_ff73ed080233394c;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa67
// Size: 0x39
function private function_23dac01799fd34a3(executionref) {
    function_53b243a75e43d0af();
    assertex(isdefined(level.var_7b5ee4f867ed7544[executionref]), "Can't find operator execution bundle: " + executionref);
    return level.var_7b5ee4f867ed7544[executionref];
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa9
// Size: 0x18
function function_54240a5fc41f6590(operatorref) {
    return array_contains(function_462ac94dd54da47d(), operatorref);
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaca
// Size: 0x12
function function_462ac94dd54da47d() {
    function_a10148d5861bcad7();
    return level.var_b4e3b6bdd3147659;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae5
// Size: 0x4b
function getoperatorsuperfaction(operatorref) {
    operatorbundle = function_a185fde559db8123(operatorref);
    if (isdefined(operatorbundle) && isdefined(operatorbundle.superfaction) && operatorbundle.superfaction == "EAST") {
        return true;
    }
    return false;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb39
// Size: 0x43
function getoperatorvoice(operatorref) {
    operatorbundle = function_a185fde559db8123(operatorref);
    if (isdefined(operatorbundle) && isdefined(operatorbundle.voice)) {
        return operatorbundle.voice;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb85
// Size: 0x52
function getoperatorgender(operatorref) {
    operatorbundle = function_a185fde559db8123(operatorref);
    if (isdefined(operatorbundle) && isdefined(operatorbundle.gender) && operatorbundle.gender == "FEMALE") {
        return "female";
    }
    return "male";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe0
// Size: 0x36
function function_df7d12571397a2b5(operatorref) {
    function_c1fb26911511dc66();
    if (array_contains_key(level.var_a9f4f3ca6a32942f, operatorref)) {
        return level.var_a9f4f3ca6a32942f[operatorref];
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc1f
// Size: 0x43
function function_a9722d35258230d2(operatorref) {
    operatorbundle = function_a185fde559db8123(operatorref);
    if (isdefined(operatorbundle) && isdefined(operatorbundle.defaultexecution)) {
        return operatorbundle.defaultexecution;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc6b
// Size: 0x43
function function_179d82270f3ce3bf(operatorref) {
    operatorbundle = function_a185fde559db8123(operatorref);
    if (isdefined(operatorbundle) && isdefined(operatorbundle.defaultquip)) {
        return operatorbundle.defaultquip;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcb7
// Size: 0x43
function function_ada9a2308a4046e2(operatorref) {
    operatorbundle = function_a185fde559db8123(operatorref);
    if (isdefined(operatorbundle) && isdefined(operatorbundle.suit)) {
        return operatorbundle.suit;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd03
// Size: 0x40
function function_422b054f4a5573e0(operatorref) {
    operatorbundle = function_a185fde559db8123(operatorref);
    if (isdefined(operatorbundle) && isdefined(operatorbundle.var_842b638c4baa9422)) {
        return operatorbundle.var_842b638c4baa9422;
    }
    return 1;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd4c
// Size: 0x43
function function_efe20cf7f3e2a003(operatorref) {
    operatorbundle = function_a185fde559db8123(operatorref);
    if (isdefined(operatorbundle) && isdefined(operatorbundle.botgroup)) {
        return operatorbundle.botgroup;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd98
// Size: 0x3f
function function_396b82c66e727528(operatorref) {
    operatorbundle = function_a185fde559db8123(operatorref);
    if (isdefined(operatorbundle) && isdefined(operatorbundle.lootid)) {
        return operatorbundle.lootid;
    }
    return 0;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xde0
// Size: 0x52
function function_c0d1f4a038f29b6b(operatorref, var_962ef6817910ec78) {
    function_c1fb26911511dc66();
    if (isdefined(level.var_c1a0b417f098e70c[operatorref])) {
        skinRefs = level.var_c1a0b417f098e70c[operatorref];
        if (var_962ef6817910ec78 >= 0 && var_962ef6817910ec78 < skinRefs.size) {
            return skinRefs[var_962ef6817910ec78];
        }
    }
    return undefined;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe3b
// Size: 0x3f
function function_29b2af59258d6501(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.lootid)) {
        return var_ff73ed080233394c.lootid;
    }
    return 0;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe83
// Size: 0x32
function function_58145d3d8b15c8(operatorref) {
    function_c1fb26911511dc66();
    if (array_contains_key(level.var_c1a0b417f098e70c, operatorref)) {
        return level.var_c1a0b417f098e70c[operatorref];
    }
    return [];
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xebe
// Size: 0x8c
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
    }
    return namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(var_d947b7e87c7243ab);
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf52
// Size: 0xa2
function function_5e2fa33279816be2(operatorref, var_8e0a26a04f19263d) {
    executionlootid = 0;
    if (!isagent(self)) {
        if (utility::issharedfuncdefined("instanceInventory", "getActiveOperatorExecutionLootID")) {
            executionlootid = [[ utility::getsharedfunc("instanceInventory", "getActiveOperatorExecutionLootID") ]](self);
        } else {
            executionlootid = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "execution");
        }
    }
    if (executionlootid == 0) {
        if (isdefined(var_8e0a26a04f19263d) && var_8e0a26a04f19263d != "") {
            return var_8e0a26a04f19263d;
        } else {
            return function_a9722d35258230d2(operatorref);
        }
        return;
    }
    return namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(executionlootid);
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xffc
// Size: 0x6c
function function_ac45022bf37cddfb(operatorref) {
    quiplootid = 0;
    if (!isagent(self)) {
        quiplootid = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "taunt");
    }
    if (quiplootid == 0) {
        return function_179d82270f3ce3bf(operatorref);
    }
    quipref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(quiplootid);
    return function_45a67ff0b6b4624c(quipref);
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1070
// Size: 0x12
function function_6ab347c553a20a68() {
    function_c1fb26911511dc66();
    return level.var_6a1f54ff203845ec;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x108b
// Size: 0x39
function function_605079124463a67b(skinref) {
    function_c1fb26911511dc66();
    assertex(isdefined(level.var_fbf434d7e58c4d3c[skinref]), "Can't find operator from skin ref: " + skinref);
    return level.var_fbf434d7e58c4d3c[skinref];
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10cd
// Size: 0x43
function function_223061772e2a61b9(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.headmodel)) {
        return var_ff73ed080233394c.headmodel;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1119
// Size: 0x43
function function_8eba78e65f4be793(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.bodymodel)) {
        return var_ff73ed080233394c.bodymodel;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1165
// Size: 0x43
function function_6fa0ec9562a76f6c(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.var_e3ce410e060b25db)) {
        return var_ff73ed080233394c.var_e3ce410e060b25db;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11b1
// Size: 0x43
function function_3af837eb38560aad(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.var_dd7ae969382854ba)) {
        return var_ff73ed080233394c.var_dd7ae969382854ba;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11fd
// Size: 0x40
function function_9c50981a840033dc(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.canequip)) {
        return var_ff73ed080233394c.canequip;
    }
    return 1;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1246
// Size: 0x43
function function_9e28d6dc0ac60d69(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.lootimage)) {
        return var_ff73ed080233394c.lootimage;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1292
// Size: 0x43
function function_32d5918a7844bd9a(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.var_43e35a3d7240fb8c)) {
        return var_ff73ed080233394c.var_43e35a3d7240fb8c;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12de
// Size: 0x43
function function_112bf281c4f02cd5(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.var_c39442ad4d5b1983)) {
        return var_ff73ed080233394c.var_c39442ad4d5b1983;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x132a
// Size: 0x43
function function_3d7626401bb1161a(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.brinfilsmokesuffix)) {
        return var_ff73ed080233394c.brinfilsmokesuffix;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1376
// Size: 0x43
function function_c7f632b62e2da6dc(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.var_9a0058cb6bccd641)) {
        return var_ff73ed080233394c.var_9a0058cb6bccd641;
    }
    return "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13c2
// Size: 0x3f
function function_7efecf1510ed84a1(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    if (isdefined(var_ff73ed080233394c) && isdefined(var_ff73ed080233394c.lootid)) {
        return var_ff73ed080233394c.lootid;
    }
    return 0;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x140a
// Size: 0x12
function function_232a4826a2bd2bfd() {
    function_53b243a75e43d0af();
    return level.var_7aa36883fc908dd1;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1425
// Size: 0x39
function function_ddfc149035f1c97c(executionid) {
    function_53b243a75e43d0af();
    assertex(isdefined(level.var_7aa36883fc908dd1[executionid]), "Can't find operator execution with ID: " + executionid);
    return level.var_7aa36883fc908dd1[executionid];
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1467
// Size: 0x40
function function_3daf6bb451cf826e(executionref) {
    function_53b243a75e43d0af();
    executionid = array_find(level.var_7aa36883fc908dd1, executionref);
    assertex(isdefined(executionid), "Can't find operator execution with ref: " + executionref);
    return executionid;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14b0
// Size: 0x3f
function function_bbc044f8ae9428a8(executionref) {
    executionbundle = function_23dac01799fd34a3(executionref);
    if (isdefined(executionbundle) && isdefined(executionbundle.lootid)) {
        return executionbundle.lootid;
    }
    return 0;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14f8
// Size: 0x43
function function_75322d3c8f9c9ccb(executionref) {
    executionbundle = function_23dac01799fd34a3(executionref);
    if (isdefined(executionbundle) && isdefined(executionbundle.execution)) {
        return executionbundle.execution;
    }
    return "none";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1544
// Size: 0x43
function function_3bd82b573b8f64f3(executionref) {
    executionbundle = function_23dac01799fd34a3(executionref);
    if (isdefined(executionbundle) && isdefined(executionbundle.propweapon)) {
        return executionbundle.propweapon;
    }
    return "none";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1590
// Size: 0x19
function function_834ef5d317d107fd(quipid) {
    return tablelookup("operatorQuips.csv", 0, quipid, 1);
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15b2
// Size: 0x1a
function function_45a67ff0b6b4624c(quipref) {
    return tablelookup("operatorQuips.csv", 1, quipref, 6);
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15d5
// Size: 0x60
function function_8b76557a4ddccf83(bodymodel) {
    function_36a7c07e40354ae7();
    if (array_contains_key(level.var_4426ab1a2f16d0c5, bodymodel)) {
        var_d0adf714c26662f3 = level.var_4426ab1a2f16d0c5[bodymodel];
        return level.var_ea38f52d9a056cbf[var_d0adf714c26662f3];
    }
    assertmsg("Can't find operator body data by model: " + bodymodel);
    return level.defaultbody;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x163e
// Size: 0x60
function function_bc7534da0e22321a(bodyindex) {
    function_36a7c07e40354ae7();
    if (array_contains_key(level.var_ac25d91749a63b94, bodyindex)) {
        var_d0adf714c26662f3 = level.var_ac25d91749a63b94[bodyindex];
        return level.var_ea38f52d9a056cbf[var_d0adf714c26662f3];
    }
    assertmsg("Can't find operator body data by index: " + bodyindex);
    return level.defaultbody;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16a7
// Size: 0x3f
function function_3cacd1cd869c0feb(bodyindex) {
    bodydata = function_bc7534da0e22321a(bodyindex);
    return isdefined(bodydata.model) ? bodydata.model : "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16ef
// Size: 0x3f
function function_aa32c85a2c2a2d8b(bodymodel) {
    bodydata = function_8b76557a4ddccf83(bodymodel);
    return isdefined(bodydata.armmodel) ? bodydata.armmodel : "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1737
// Size: 0x3f
function function_6fd12f8316d3acc6(bodymodel) {
    bodydata = function_8b76557a4ddccf83(bodymodel);
    return isdefined(bodydata.foleytype) ? bodydata.foleytype : "vestlight";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x177f
// Size: 0x3b
function function_9745c4739bb8fdc0(bodymodel) {
    bodydata = function_8b76557a4ddccf83(bodymodel);
    return isdefined(bodydata.var_9350091af671d6d8) ? bodydata.var_9350091af671d6d8 : 0;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17c3
// Size: 0x3f
function function_df03c0302b44fe9f(bodymodel) {
    bodydata = function_8b76557a4ddccf83(bodymodel);
    return isdefined(bodydata.watchstyle) ? bodydata.watchstyle : "";
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x180b
// Size: 0x75
function function_515a572a9271c11b(operator) {
    if (function_8ab21b307bdd9495()) {
        return;
    }
    operatorbundle = getscriptbundle(hashcat(%"hash_7a53ff4b0b6730f0", operator));
    operatorref = operator;
    /#
        if (!isdefined(operatorbundle)) {
            println("<dev string:x111>" + operator);
            return;
        }
    #/
    level.var_b4e3b6bdd3147659[level.var_b4e3b6bdd3147659.size] = operatorref;
    function_1886c9c9213a60a2(operatorref, operatorbundle);
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1888
// Size: 0x173
function private function_1886c9c9213a60a2(operatorref, operatorbundle) {
    if (function_8ab21b307bdd9495()) {
        return;
    }
    assert(isdefined(level.var_fbf434d7e58c4d3c));
    foreach (var_7d6ffe57986670d0 in operatorbundle.skins) {
        var_ff73ed080233394c = getscriptbundle(hashcat(%"hash_600bc392d3fffb6f", var_7d6ffe57986670d0.skin));
        skinref = var_7d6ffe57986670d0.skin;
        level.var_6a1f54ff203845ec[level.var_6a1f54ff203845ec.size] = skinref;
        level.var_fbf434d7e58c4d3c[skinref] = operatorref;
        if (isdefined(level.var_c1a0b417f098e70c[operatorref])) {
            level.var_c1a0b417f098e70c[operatorref] = array_add(level.var_c1a0b417f098e70c[operatorref], skinref);
            continue;
        }
        level.var_c1a0b417f098e70c[operatorref] = [skinref];
    }
    if (isdefined(operatorbundle.var_f91a44e31cde7d97)) {
        var_ff73ed080233394c = getscriptbundle(hashcat(%"hash_600bc392d3fffb6f", operatorbundle.var_f91a44e31cde7d97));
        skinref = operatorbundle.var_f91a44e31cde7d97;
        if (isdefined(var_ff73ed080233394c)) {
            level.var_a9f4f3ca6a32942f[operatorref] = skinref;
        }
    }
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a03
// Size: 0x31
function function_2dc6ef8b84dfec64(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    return isdefined(var_ff73ed080233394c) ? var_ff73ed080233394c.var_3291e2cbec055766 : undefined;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a3d
// Size: 0x31
function function_a317055d4d0a4605(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    return isdefined(var_ff73ed080233394c) ? var_ff73ed080233394c.var_6012de269b5278ac : undefined;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a77
// Size: 0x31
function function_81360519d4836bf7(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    return isdefined(var_ff73ed080233394c) ? var_ff73ed080233394c.var_c32ff41e38b39322 : undefined;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab1
// Size: 0x31
function function_8d92d3fb88a9d34(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    return isdefined(var_ff73ed080233394c) ? var_ff73ed080233394c.var_e2ce402981e2259d : undefined;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1aeb
// Size: 0x31
function function_e0b3eff8c73f5475(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    return isdefined(var_ff73ed080233394c) ? var_ff73ed080233394c.var_887c00efb656cce0 : undefined;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b25
// Size: 0x31
function function_a3195a1d60bb2d90(skinref) {
    var_ff73ed080233394c = function_a2f84a43b99f877a(skinref);
    return isdefined(var_ff73ed080233394c) ? var_ff73ed080233394c.var_942d00befa8c1d9 : undefined;
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b5f
// Size: 0xd
function function_71eed529fc87a7c3() {
    return level.var_a4400aa5857d6e62[0];
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b75
// Size: 0xe
function function_28b97877f95c9049() {
    return level.var_a4400aa5857d6e62[1];
}

// Namespace operator / namespace_465d40bb08a5337a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8c
// Size: 0x23
function function_9242a55834c7ead8(var_e9a5f25420e74f74) {
    if (var_e9a5f25420e74f74 == 1) {
        return function_28b97877f95c9049();
    }
    return function_71eed529fc87a7c3();
}

