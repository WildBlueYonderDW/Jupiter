#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_6ebd0d5f9b30a55a;

#namespace namespace_3e8924d2d52a5e37;

// Namespace namespace_3e8924d2d52a5e37 / namespace_b294929e0e35387a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfe
// Size: 0x67
function function_63555ee8e5fb64fc(cachesize) {
    assertex(cachesize > 0, "The LRU cache size must be greater than zero");
    var_f9c88d9020c8956c = spawnstruct();
    var_f9c88d9020c8956c.cachesize = cachesize;
    var_f9c88d9020c8956c.var_f4087a1ca01febee = function_e0143bb4b41a77c4();
    var_f9c88d9020c8956c.datamap = [];
    var_f9c88d9020c8956c.var_6331b84385d676bc = 1;
    return var_f9c88d9020c8956c;
}

// Namespace namespace_3e8924d2d52a5e37 / namespace_b294929e0e35387a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16e
// Size: 0x23
function function_6331b84385d676bc(var_c41e3f9d7499501f) {
    return isstruct(var_c41e3f9d7499501f) && var_c41e3f9d7499501f.var_6331b84385d676bc == 1;
}

// Namespace namespace_3e8924d2d52a5e37 / namespace_b294929e0e35387a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19a
// Size: 0x16e
function function_cdc086fa4e95b951(datakey, datacontents) {
    assertex(function_6331b84385d676bc(self), "This function requires that 'self' is a LRU struct as defined in 'lru_cache.gsc'");
    var_f9c88d9020c8956c = self;
    if (isdefined(var_f9c88d9020c8956c.datamap[datakey])) {
        var_aa6139aeacf146d0 = var_f9c88d9020c8956c.datamap[datakey];
        var_f9c88d9020c8956c.var_f4087a1ca01febee function_7f2de7f012dc412f(var_aa6139aeacf146d0);
        return;
    }
    var_aa6139aeacf146d0 = function_11a80ea7fe6ea9e0();
    var_aa6139aeacf146d0.contents = datacontents;
    var_aa6139aeacf146d0.datakey = datakey;
    var_f9c88d9020c8956c.datamap[datakey] = var_aa6139aeacf146d0;
    var_f9c88d9020c8956c.var_f4087a1ca01febee addnode(var_aa6139aeacf146d0, 1);
    /#
        if (var_f9c88d9020c8956c function_63fe00fb459ea917()) {
            function_cb7caa09a0749df4("<dev string:x1c>" + datakey + "<dev string:x49>");
        }
    #/
    if (var_f9c88d9020c8956c.var_f4087a1ca01febee getsize() > var_f9c88d9020c8956c.cachesize) {
        var_3c81bd8cfe859fc3 = var_f9c88d9020c8956c.var_f4087a1ca01febee getendnode();
        var_f9c88d9020c8956c function_992d181b387ca849(var_3c81bd8cfe859fc3.datakey);
        /#
            if (var_f9c88d9020c8956c function_63fe00fb459ea917()) {
                function_cb7caa09a0749df4("<dev string:x4b>" + var_f9c88d9020c8956c.cachesize + "<dev string:x75>" + datakey + "<dev string:x9d>" + var_3c81bd8cfe859fc3.datakey + "<dev string:xca>");
            }
        #/
    }
}

// Namespace namespace_3e8924d2d52a5e37 / namespace_b294929e0e35387a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x310
// Size: 0x80
function function_992d181b387ca849(datakey) {
    assertex(function_6331b84385d676bc(self), "This function requires that 'self' is a LRU struct as defined in 'lru_cache.gsc'");
    var_f9c88d9020c8956c = self;
    if (isdefined(var_f9c88d9020c8956c.datamap[datakey])) {
        var_aa6139aeacf146d0 = var_f9c88d9020c8956c.datamap[datakey];
        var_f9c88d9020c8956c.var_f4087a1ca01febee removenode(var_aa6139aeacf146d0);
        var_aa6139aeacf146d0.contents = undefined;
        var_f9c88d9020c8956c.datamap[datakey] = undefined;
    }
}

// Namespace namespace_3e8924d2d52a5e37 / namespace_b294929e0e35387a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x398
// Size: 0x75
function function_c908ab3353601192(datakey) {
    assertex(function_6331b84385d676bc(self), "This function requires that 'self' is a LRU struct as defined in 'lru_cache.gsc'");
    var_f9c88d9020c8956c = self;
    if (isdefined(var_f9c88d9020c8956c.datamap[datakey])) {
        var_aa6139aeacf146d0 = var_f9c88d9020c8956c.datamap[datakey];
        var_f9c88d9020c8956c.var_f4087a1ca01febee function_7f2de7f012dc412f(var_aa6139aeacf146d0);
        return var_aa6139aeacf146d0.contents;
    }
    return undefined;
}

/#

    // Namespace namespace_3e8924d2d52a5e37 / namespace_b294929e0e35387a
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x416
    // Size: 0x5
    function function_b070450a1a879374() {
        
    }

    // Namespace namespace_3e8924d2d52a5e37 / namespace_b294929e0e35387a
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x423
    // Size: 0x20
    function function_7f5414a2ec3af004() {
        var_e7bd49da3939ba59 = function_63555ee8e5fb64fc();
        var_e7bd49da3939ba59 function_e72dd453d0c738eb();
        return var_e7bd49da3939ba59;
    }

    // Namespace namespace_3e8924d2d52a5e37 / namespace_b294929e0e35387a
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x44b
    // Size: 0x59
    function function_e72dd453d0c738eb(var_f6db2dc3ab7b9a12) {
        assertex(function_6331b84385d676bc(self), "<dev string:xdb>");
        var_e7bd49da3939ba59 = self;
        var_e7bd49da3939ba59.var_1a19bd75a8860186 = 1;
        if (istrue(var_f6db2dc3ab7b9a12)) {
            var_e7bd49da3939ba59.var_f4087a1ca01febee function_3a28dcc9cc1b6ae3(&function_b96df1db6657354e);
        }
    }

    // Namespace namespace_3e8924d2d52a5e37 / namespace_b294929e0e35387a
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4ac
    // Size: 0x33
    function private function_63fe00fb459ea917() {
        assertex(function_6331b84385d676bc(self), "<dev string:x12c>");
        var_f9c88d9020c8956c = self;
        return istrue(var_f9c88d9020c8956c.var_1a19bd75a8860186);
    }

    // Namespace namespace_3e8924d2d52a5e37 / namespace_b294929e0e35387a
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x4e7
    // Size: 0x26
    function private function_b96df1db6657354e(nodereference) {
        function_cb7caa09a0749df4("<dev string:x187>" + nodereference.datakey);
    }

    // Namespace namespace_3e8924d2d52a5e37 / namespace_b294929e0e35387a
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x515
    // Size: 0xb
    function private function_c3b303ae9042d994() {
        return "<dev string:x192>";
    }

    // Namespace namespace_3e8924d2d52a5e37 / namespace_b294929e0e35387a
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x528
    // Size: 0x1c
    function private function_cb7caa09a0749df4(var_f0443bfaa4783689) {
        iprintln(function_c3b303ae9042d994() + var_f0443bfaa4783689);
    }

#/
