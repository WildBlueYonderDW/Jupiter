// mwiii decomp prototype
#namespace namespace_79db0c04d014c4f;

// Namespace namespace_79db0c04d014c4f/namespace_45000ddf531a339c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x229
// Size: 0x11
function getkeypadstatefromomnvar() {
    return playerunpackdatafromomnvar("ui_keypad_data", 0, 2);
}

// Namespace namespace_79db0c04d014c4f/namespace_45000ddf531a339c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x242
// Size: 0x12
function getkeypadcodelengthfromomnvar() {
    return playerunpackdatafromomnvar("ui_keypad_data", 2, 4);
}

// Namespace namespace_79db0c04d014c4f/namespace_45000ddf531a339c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c
// Size: 0x15
function playersetkeypadstateindex(stateindex) {
    playersetomnvarkeypad(0, stateindex);
}

// Namespace namespace_79db0c04d014c4f/namespace_45000ddf531a339c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x278
// Size: 0x16
function playersetkeypadcodelengthindex(var_27772e126a007b40) {
    playersetomnvarkeypad(1, var_27772e126a007b40);
}

// Namespace namespace_79db0c04d014c4f/namespace_45000ddf531a339c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x295
// Size: 0x16
function function_b899a0471538d3d4(var_62a655cbda625e8d) {
    playersetomnvarkeypad(2, var_62a655cbda625e8d);
}

// Namespace namespace_79db0c04d014c4f/namespace_45000ddf531a339c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2
// Size: 0x40
function function_da718c8ec624b4da(objid) {
    if (!isdefined(objid)) {
        objid = 15;
    } else if (objid > 14) {
        /#
            assertmsg("br_keypad_util::playerSetKeypadObjectiveId - objID [" + objid + "], we can't encode an objective id higher then 15");
        #/
        return;
    }
    playersetomnvarkeypad(3, objid);
}

// Namespace namespace_79db0c04d014c4f/namespace_45000ddf531a339c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f9
// Size: 0x40
function function_5392765d56bf59ea(var_44c8e3d2260da815) {
    if (!isdefined(var_44c8e3d2260da815)) {
        var_44c8e3d2260da815 = 3;
    } else if (var_44c8e3d2260da815 > 14) {
        /#
            assertmsg("br_keypad_util::playerSetKeypadAttemptsRemaining - attemptsRemaining [" + var_44c8e3d2260da815 + "], we can't encode an attempts remaining value higher than 15");
        #/
        return;
    }
    playersetomnvarkeypad(4, var_44c8e3d2260da815);
}

// Namespace namespace_79db0c04d014c4f/namespace_45000ddf531a339c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x340
// Size: 0x119
function function_b751dd55c6c31d6d(var_6f6d810585c7349b, var_fa0f2d5aeb7a3af9, objid) {
    var_2e3292ed32077253 = 0;
    if (!isdefined(objid)) {
        objid = 15;
    } else if (objid >= 15) {
        /#
            assertmsg("br_kaypad_util::playerSetKeypadKnownDigits - objID [" + objid + "], we can't encode an objective id higher then '" + 15 + "'");
        #/
        return;
    }
    shift = 0;
    var_2e3292ed32077253 = var_2e3292ed32077253 | objid << shift;
    i = 0;
    foreach (digit in var_6f6d810585c7349b) {
        shift = i * 4 + 4;
        if (i < var_fa0f2d5aeb7a3af9) {
            var_2e3292ed32077253 = var_2e3292ed32077253 | digit << shift;
        } else {
            var_2e3292ed32077253 = var_2e3292ed32077253 | 10 << shift;
        }
        i++;
    }
    while (i < 4) {
        shift = i * 4 + 4;
        var_2e3292ed32077253 = var_2e3292ed32077253 | 15 << shift;
        i++;
    }
    self setclientomnvar("ui_vault_code_known_digits", int(var_2e3292ed32077253));
}

// Namespace namespace_79db0c04d014c4f/namespace_45000ddf531a339c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x460
// Size: 0x7f
function playersetomnvarkeypad(var_ac85b79dfc4e45c6, value) {
    /#
        assert(isplayer(self));
    #/
    var_57acadc40b2f0a8 = getkeypadomnvarbitpackinginfo(var_ac85b79dfc4e45c6, value);
    value = var_57acadc40b2f0a8[3];
    var_8e90fa6d5789ad63 = var_57acadc40b2f0a8[2];
    var_8534515023afc188 = var_57acadc40b2f0a8[1];
    var_64571e3aeccd1a07 = var_57acadc40b2f0a8[0];
    if (var_8e90fa6d5789ad63 == "") {
        return;
    }
    playerpackdataintoomnvar(var_8e90fa6d5789ad63, value, var_64571e3aeccd1a07, var_8534515023afc188);
}

