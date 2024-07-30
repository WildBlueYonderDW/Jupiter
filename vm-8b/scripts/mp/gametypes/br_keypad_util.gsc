#namespace br_keypad_util;

// Namespace br_keypad_util / scripts\mp\gametypes\br_keypad_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc
// Size: 0x10
function getkeypadstatefromomnvar() {
    return playerunpackdatafromomnvar("ui_keypad_data", 0, 2);
}

// Namespace br_keypad_util / scripts\mp\gametypes\br_keypad_util
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd5
// Size: 0x11
function getkeypadcodelengthfromomnvar() {
    return playerunpackdatafromomnvar("ui_keypad_data", 2, 4);
}

// Namespace br_keypad_util / scripts\mp\gametypes\br_keypad_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xef
// Size: 0x14
function playersetkeypadstateindex(stateindex) {
    playersetomnvarkeypad(0, stateindex);
}

// Namespace br_keypad_util / scripts\mp\gametypes\br_keypad_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10b
// Size: 0x15
function playersetkeypadcodelengthindex(var_27772e126a007b40) {
    playersetomnvarkeypad(1, var_27772e126a007b40);
}

// Namespace br_keypad_util / scripts\mp\gametypes\br_keypad_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x128
// Size: 0x15
function function_b899a0471538d3d4(var_62a655cbda625e8d) {
    playersetomnvarkeypad(2, var_62a655cbda625e8d);
}

// Namespace br_keypad_util / scripts\mp\gametypes\br_keypad_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x145
// Size: 0x3f
function function_da718c8ec624b4da(objid) {
    if (!isdefined(objid)) {
        objid = 15;
    } else if (objid > 14) {
        assertmsg("<dev string:x1c>" + objid + "<dev string:x54>");
        return;
    }
    playersetomnvarkeypad(3, objid);
}

// Namespace br_keypad_util / scripts\mp\gametypes\br_keypad_util
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18c
// Size: 0x3f
function function_5392765d56bf59ea(attemptsremaining) {
    if (!isdefined(attemptsremaining)) {
        attemptsremaining = 3;
    } else if (attemptsremaining > 14) {
        assertmsg("<dev string:x89>" + attemptsremaining + "<dev string:xd3>");
        return;
    }
    playersetomnvarkeypad(4, attemptsremaining);
}

// Namespace br_keypad_util / scripts\mp\gametypes\br_keypad_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d3
// Size: 0x114
function function_b751dd55c6c31d6d(var_6f6d810585c7349b, var_fa0f2d5aeb7a3af9, objid) {
    var_2e3292ed32077253 = 0;
    if (!isdefined(objid)) {
        objid = 15;
    } else if (objid >= 15) {
        assertmsg("<dev string:x114>" + objid + "<dev string:x14c>" + 15 + "<dev string:x180>");
        return;
    }
    shift = 0;
    var_2e3292ed32077253 |= objid << shift;
    i = 0;
    foreach (digit in var_6f6d810585c7349b) {
        shift = i * 4 + 4;
        if (i < var_fa0f2d5aeb7a3af9) {
            var_2e3292ed32077253 |= digit << shift;
        } else {
            var_2e3292ed32077253 |= 10 << shift;
        }
        i++;
    }
    while (i < 4) {
        shift = i * 4 + 4;
        var_2e3292ed32077253 |= 15 << shift;
        i++;
    }
    self setclientomnvar("ui_vault_code_known_digits", int(var_2e3292ed32077253));
}

// Namespace br_keypad_util / scripts\mp\gametypes\br_keypad_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ef
// Size: 0x7c
function playersetomnvarkeypad(dataref, value) {
    assert(isplayer(self));
    var_57acadc40b2f0a8 = getkeypadomnvarbitpackinginfo(dataref, value);
    value = var_57acadc40b2f0a8[3];
    var_8e90fa6d5789ad63 = var_57acadc40b2f0a8[2];
    bitwidth = var_57acadc40b2f0a8[1];
    bitoffset = var_57acadc40b2f0a8[0];
    if (var_8e90fa6d5789ad63 == "") {
        return;
    }
    playerpackdataintoomnvar(var_8e90fa6d5789ad63, value, bitoffset, bitwidth);
}

// Namespace br_keypad_util / scripts\mp\gametypes\br_keypad_util
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x373
// Size: 0x19e
function getkeypadomnvarbitpackinginfo(dataref, value) {
    bitoffset = 0;
    bitwidth = 0;
    var_8e90fa6d5789ad63 = "";
    switch (dataref) {
    case 0: 
        var_57acbdc40b2f2db = [0, 2];
        bitwidth = var_57acbdc40b2f2db[1];
        bitoffset = var_57acbdc40b2f2db[0];
        var_8e90fa6d5789ad63 = "ui_keypad_data";
        break;
    case 1: 
        var_57ad0dc40b2fdda = [2, 4];
        bitwidth = var_57ad0dc40b2fdda[1];
        bitoffset = var_57ad0dc40b2fdda[0];
        var_8e90fa6d5789ad63 = "ui_keypad_data";
        break;
    case 2: 
        var_57ad1dc40b3000d = [6, 4];
        bitwidth = var_57ad1dc40b3000d[1];
        bitoffset = var_57ad1dc40b3000d[0];
        var_8e90fa6d5789ad63 = "ui_keypad_data";
        break;
    case 3: 
        var_57acedc40b2f974 = [10, 8];
        bitwidth = var_57acedc40b2f974[1];
        bitoffset = var_57acedc40b2f974[0];
        var_8e90fa6d5789ad63 = "ui_keypad_data";
        break;
    case 4: 
        var_57acfdc40b2fba7 = [18, 4];
        bitwidth = var_57acfdc40b2fba7[1];
        bitoffset = var_57acfdc40b2fba7[0];
        var_8e90fa6d5789ad63 = "ui_keypad_data";
        break;
    default: 
        assertmsg("<dev string:x185>" + dataref + "<dev string:x19e>");
        break;
    }
    return [bitoffset, bitwidth, var_8e90fa6d5789ad63, value];
}

// Namespace br_keypad_util / scripts\mp\gametypes\br_keypad_util
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x51a
// Size: 0x9c
function playerpackdataintoomnvar(var_8e90fa6d5789ad63, value, bitoffset, bitwidth) {
    mask = int(pow(2, bitwidth)) - 1;
    var_a463992091f1d483 = (value & mask) << bitoffset;
    var_f8f977081d3da8b4 = ~(mask << bitoffset);
    prevvalue = self getclientomnvar(var_8e90fa6d5789ad63);
    cleanedbase = prevvalue & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = cleanedbase + var_a463992091f1d483;
    if (var_82a90e56e416fa55 != prevvalue) {
        self setclientomnvar(var_8e90fa6d5789ad63, var_82a90e56e416fa55);
    }
}

// Namespace br_keypad_util / scripts\mp\gametypes\br_keypad_util
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5be
// Size: 0x5b
function playerunpackdatafromomnvar(var_8e90fa6d5789ad63, var_c20319aa0598dc14, var_7214adeafee0fc1b) {
    prevvalue = self getclientomnvar(var_8e90fa6d5789ad63);
    var_81829a47d6020a = (1 << var_7214adeafee0fc1b) - 1;
    bitarray = prevvalue >> var_c20319aa0598dc14;
    var_f94e3b11a17a0398 = var_81829a47d6020a & bitarray;
    return var_f94e3b11a17a0398;
}

