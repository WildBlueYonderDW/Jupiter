// mwiii decomp prototype
// scripts\common\system.gsc (./mwiii-gsc/3f51a039c4a1a113.gscbin) (size: 3139 Bytes / 0xc43)
// magic .... 0xa0d4353478a vm: Call of Duty Modern Warfare III
// size ...... 3139 (0xc43)
// includes .. 1   (offset: 0x79)
// strings ... 1   (offset: 0xbbb)
// exports ... 10  (offset: 0x7e3)
// imports ... 17  (offset: 0x973)
// animtree1 . 0   (offset: 0xc43)
// animtree2 . 0   (offset: 0xc43)
// cseg ..... 0x81 + 0x762
#using scripts\engine\utility.gsc;

#namespace system;

// Namespace system/namespace_2a19d7cdf5a88223
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89
// Size: 0x13a
function register(str_name, reqs, func_preinit, func_postinit) {
    /#
        print("<unknown string>" + (function_d03495fe6418377b(str_name) ? function_3c8848a3a11b2553(str_name) : str_name));
    #/
    level.system_funcs = function_53c4c53197386572(level.system_funcs, []);
    if (isdefined(level.system_funcs[str_name])) {
        /#
            if (!(level.system_funcs[str_name].flags & 1)) {
                function_33363a58f899bda9("<unknown string>" + (function_d03495fe6418377b(str_name) ? function_3c8848a3a11b2553(str_name) : str_name) + "<unknown string>");
            }
        #/
        return;
    }
    system = {flags:0, reqs:reqs, postfunc:func_postinit, prefunc:func_preinit};
    system.flags = system.flags | (isdefined(func_preinit) ? 2 : 0);
    system.flags = system.flags | (isdefined(func_postinit) ? 4 : 0);
    level.system_funcs[str_name] = system;
}

// Namespace system/namespace_2a19d7cdf5a88223
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ca
// Size: 0x6e
function ignore(str_name) {
    /#
        if (isdefined(level.gametype)) {
            function_33363a58f899bda9("<unknown string>");
            return;
        }
    #/
    if (!isdefined(level.system_funcs[str_name])) {
        register(str_name);
    }
    level.system_funcs[str_name].flags = level.system_funcs[str_name].flags | 1;
}

// Namespace system/namespace_2a19d7cdf5a88223
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f
// Size: 0x80
function function_9c9c8162e507420() {
    if (!isdefined(level.system_funcs)) {
        return;
    }
    foreach (func in level.system_funcs) {
        function_5d3461c8ae875db7(func);
        if (!(func.flags & 8)) {
            thread exec_pre_system(func);
        }
    }
}

// Namespace system/namespace_2a19d7cdf5a88223
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c6
// Size: 0x97
function function_d9624eb09b844ca1() {
    if (!isdefined(level.system_funcs)) {
        return;
    }
    foreach (func in level.system_funcs) {
        function_59d1eeac261314c4(func);
        if (!(func.flags & 8)) {
            thread exec_post_system(func);
        }
    }
    level.system_funcs = undefined;
    level flag_set("system_postinit_complete");
}

// Namespace system/namespace_2a19d7cdf5a88223
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x364
// Size: 0x75
function private exec_post_system(func) {
    if (!isdefined(func) || func.flags & 1) {
        return;
    }
    if (!(func.flags & 4)) {
        if (isdefined(func.reqs)) {
            function_59d1eeac261314c4(func);
        }
        func.flags = func.flags | 4;
        [[ func.postfunc ]]();
    }
}

// Namespace system/namespace_2a19d7cdf5a88223
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e0
// Size: 0x1b1
function private function_59d1eeac261314c4(func) {
    /#
        if (!(func.flags & 2 || func.flags & 1)) {
            function_33363a58f899bda9("<unknown string>");
            func.flags = func.flags | 8;
            return;
        }
    #/
    if (isdefined(func.reqs)) {
        if (isarray(func.reqs)) {
            foreach (req in func.reqs) {
                /#
                    if (!isdefined(req)) {
                        function_33363a58f899bda9("<unknown string>" + req + "<unknown string>");
                        func.flags = func.flags | 8;
                        goto LOC_00000102;
                    }
                #/
                thread exec_post_system(level.system_funcs[req]);
            LOC_00000102:
            }
        } else {
            /#
                if (!isdefined(level.system_funcs[func.reqs])) {
                    function_33363a58f899bda9("<unknown string>" + (function_d03495fe6418377b(func.reqs) ? function_3c8848a3a11b2553(func.reqs) : func.reqs) + "<unknown string>");
                    func.flags = func.flags | 8;
                    return;
                }
            #/
            thread exec_post_system(level.system_funcs[func.reqs]);
        }
    }
}

// Namespace system/namespace_2a19d7cdf5a88223
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x598
// Size: 0x75
function private exec_pre_system(func) {
    if (!isdefined(func) || func.flags & 1) {
        return;
    }
    if (!(func.flags & 2)) {
        if (isdefined(func.reqs)) {
            function_5d3461c8ae875db7(func);
        }
        [[ func.prefunc ]]();
        func.flags = func.flags | 2;
    }
}

// Namespace system/namespace_2a19d7cdf5a88223
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x614
// Size: 0x164
function private function_5d3461c8ae875db7(func) {
    if (isdefined(func.reqs)) {
        if (isarray(func.reqs)) {
            foreach (req in func.reqs) {
                /#
                    if (!isdefined(req)) {
                        function_33363a58f899bda9("<unknown string>" + req + "<unknown string>");
                        func.flags = func.flags | 8;
                        goto LOC_000000b5;
                    }
                #/
                thread exec_pre_system(level.system_funcs[req]);
            LOC_000000b5:
            }
        } else {
            /#
                if (!isdefined(level.system_funcs[func.reqs])) {
                    function_33363a58f899bda9("<unknown string>" + (function_d03495fe6418377b(func.reqs) ? function_3c8848a3a11b2553(func.reqs) : func.reqs) + "<unknown string>");
                    func.flags = func.flags | 8;
                    return;
                }
            #/
            thread exec_pre_system(level.system_funcs[func.reqs]);
        }
    }
}

// Namespace system/namespace_2a19d7cdf5a88223
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77f
// Size: 0x10
function function_3f680182ad0b9ef7() {
    level flag_wait("system_postinit_complete");
}

// Namespace system/namespace_2a19d7cdf5a88223
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x796
// Size: 0x4e
function function_33363a58f899bda9(msg) {
    /#
        if (getdvarint(@"hash_e6afce2cf5cf7515") != 0 || getdvarint(@"hash_add5b80d30e0737a") != 0) {
            print("<unknown string>" + msg);
            return;
        }
    #/
    /#
        assertmsg(msg);
    #/
}