// Namespace namespace_79db0c04d014c4f/namespace_45000ddf531a339c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e6
// Size: 0x1a5
function getkeypadomnvarbitpackinginfo(var_ac85b79dfc4e45c6, value) {
    var_64571e3aeccd1a07 = 0;
    var_8534515023afc188 = 0;
    var_8e90fa6d5789ad63 = "";
    switch (var_ac85b79dfc4e45c6) {
    case 0:
        var_57acbdc40b2f2db = [0:0, 1:2];
        var_8534515023afc188 = var_57acbdc40b2f2db[1];
        var_64571e3aeccd1a07 = var_57acbdc40b2f2db[0];
        var_8e90fa6d5789ad63 = "ui_keypad_data";
        break;
    case 1:
        var_57ad0dc40b2fdda = [0:2, 1:4];
        var_8534515023afc188 = var_57ad0dc40b2fdda[1];
        var_64571e3aeccd1a07 = var_57ad0dc40b2fdda[0];
        var_8e90fa6d5789ad63 = "ui_keypad_data";
        break;
    case 2:
        var_57ad1dc40b3000d = [0:6, 1:4];
        var_8534515023afc188 = var_57ad1dc40b3000d[1];
        var_64571e3aeccd1a07 = var_57ad1dc40b3000d[0];
        var_8e90fa6d5789ad63 = "ui_keypad_data";
        break;
    case 3:
        var_57acedc40b2f974 = [0:10, 1:8];
        var_8534515023afc188 = var_57acedc40b2f974[1];
        var_64571e3aeccd1a07 = var_57acedc40b2f974[0];
        var_8e90fa6d5789ad63 = "ui_keypad_data";
        break;
    case 4:
        var_57acfdc40b2fba7 = [0:18, 1:4];
        var_8534515023afc188 = var_57acfdc40b2fba7[1];
        var_64571e3aeccd1a07 = var_57acfdc40b2fba7[0];
        var_8e90fa6d5789ad63 = "ui_keypad_data";
        break;
    default:
        /#
            assertmsg("Unknown player info '" + var_ac85b79dfc4e45c6 + "' requested for packing into keypad omnvar!");
        #/
        break;
    }
    return [0:var_64571e3aeccd1a07, 1:var_8534515023afc188, 2:var_8e90fa6d5789ad63, 3:value];
}

// Namespace namespace_79db0c04d014c4f/namespace_45000ddf531a339c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x693
// Size: 0xa1
function playerpackdataintoomnvar(var_8e90fa6d5789ad63, value, var_64571e3aeccd1a07, var_8534515023afc188) {
    mask = int(pow(2, var_8534515023afc188)) - 1;
    var_a463992091f1d483 = (value & mask) << var_64571e3aeccd1a07;
    var_f8f977081d3da8b4 = ~(mask << var_64571e3aeccd1a07);
    var_ee27f3f198276535 = self getclientomnvar(var_8e90fa6d5789ad63);
    var_ed711aeaf5e8cb76 = var_ee27f3f198276535 & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = var_ed711aeaf5e8cb76 + var_a463992091f1d483;
    if (var_82a90e56e416fa55 != var_ee27f3f198276535) {
        self setclientomnvar(var_8e90fa6d5789ad63, var_82a90e56e416fa55);
    }
}

// Namespace namespace_79db0c04d014c4f/namespace_45000ddf531a339c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73b
// Size: 0x5e
function playerunpackdatafromomnvar(var_8e90fa6d5789ad63, var_c20319aa0598dc14, var_7214adeafee0fc1b) {
    var_ee27f3f198276535 = self getclientomnvar(var_8e90fa6d5789ad63);
    var_81829a47d6020a = (1 << var_7214adeafee0fc1b) - 1;
    bitarray = var_ee27f3f198276535 >> var_c20319aa0598dc14;
    var_f94e3b11a17a0398 = var_81829a47d6020a & bitarray;
    return var_f94e3b11a17a0398;
}

