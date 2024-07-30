#namespace playtest_logger;

// Namespace playtest_logger / namespace_71483b158f1361f1
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1
// Size: 0xcc
function function_223a972e008c4a09(var_2ea903451e753a5f, var_9dfaf49e38b7b10f, var_9113b547554386ba, var_e16ce54aa38571c0, var_1e9d08b8e40c246a, var_7eea86c60c0788e, var_b0b33580058b7f27, var_243ec5b0a130448e) {
    if (!isdefined(var_243ec5b0a130448e)) {
        var_243ec5b0a130448e = "PLAYTEST_LOGGER";
    }
    struct = spawnstruct();
    struct.var_243ec5b0a130448e = var_243ec5b0a130448e;
    struct.var_2ea903451e753a5f = var_2ea903451e753a5f;
    struct.var_9dfaf49e38b7b10f = var_9dfaf49e38b7b10f;
    struct.var_9113b547554386ba = var_9113b547554386ba;
    struct.var_e16ce54aa38571c0 = var_e16ce54aa38571c0;
    struct.var_1e9d08b8e40c246a = var_1e9d08b8e40c246a;
    struct.var_7eea86c60c0788e = var_7eea86c60c0788e;
    struct.var_b0b33580058b7f27 = var_b0b33580058b7f27;
    return struct;
}

// Namespace playtest_logger / namespace_71483b158f1361f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186
// Size: 0x1e
function function_6bdedc239dbdac03(assertmessage, var_c5dab79fa2079db9) {
    function_275c43d7dd5c74d6(assertmessage, 3, var_c5dab79fa2079db9);
}

// Namespace playtest_logger / namespace_71483b158f1361f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac
// Size: 0x1d
function logerror(msg, var_c5dab79fa2079db9) {
    function_275c43d7dd5c74d6(msg, 0, var_c5dab79fa2079db9);
}

// Namespace playtest_logger / namespace_71483b158f1361f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1
// Size: 0x1e
function logwarning(msg, var_c5dab79fa2079db9) {
    function_275c43d7dd5c74d6(msg, 2, var_c5dab79fa2079db9);
}

// Namespace playtest_logger / namespace_71483b158f1361f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f7
// Size: 0x1e
function loginfo(msg, var_c5dab79fa2079db9) {
    function_275c43d7dd5c74d6(msg, 1, var_c5dab79fa2079db9);
}

// Namespace playtest_logger / namespace_71483b158f1361f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d
// Size: 0x9c
function function_275c43d7dd5c74d6(msg, loglevel, var_5808a2476b7bce9b) {
    var_bf4eaca9064fa63f = function_d6a62191d9107d13(loglevel, var_5808a2476b7bce9b);
    if (var_bf4eaca9064fa63f) {
        logmsg = function_5c8554b7d485da82(msg, loglevel, var_5808a2476b7bce9b);
        logstring(logmsg);
    }
    /#
        if (!isdefined(logmsg)) {
            logmsg = function_5c8554b7d485da82(msg, loglevel, var_5808a2476b7bce9b);
        }
        if (loglevel == 3 || loglevel == 0 && istrue(getdvarint(var_5808a2476b7bce9b.var_b0b33580058b7f27, 0))) {
            assertmsg(logmsg);
            return;
        }
        if (!var_bf4eaca9064fa63f) {
            println(logmsg);
        }
    #/
}

// Namespace playtest_logger / namespace_71483b158f1361f1
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c1
// Size: 0xa0
function private function_5c8554b7d485da82(msg, loglevel, var_5808a2476b7bce9b) {
    if (loglevel == 3) {
        return (var_5808a2476b7bce9b.var_243ec5b0a130448e + "ASSERT: " + msg);
    } else if (loglevel == 1) {
        return (var_5808a2476b7bce9b.var_243ec5b0a130448e + "INFO: " + msg);
    } else if (loglevel == 0) {
        return (var_5808a2476b7bce9b.var_243ec5b0a130448e + "ERROR: " + msg);
    } else if (loglevel == 2) {
        return (var_5808a2476b7bce9b.var_243ec5b0a130448e + "WARNING: " + msg);
    }
    return var_5808a2476b7bce9b.var_243ec5b0a130448e + " [unknown log level]: ";
}

// Namespace playtest_logger / namespace_71483b158f1361f1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36a
// Size: 0xb5
function private function_d6a62191d9107d13(loglevel, var_5808a2476b7bce9b) {
    if (!istrue(getdvarint(var_5808a2476b7bce9b.var_2ea903451e753a5f, 0))) {
        return false;
    }
    if (istrue(getdvarint(var_5808a2476b7bce9b.var_7eea86c60c0788e, 0))) {
        return true;
    } else if (loglevel == 3) {
        return istrue(getdvarint(var_5808a2476b7bce9b.var_1e9d08b8e40c246a));
    } else if (loglevel == 1) {
        return istrue(getdvarint(var_5808a2476b7bce9b.var_9dfaf49e38b7b10f, 0));
    } else if (loglevel == 0) {
        return istrue(getdvarint(var_5808a2476b7bce9b.var_e16ce54aa38571c0, 0));
    } else if (loglevel == 2) {
        return istrue(getdvarint(var_5808a2476b7bce9b.var_9113b547554386ba, 0));
    }
    return false;
}

