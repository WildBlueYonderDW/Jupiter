// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_ec6836c9475c9d18;

// Namespace namespace_ec6836c9475c9d18/namespace_649c2fab0fd72b8b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85
// Size: 0xa
function init() {
    function_28026771d64f5484();
}

// Namespace namespace_ec6836c9475c9d18/namespace_649c2fab0fd72b8b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x96
// Size: 0x447
function private function_28026771d64f5484() {
    if (isdefined(level.var_5d0e3c105d8df7e6)) {
        return;
    }
    level.var_5d0e3c105d8df7e6 = [];
    level.var_7003d55e99a01f70 = [];
    level.var_7157035465a73c2d = [];
    level.var_dee8cd959aa57e26 = [];
    level.var_d0ef8c79b6e23661 = [];
    /#
        if (getdvarint(@"hash_e6afce2cf5cf7515", 0) == 1) {
            return;
        }
        if (getdvar(@"hash_742caa13b3c2e685") == "<unknown string>") {
            return;
        }
    #/
    var_95e750bc139e9da9 = function_811510b694ddd963();
    var_eb8b55369eb4fd41 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_1fa266a862bf9762", var_95e750bc139e9da9.var_3844c09d81d3c3a9));
    var_7b9e1c88d69bf5ba = getscriptbundle(function_2ef675c13ca1c4af(%"hash_65c0e77ca29a053d", var_95e750bc139e9da9.var_97801c7bd0f4b8e2));
    /#
        var_eb6eab06c0a78fdd = 0;
        if (!isdefined(var_eb8b55369eb4fd41)) {
            println("<unknown string>" + var_95e750bc139e9da9.var_3844c09d81d3c3a9);
            var_eb6eab06c0a78fdd = 1;
        }
        if (!isdefined(var_7b9e1c88d69bf5ba)) {
            println("<unknown string>" + var_95e750bc139e9da9.var_97801c7bd0f4b8e2);
            var_eb6eab06c0a78fdd = 1;
        }
        if (var_eb6eab06c0a78fdd) {
            return;
        }
    #/
    eventlist = var_eb8b55369eb4fd41.eventlist;
    var_1878b2531d72df64 = var_7b9e1c88d69bf5ba.var_1878b2531d72df64;
    for (i = 0; i < eventlist.size; i++) {
        var_87db3db683ff41b3 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_6dd4e4d4a6505f3a", eventlist[i].event));
        /#
            if (!isdefined(var_87db3db683ff41b3)) {
                println("<unknown string>" + var_95e750bc139e9da9.var_3844c09d81d3c3a9 + "<unknown string>" + eventlist[i].event);
                continue;
            }
        #/
        if (var_87db3db683ff41b3.source == "server") {
            var_a5edf37d75183d91 = var_87db3db683ff41b3.var_6298e4ace3eb26b3;
            level.var_5d0e3c105d8df7e6[var_a5edf37d75183d91] = var_87db3db683ff41b3;
            var_e731e8b31d2b6726 = [];
            eventkeys = var_87db3db683ff41b3.keys;
            for (j = 0; j < eventkeys.size; j++) {
                var_d2de5b69db3b768c = getscriptbundle(function_2ef675c13ca1c4af(%"hash_683f777d2122709b", eventkeys[j].key));
                var_cb4e6cbee807f160 = var_d2de5b69db3b768c.var_6298e4ace3eb26b3;
                var_e731e8b31d2b6726[var_e731e8b31d2b6726.size] = var_cb4e6cbee807f160;
                if (!isdefined(level.var_7157035465a73c2d[var_cb4e6cbee807f160])) {
                    level.var_7157035465a73c2d[var_cb4e6cbee807f160] = var_d2de5b69db3b768c;
                }
                if (isdefined(var_d2de5b69db3b768c.bitfield) && var_d2de5b69db3b768c.bitfield.size > 0) {
                    level.var_dee8cd959aa57e26[var_cb4e6cbee807f160] = [];
                    for (k = 0; k < var_d2de5b69db3b768c.bitfield.size; k++) {
                        bitname = var_d2de5b69db3b768c.bitfield[k].var_6298e4ace3eb26b3;
                        level.var_dee8cd959aa57e26[var_cb4e6cbee807f160][bitname] = var_d2de5b69db3b768c.bitfield[k].bitindex;
                    }
                }
            }
            level.var_7003d55e99a01f70[var_a5edf37d75183d91] = var_e731e8b31d2b6726;
        }
    }
    for (i = 0; i < var_1878b2531d72df64.size; i++) {
        var_1cdcaa1b699683c2 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_56154d39395feb69", var_1878b2531d72df64[i].var_684da0559ba7c79c));
        /#
            if (!isdefined(var_1cdcaa1b699683c2)) {
                println("<unknown string>" + var_95e750bc139e9da9.var_97801c7bd0f4b8e2 + "<unknown string>" + var_1878b2531d72df64[i].var_684da0559ba7c79c);
                continue;
            }
        #/
        var_d0ef8c79b6e23661 = [];
        elements = var_1cdcaa1b699683c2.elements;
        for (j = 0; j < elements.size; j++) {
            element = elements[j];
            var_d0ef8c79b6e23661[element.var_6298e4ace3eb26b3] = element.id;
        }
        level.var_d0ef8c79b6e23661[var_1cdcaa1b699683c2.var_6298e4ace3eb26b3] = var_d0ef8c79b6e23661;
    }
}

