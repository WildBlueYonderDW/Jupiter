#using scripts\engine\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_575fda2758b0a36e;
#using script_1096bc9315122e88;

#namespace namespace_9d3605fe2ce73dd9;

// Namespace namespace_9d3605fe2ce73dd9 / namespace_6d3783f7267c4bca
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x152
// Size: 0xa
function init() {
    thread function_cc460dedff0277f();
}

// Namespace namespace_9d3605fe2ce73dd9 / namespace_6d3783f7267c4bca
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x164
// Size: 0xd4
function function_cc460dedff0277f() {
    if (function_8f7452209f2fa982()) {
        while (!isdefined(level.script)) {
            waitframe();
        }
        index = namespace_d6cca25f4b0ab62::getlevelindex(level.script);
        if (isdefined(index)) {
            level.var_483eedd411ddb20e = level.missionsettings.levels[index].name;
        } else {
            level.var_483eedd411ddb20e = level.script;
        }
        /#
            if (level.var_483eedd411ddb20e == "<dev string:x1c>") {
                level.var_483eedd411ddb20e = "<dev string:x29>";
            }
        #/
        /#
            setdvarifuninitialized(@"hash_f270b4040fc5585b", 0);
        #/
        println("<dev string:x39>" + level.var_483eedd411ddb20e);
        function_2f892d37929665fa(level.var_483eedd411ddb20e);
    }
}

// Namespace namespace_9d3605fe2ce73dd9 / namespace_6d3783f7267c4bca
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x240
// Size: 0x66
function function_61cb8298cb7adf01(activityname, state, var_c7514edef40976a2) {
    if (!function_8f7452209f2fa982()) {
        return;
    }
    if (!isdefined(activityname)) {
        return;
    }
    if (!isdefined(state)) {
        return;
    }
    if (state == "start") {
        function_2f892d37929665fa(activityname);
        return;
    }
    if (state == "stop") {
        if (!isdefined(var_c7514edef40976a2)) {
            var_c7514edef40976a2 = "completed";
        }
        function_cd65c2cdeeb89a30(activityname, var_c7514edef40976a2);
        return;
    }
    return;
}

// Namespace namespace_9d3605fe2ce73dd9 / namespace_6d3783f7267c4bca
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2ae
// Size: 0x66
function function_d1a8270c167e8a4f(taskname, state, var_c7514edef40976a2) {
    if (!function_8f7452209f2fa982()) {
        return;
    }
    if (!isdefined(taskname)) {
        return;
    }
    if (!isdefined(state)) {
        return;
    }
    if (state == "start") {
        function_6c857f4c6b069db7(taskname);
        return;
    }
    if (state == "stop") {
        if (!isdefined(var_c7514edef40976a2)) {
            var_c7514edef40976a2 = "completed";
        }
        function_90bb05ef944b5d05(taskname, var_c7514edef40976a2);
        return;
    }
    return;
}

// Namespace namespace_9d3605fe2ce73dd9 / namespace_6d3783f7267c4bca
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31c
// Size: 0x56
function function_1c2bbc8867668ba3(var_aff14c3fbfe6b653) {
    if (!function_8f7452209f2fa982()) {
        return;
    }
    assertex(isstring(var_aff14c3fbfe6b653), "Need a id for the first task to start!");
    /#
        if (getdvarint(@"hash_f270b4040fc5585b")) {
            iprintln("<dev string:x59>" + var_aff14c3fbfe6b653);
        }
    #/
    namespace_6d3783f7267c4bca::function_d1a8270c167e8a4f(var_aff14c3fbfe6b653, "start");
}

// Namespace namespace_9d3605fe2ce73dd9 / namespace_6d3783f7267c4bca
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x37a
// Size: 0x82
function function_e001fad729f058b0(var_5f3bf73ffa4f3e33, var_1837aa1066686d58) {
    if (!function_8f7452209f2fa982()) {
        return;
    }
    assertex(isstring(var_5f3bf73ffa4f3e33) && isstring(var_1837aa1066686d58), "Please provide an id for the task to close and the new task to begin.");
    /#
        if (getdvarint(@"hash_f270b4040fc5585b")) {
            iprintln("<dev string:x8e>" + var_5f3bf73ffa4f3e33 + "<dev string:xba>" + var_1837aa1066686d58);
        }
    #/
    namespace_6d3783f7267c4bca::function_d1a8270c167e8a4f(var_5f3bf73ffa4f3e33, "stop", "completed");
    namespace_6d3783f7267c4bca::function_d1a8270c167e8a4f(var_1837aa1066686d58, "start");
}

// Namespace namespace_9d3605fe2ce73dd9 / namespace_6d3783f7267c4bca
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x404
// Size: 0x61
function function_849e707497dfdd92(var_5f3bf73ffa4f3e33) {
    if (!function_8f7452209f2fa982()) {
        return;
    }
    assertex(isstring(var_5f3bf73ffa4f3e33), "Need an id for the last task for the currently active activity.");
    /#
        if (getdvarint(@"hash_f270b4040fc5585b")) {
            iprintln("<dev string:xbf>" + var_5f3bf73ffa4f3e33 + "<dev string:xf2>");
        }
    #/
    namespace_6d3783f7267c4bca::function_d1a8270c167e8a4f(var_5f3bf73ffa4f3e33, "stop", "completed");
}

