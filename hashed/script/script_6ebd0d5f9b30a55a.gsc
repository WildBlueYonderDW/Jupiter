// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_155a4cfefe8c5cd5;

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3
// Size: 0x45
function function_e0143bb4b41a77c4() {
    var_ceaa69d97f86e3f4 = spawnstruct();
    var_ceaa69d97f86e3f4.startnode = undefined;
    var_ceaa69d97f86e3f4.endnode = undefined;
    var_ceaa69d97f86e3f4.var_f04e715a0d2ee220 = 0;
    var_ceaa69d97f86e3f4.var_dd1ede0842d8e484 = 1;
    return var_ceaa69d97f86e3f4;
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x120
// Size: 0x24
function function_dd1ede0842d8e484(var_ab177af9e881324f) {
    return isstruct(var_ab177af9e881324f) && var_ab177af9e881324f.var_dd1ede0842d8e484 == 1;
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c
// Size: 0x2a
function function_11a80ea7fe6ea9e0() {
    node = spawnstruct();
    node.nextnode = undefined;
    node.prevnode = undefined;
    return node;
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e
// Size: 0x117
function function_ba05da019b3ecd4(newnode, var_f3b9a2fb70be7) {
    /#
        assertex(function_dd1ede0842d8e484(self), "This function requires that 'self' is a Linked List struct as defined in 'linked_list.gsc'");
    #/
    var_ceaa69d97f86e3f4 = self;
    if (var_ceaa69d97f86e3f4 function_c6439f53c39b5342() == 0) {
        var_ceaa69d97f86e3f4.startnode = newnode;
        var_ceaa69d97f86e3f4.endnode = newnode;
    } else if (istrue(var_f3b9a2fb70be7)) {
        newnode.nextnode = var_ceaa69d97f86e3f4.startnode;
        var_ceaa69d97f86e3f4.startnode.prevnode = newnode;
        var_ceaa69d97f86e3f4.startnode = newnode;
    } else {
        var_ceaa69d97f86e3f4.endnode.nextnode = newnode;
        newnode.prevnode = var_ceaa69d97f86e3f4.endnode;
        var_ceaa69d97f86e3f4.endnode = newnode;
    }
    var_ceaa69d97f86e3f4.var_f04e715a0d2ee220 = var_ceaa69d97f86e3f4.var_f04e715a0d2ee220 + 1;
    /#
        if (var_ceaa69d97f86e3f4 function_63fe00fb459ea917()) {
            function_22573254f7088750("<unknown string>");
            var_ceaa69d97f86e3f4 function_808f3bc4b7fcee6d();
        }
    #/
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c
// Size: 0x140
function function_5aa07df03575a9a9(var_7dcdc8e8873aeb30) {
    /#
        assertex(function_dd1ede0842d8e484(self), "This function requires that 'self' is a Linked List struct as defined in 'linked_list.gsc'");
    #/
    var_ceaa69d97f86e3f4 = self;
    var_1d260fae3f3dc7c3 = !isdefined(var_7dcdc8e8873aeb30.prevnode);
    var_ff83b6a11c06d192 = !isdefined(var_7dcdc8e8873aeb30.nextnode);
    if (var_1d260fae3f3dc7c3 && var_ceaa69d97f86e3f4 function_c6439f53c39b5342() > 1) {
        var_ceaa69d97f86e3f4.startnode = var_7dcdc8e8873aeb30.nextnode;
    } else if (!var_1d260fae3f3dc7c3) {
        var_7dcdc8e8873aeb30.prevnode.nextnode = var_7dcdc8e8873aeb30.nextnode;
    }
    if (var_ff83b6a11c06d192 && var_ceaa69d97f86e3f4 function_c6439f53c39b5342() > 1) {
        var_ceaa69d97f86e3f4.endnode = var_7dcdc8e8873aeb30.prevnode;
    } else if (!var_ff83b6a11c06d192) {
        var_7dcdc8e8873aeb30.nextnode.prevnode = var_7dcdc8e8873aeb30.prevnode;
    }
    var_ceaa69d97f86e3f4.var_f04e715a0d2ee220 = max(var_ceaa69d97f86e3f4.var_f04e715a0d2ee220 - 1, 0);
    /#
        if (var_ceaa69d97f86e3f4 function_63fe00fb459ea917()) {
            function_22573254f7088750("<unknown string>");
            var_ceaa69d97f86e3f4 function_808f3bc4b7fcee6d();
        }
    #/
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e3
// Size: 0xd1
function function_83a787c869fd4ca3() {
    /#
        assertex(function_dd1ede0842d8e484(self), "This function requires that 'self' is a Linked List struct as defined in 'linked_list.gsc'");
    #/
    var_ceaa69d97f86e3f4 = self;
    if (isdefined(var_ceaa69d97f86e3f4.startnode) && var_ceaa69d97f86e3f4 function_c6439f53c39b5342() > 1) {
        var_ceaa69d97f86e3f4.startnode = var_ceaa69d97f86e3f4.startnode.nextnode;
        var_ceaa69d97f86e3f4.startnode.prevnode = undefined;
    } else {
        var_ceaa69d97f86e3f4.startnode = undefined;
        var_ceaa69d97f86e3f4.endnode = undefined;
    }
    var_ceaa69d97f86e3f4.var_f04e715a0d2ee220 = max(var_ceaa69d97f86e3f4.var_f04e715a0d2ee220 - 1, 0);
    /#
        if (var_ceaa69d97f86e3f4 function_63fe00fb459ea917()) {
            function_22573254f7088750("<unknown string>");
            var_ceaa69d97f86e3f4 function_808f3bc4b7fcee6d();
        }
    #/
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bb
// Size: 0xd1
function function_112e8336148d5272() {
    /#
        assertex(function_dd1ede0842d8e484(self), "This function requires that 'self' is a Linked List struct as defined in 'linked_list.gsc'");
    #/
    var_ceaa69d97f86e3f4 = self;
    if (isdefined(var_ceaa69d97f86e3f4.endnode) && var_ceaa69d97f86e3f4 function_c6439f53c39b5342() > 1) {
        var_ceaa69d97f86e3f4.endnode = var_ceaa69d97f86e3f4.endnode.prevnode;
        var_ceaa69d97f86e3f4.endnode.nextnode = undefined;
    } else {
        var_ceaa69d97f86e3f4.startnode = undefined;
        var_ceaa69d97f86e3f4.endnode = undefined;
    }
    var_ceaa69d97f86e3f4.var_f04e715a0d2ee220 = max(var_ceaa69d97f86e3f4.var_f04e715a0d2ee220 - 1, 0);
    /#
        if (var_ceaa69d97f86e3f4 function_63fe00fb459ea917()) {
            function_22573254f7088750("<unknown string>");
            var_ceaa69d97f86e3f4 function_808f3bc4b7fcee6d();
        }
    #/
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x593
// Size: 0x73
function function_7f2de7f012dc412f(var_d9e7db9b48a182d5) {
    /#
        assertex(function_dd1ede0842d8e484(self), "This function requires that 'self' is a Linked List struct as defined in 'linked_list.gsc'");
    #/
    var_ceaa69d97f86e3f4 = self;
    if (var_ceaa69d97f86e3f4.startnode == var_d9e7db9b48a182d5) {
        return;
    }
    var_ceaa69d97f86e3f4 function_5aa07df03575a9a9(var_d9e7db9b48a182d5);
    var_ceaa69d97f86e3f4 function_ba05da019b3ecd4(var_d9e7db9b48a182d5, 1);
    /#
        if (var_ceaa69d97f86e3f4 function_63fe00fb459ea917()) {
            function_22573254f7088750("<unknown string>");
            var_ceaa69d97f86e3f4 function_808f3bc4b7fcee6d();
        }
    #/
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60d
// Size: 0x2f
function function_c6439f53c39b5342() {
    /#
        assertex(function_dd1ede0842d8e484(self), "This function requires that 'self' is a Linked List struct as defined in 'linked_list.gsc'");
    #/
    var_ceaa69d97f86e3f4 = self;
    return var_ceaa69d97f86e3f4.var_f04e715a0d2ee220;
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x644
// Size: 0x2f
function function_d17c7b12c430edb9() {
    /#
        assertex(function_dd1ede0842d8e484(self), "This function requires that 'self' is a Linked List struct as defined in 'linked_list.gsc'");
    #/
    var_ceaa69d97f86e3f4 = self;
    return var_ceaa69d97f86e3f4.startnode;
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67b
// Size: 0x2f
function function_17a0e977331bf97c() {
    /#
        assertex(function_dd1ede0842d8e484(self), "This function requires that 'self' is a Linked List struct as defined in 'linked_list.gsc'");
    #/
    var_ceaa69d97f86e3f4 = self;
    return var_ceaa69d97f86e3f4.endnode;
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b2
// Size: 0x6
function function_d35c195d3d01e75e() {
    /#
    #/
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6bf
// Size: 0x2b
function function_c09bf9c86f65e4ac(var_ad80ec0659e85f9e) {
    /#
        var_93981ad709abb3f9 = function_e0143bb4b41a77c4();
        var_93981ad709abb3f9 function_3a28dcc9cc1b6ae3(var_ad80ec0659e85f9e);
        return var_93981ad709abb3f9;
    #/
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f1
// Size: 0x4b
function function_3a28dcc9cc1b6ae3(var_ad80ec0659e85f9e) {
    /#
        /#
            assertex(function_dd1ede0842d8e484(self), "<unknown string>");
        #/
        var_93981ad709abb3f9 = self;
        var_93981ad709abb3f9.var_1a19bd75a8860186 = 1;
        var_93981ad709abb3f9.var_ad80ec0659e85f9e = var_ad80ec0659e85f9e;
    #/
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x743
// Size: 0xb0
function function_c4e2f2dcd675c939(var_ad80ec0659e85f9e) {
    /#
        /#
            assertex(function_dd1ede0842d8e484(self), "<unknown string>");
        #/
        var_ceaa69d97f86e3f4 = self;
        var_f04e715a0d2ee220 = 1;
        var_6eed7906b60714b6 = var_ceaa69d97f86e3f4.startnode;
        function_22573254f7088750("<unknown string>");
        function_22573254f7088750("<unknown string>" + var_ceaa69d97f86e3f4 function_c6439f53c39b5342());
        while (isdefined(var_6eed7906b60714b6)) {
            function_22573254f7088750("<unknown string>" + var_f04e715a0d2ee220 + "<unknown string>");
            [[ var_ad80ec0659e85f9e ]](var_6eed7906b60714b6);
            var_6eed7906b60714b6 = var_6eed7906b60714b6.nextnode;
            var_f04e715a0d2ee220++;
        }
        function_22573254f7088750("<unknown string>");
    #/
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7fa
// Size: 0x39
function private function_808f3bc4b7fcee6d() {
    /#
        /#
            assertex(function_dd1ede0842d8e484(self), "<unknown string>");
        #/
        var_93981ad709abb3f9 = self;
        function_c4e2f2dcd675c939(var_93981ad709abb3f9.var_ad80ec0659e85f9e);
    #/
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x83a
// Size: 0x34
function private function_63fe00fb459ea917() {
    /#
        /#
            assertex(function_dd1ede0842d8e484(self), "<unknown string>");
        #/
        var_ceaa69d97f86e3f4 = self;
        return istrue(var_ceaa69d97f86e3f4.var_1a19bd75a8860186);
    #/
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x875
// Size: 0xc
function private function_276db0f5dc47fd04() {
    /#
        return "<unknown string>";
    #/
}

// Namespace namespace_155a4cfefe8c5cd5/namespace_60570ec14703b3dc
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x888
// Size: 0x1d
function private function_22573254f7088750(var_f0443bfaa4783689) {
    /#
        iprintln(function_276db0f5dc47fd04() + var_f0443bfaa4783689);
    #/
}