// Namespace namespace_ec6836c9475c9d18/namespace_649c2fab0fd72b8b
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e4
// Size: 0x6e
function private function_5ca3bdbcf741615f(eventname, keyname) {
    /#
        assert(function_d03495fe6418377b(eventname));
    #/
    /#
        assert(function_d03495fe6418377b(keyname));
    #/
    var_9ff7bcdcbe037c9e = level.var_7003d55e99a01f70[eventname];
    if (isdefined(var_9ff7bcdcbe037c9e)) {
        return function_fc64178f71375137(var_9ff7bcdcbe037c9e, keyname);
    } else {
        /#
            println("<unknown string>" + function_3c8848a3a11b2553(eventname));
        #/
    }
    return 0;
}

// Namespace namespace_ec6836c9475c9d18/namespace_649c2fab0fd72b8b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55a
// Size: 0x61
function function_6e2deb013c9ca85e(eventname) {
    /#
        assert(function_d03495fe6418377b(eventname));
    #/
    var_87db3db683ff41b3 = level.var_5d0e3c105d8df7e6[eventname];
    if (isdefined(var_87db3db683ff41b3)) {
        return string(var_87db3db683ff41b3.id);
    } else {
        /#
            println("<unknown string>" + function_3c8848a3a11b2553(eventname));
        #/
    }
    return undefined;
}

// Namespace namespace_ec6836c9475c9d18/namespace_649c2fab0fd72b8b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c3
// Size: 0xa2
function function_d6f771aedba70ce7(eventname, keyname) {
    /#
        assert(function_d03495fe6418377b(eventname));
    #/
    /#
        assert(function_d03495fe6418377b(keyname));
    #/
    if (function_5ca3bdbcf741615f(eventname, keyname)) {
        var_4de8dd33e1da2178 = level.var_7157035465a73c2d[keyname];
        if (isdefined(var_4de8dd33e1da2178)) {
            return var_4de8dd33e1da2178.id;
        } else {
            /#
                println("<unknown string>" + function_3c8848a3a11b2553(keyname));
            #/
        }
    } else {
        /#
            println("<unknown string>" + function_3c8848a3a11b2553(keyname) + "<unknown string>" + function_3c8848a3a11b2553(eventname));
        #/
    }
    return undefined;
}

// Namespace namespace_ec6836c9475c9d18/namespace_649c2fab0fd72b8b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66d
// Size: 0xa3
function function_e2ff8f4b4e94f723(keyname, bitname) {
    /#
        assert(function_d03495fe6418377b(keyname));
    #/
    /#
        assert(function_d03495fe6418377b(bitname));
    #/
    bitfield = level.var_dee8cd959aa57e26[keyname];
    if (isdefined(bitfield)) {
        var_3401eec8341e5cd1 = bitfield[bitname];
        /#
            if (!isdefined(var_3401eec8341e5cd1)) {
                println("<unknown string>" + function_3c8848a3a11b2553(bitname) + "<unknown string>" + function_3c8848a3a11b2553(keyname));
            }
        #/
        return var_3401eec8341e5cd1;
    } else {
        /#
            println("<unknown string>" + function_3c8848a3a11b2553(keyname) + "<unknown string>");
        #/
    }
    return undefined;
}

// Namespace namespace_ec6836c9475c9d18/namespace_649c2fab0fd72b8b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x718
// Size: 0x99
function function_ec8877db4e73e4e8(eventparams, eventname, keyname, value) {
    /#
        assert(function_d03495fe6418377b(eventname));
    #/
    /#
        assert(function_d03495fe6418377b(keyname));
    #/
    var_35fa1149ae3912e5 = function_d6f771aedba70ce7(eventname, keyname);
    if (isdefined(var_35fa1149ae3912e5)) {
        eventparams[eventparams.size] = var_35fa1149ae3912e5;
        eventparams[eventparams.size] = int(value);
    } else {
        /#
            println("<unknown string>" + function_3c8848a3a11b2553(keyname) + "<unknown string>" + value + "<unknown string>" + function_3c8848a3a11b2553(eventname));
        #/
    }
    return eventparams;
}

// Namespace namespace_ec6836c9475c9d18/namespace_649c2fab0fd72b8b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b9
// Size: 0x9e
function function_b40278e5e468c6c1(var_5d4647843a66d457, var_8fb765e581aaf658) {
    /#
        assert(function_d03495fe6418377b(var_5d4647843a66d457));
    #/
    /#
        assert(function_d03495fe6418377b(var_8fb765e581aaf658));
    #/
    if (isdefined(level.var_d0ef8c79b6e23661[var_5d4647843a66d457])) {
        if (isdefined(level.var_d0ef8c79b6e23661[var_5d4647843a66d457][var_8fb765e581aaf658])) {
            return level.var_d0ef8c79b6e23661[var_5d4647843a66d457][var_8fb765e581aaf658];
        } else {
            /#
                println("<unknown string>" + function_3c8848a3a11b2553(var_8fb765e581aaf658) + "<unknown string>" + function_3c8848a3a11b2553(var_5d4647843a66d457));
            #/
        }
    } else {
        /#
            println("<unknown string>" + function_3c8848a3a11b2553(var_5d4647843a66d457));
        #/
    }
    return undefined;
}

// Namespace namespace_ec6836c9475c9d18/namespace_649c2fab0fd72b8b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85f
// Size: 0x5a
function function_7042dad035dc176c(stringref) {
    var_51f792f2633e62ec = function_1823ff50bb28148d("ae_stringref_" + stringref);
    var_947b262137165984 = function_b40278e5e468c6c1(#"stringref", var_51f792f2633e62ec);
    /#
        if (!isdefined(var_947b262137165984)) {
            println("<unknown string>" + stringref + "<unknown string>");
        }
    #/
    return var_947b262137165984;
}

