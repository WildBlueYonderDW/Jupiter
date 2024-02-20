// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3e34d236a84cfd96;
#using script_14381cefe2740093;

#namespace namespace_52446ed313e6237d;

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5
// Size: 0x10d
function function_c477fdff9390e85c() {
    /#
        function_2e4174511b58a5f0();
    #/
    if (!function_592efdf139e81f74()) {
        return;
    }
    if (isdefined(level.var_34378a90a5412533)) {
        /#
            assertmsg("Resource Manager has already been initialized.");
        #/
        return;
    }
    level.var_34378a90a5412533 = spawnstruct();
    level.var_34378a90a5412533.limits = function_449be28dc3149e33();
    level.var_34378a90a5412533.var_5e2cc3a07e3b57e9 = [];
    level.var_34378a90a5412533.counts = undefined;
    level.var_34378a90a5412533.var_3c55517cc3ece651 = function_7c6efe951a18dfc8();
    level.var_34378a90a5412533.entities = [];
    level.var_34378a90a5412533.scriptables = [];
    level.var_34378a90a5412533.vehicles = [];
    level.var_aeae08211b84be70 = &function_27d3cfc3416beaa;
    level.var_21b79ec3ff697b98 = &function_16d899c3f197127e;
    level.var_aa2462a0d3c6669d = &function_e0d97f24ef3e433f;
    function_fba48b7cfdbc592();
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9
// Size: 0x1f
function function_f9eefc763d0de614() {
    return [0:"entities", 1:"scriptables", 2:"vehicles"];
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210
// Size: 0x15
function function_592efdf139e81f74() {
    return getdvarint(@"hash_cdb4e7b9dc1375dd", 1) != 0;
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22d
// Size: 0x6b
function private function_7c6efe951a18dfc8() {
    var_7d41fc99b7d3b5de = function_f9eefc763d0de614();
    var_a794641328a198d = [];
    foreach (resource in var_7d41fc99b7d3b5de) {
        var_a794641328a198d[resource] = 0;
    }
    return var_a794641328a198d;
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a0
// Size: 0x3
function private function_27d3cfc3416beaa() {
    
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2aa
// Size: 0x3
function private function_16d899c3f197127e() {
    
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b4
// Size: 0x3
function private function_e0d97f24ef3e433f() {
    
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2be
// Size: 0x152
function private function_fba48b7cfdbc592() {
    /#
        assert(!isdefined(level.var_34378a90a5412533.counts));
    #/
    classes = function_6a64df48ad4ce4f9();
    foreach (class in classes) {
        level.var_34378a90a5412533.counts[class] = function_7c6efe951a18dfc8();
    }
    /#
        assert(level.var_34378a90a5412533.var_5e2cc3a07e3b57e9.size == 0);
    #/
    level.var_34378a90a5412533.var_5e2cc3a07e3b57e9["entities"] = int(max(getdvarint(@"hash_4dc99f3054df38f1", 800), 0));
    level.var_34378a90a5412533.var_5e2cc3a07e3b57e9["scriptables"] = int(max(getdvarint(@"hash_5d026b677a8c5410", 200), 0));
    level.var_34378a90a5412533.var_5e2cc3a07e3b57e9["vehicles"] = int(max(getdvarint(@"hash_8145cf83bbc69bd7", 60), 0));
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x417
// Size: 0x83
function private function_d87d61d06422bce4(var_d89902dffd24c0d9, var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, amount) {
    if (!isdefined(amount) || amount <= 0) {
        return 1;
    }
    var_b1f016d51ad6279f = level.var_34378a90a5412533.var_3c55517cc3ece651[var_d89902dffd24c0d9];
    var_7907e60d423a9570 = level.var_34378a90a5412533.var_5e2cc3a07e3b57e9[var_d89902dffd24c0d9];
    return var_b1f016d51ad6279f + amount <= var_7907e60d423a9570;
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a2
// Size: 0xad
function function_756b62f54a8121ff(var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_cc1b32f45fc26fa9) {
    if (!isdefined(var_cc1b32f45fc26fa9)) {
        return 1;
    }
    var_7d75de1f117edc2f = level.var_34378a90a5412533.limits[var_728270c1fda20ce8];
    if (isdefined(var_7d75de1f117edc2f)) {
    }
    if (!function_d87d61d06422bce4("entities", var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_cc1b32f45fc26fa9.var_7c8b5f741410fc9b)) {
        return 0;
    }
    if (!function_d87d61d06422bce4("scriptables", var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_cc1b32f45fc26fa9.var_c113b50ec587c0e4)) {
        return 0;
    }
    if (!function_d87d61d06422bce4("vehicles", var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_cc1b32f45fc26fa9.var_bb34e9fd0b25ca19)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x557
// Size: 0x98
function private function_e17c6b6b1aef59a9(var_d89902dffd24c0d9, var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, amount) {
    if (!isdefined(amount) || amount <= 0) {
        return;
    }
    level.var_34378a90a5412533.counts[var_728270c1fda20ce8][var_d89902dffd24c0d9] = level.var_34378a90a5412533.counts[var_728270c1fda20ce8][var_d89902dffd24c0d9] + amount;
    level.var_34378a90a5412533.var_3c55517cc3ece651[var_d89902dffd24c0d9] = level.var_34378a90a5412533.var_3c55517cc3ece651[var_d89902dffd24c0d9] + amount;
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5f6
// Size: 0xda
function private function_8f2ecf87251b657b(var_d89902dffd24c0d9, var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, amount) {
    if (!isdefined(amount) || amount <= 0) {
        return;
    }
    level.var_34378a90a5412533.counts[var_728270c1fda20ce8][var_d89902dffd24c0d9] = level.var_34378a90a5412533.counts[var_728270c1fda20ce8][var_d89902dffd24c0d9] - amount;
    level.var_34378a90a5412533.var_3c55517cc3ece651[var_d89902dffd24c0d9] = level.var_34378a90a5412533.var_3c55517cc3ece651[var_d89902dffd24c0d9] - amount;
    /#
        assert(level.var_34378a90a5412533.counts[var_728270c1fda20ce8][var_d89902dffd24c0d9] >= 0);
    #/
    /#
        assert(level.var_34378a90a5412533.var_3c55517cc3ece651[var_d89902dffd24c0d9] >= 0);
    #/
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d7
// Size: 0x78
function function_cf5c19fe5c042e90(var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_cc1b32f45fc26fa9) {
    if (!isdefined(var_cc1b32f45fc26fa9)) {
        return;
    }
    function_8f2ecf87251b657b("entities", var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_cc1b32f45fc26fa9.var_7c8b5f741410fc9b);
    function_8f2ecf87251b657b("scriptables", var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_cc1b32f45fc26fa9.var_c113b50ec587c0e4);
    function_8f2ecf87251b657b("vehicles", var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_cc1b32f45fc26fa9.var_bb34e9fd0b25ca19);
}

// Namespace namespace_52446ed313e6237d/namespace_35cd2e08665dfefd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x756
// Size: 0x78
function function_1f896f1cc450fd5f(var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_cc1b32f45fc26fa9) {
    if (!isdefined(var_cc1b32f45fc26fa9)) {
        return;
    }
    function_e17c6b6b1aef59a9("entities", var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_cc1b32f45fc26fa9.var_7c8b5f741410fc9b);
    function_e17c6b6b1aef59a9("scriptables", var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_cc1b32f45fc26fa9.var_c113b50ec587c0e4);
    function_e17c6b6b1aef59a9("vehicles", var_728270c1fda20ce8, var_af0662d6485d5d58, var_d1c889337f122713, var_cc1b32f45fc26fa9.var_bb34e9fd0b25ca19);
}

