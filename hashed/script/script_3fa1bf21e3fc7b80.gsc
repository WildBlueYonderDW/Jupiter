// mwiii decomp prototype
#namespace namespace_dc672ba0a64bcddf;

// Namespace namespace_dc672ba0a64bcddf/namespace_3fe5772ba4970d56
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf
// Size: 0xd
function init() {
    level.var_ace3e1c42c4a94d7 = [];
}

// Namespace namespace_dc672ba0a64bcddf/namespace_3fe5772ba4970d56
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3
// Size: 0x88
function function_65336cc44771776e(ref) {
    /#
        assert(isplayer(self));
    #/
    var_2c811aa33890f124 = function_bec00f5eabdb65ea(ref);
    if (!isdefined(var_2c811aa33890f124) || var_2c811aa33890f124 < 0) {
        /#
            assertmsg("getInfoPopupId() called for ref "" + ref + "" but could not find it in " + function_92b0a87f4e1a1d72());
        #/
        return;
    }
    self setclientomnvar("ui_player_popup_id", var_2c811aa33890f124);
    self.var_453b42f68499e7fc = gettime();
    self.var_942b501d544b0e0a = ref;
    /#
        function_fa5256a39e1b9726(var_2c811aa33890f124);
    #/
}

// Namespace namespace_dc672ba0a64bcddf/namespace_3fe5772ba4970d56
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172
// Size: 0x72
function function_233461f36bb50ef9(ref) {
    /#
        assert(isplayer(self));
    #/
    if (isdefined(ref)) {
        var_2c811aa33890f124 = function_bec00f5eabdb65ea(ref);
        if (self getclientomnvar("ui_player_popup_id") != var_2c811aa33890f124) {
            return;
        }
    }
    self setclientomnvar("ui_player_popup_id", -1);
    /#
        if (getdvarint(@"hash_e2743b22a86111f", 1) == 1) {
            level notify("<unknown string>");
        }
    #/
}

// Namespace namespace_dc672ba0a64bcddf/namespace_3fe5772ba4970d56
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb
// Size: 0x44
function function_bec00f5eabdb65ea(var_3df399f484f486b6) {
    id = level.var_ace3e1c42c4a94d7[var_3df399f484f486b6];
    if (!isdefined(id)) {
        id = tablelookuprownum(function_92b0a87f4e1a1d72(), 0, var_3df399f484f486b6);
        level.var_ace3e1c42c4a94d7[var_3df399f484f486b6] = id;
    }
    return id;
}

// Namespace namespace_dc672ba0a64bcddf/namespace_3fe5772ba4970d56
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237
// Size: 0x16
function function_92b0a87f4e1a1d72() {
    return getdvar(@"hash_db7ab5886366dcda", "mp/infoPopupTable.csv");
}

// Namespace namespace_dc672ba0a64bcddf/namespace_3fe5772ba4970d56
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x255
// Size: 0xe1
function function_9b5e6384b2ba7ad8(var_4f4aebbf94c352bd, var_77b4ef6d1a8b82bc, var_3b905af1557747f5, var_5b731facff912347) {
    /#
        level endon("<unknown string>");
        level notify("<unknown string>");
        level endon("<unknown string>");
        var_b20c3f89f6901d7b = 6;
        starttime = gettime();
        while (gettime() - starttime < var_b20c3f89f6901d7b * 1000) {
            printtoscreen2d(750, 400, var_4f4aebbf94c352bd, (1, 0, 0), 3);
            printtoscreen2d(750, 475, var_77b4ef6d1a8b82bc, (1, 0, 0), 3);
            printtoscreen2d(750, 550, var_3b905af1557747f5, (1, 0, 0), 3);
            printtoscreen2d(850, 550, var_5b731facff912347, (1, 0, 0), 3);
            waitframe();
        }
    #/
}

// Namespace namespace_dc672ba0a64bcddf/namespace_3fe5772ba4970d56
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33d
// Size: 0x9f
function function_fa5256a39e1b9726(id) {
    /#
        if (getdvarint(@"hash_e2743b22a86111f", 0) == 0) {
            return;
        }
        if (isbot(self)) {
            return;
        }
        var_4f4aebbf94c352bd = tablelookupbyrow(function_92b0a87f4e1a1d72(), id, 1);
        var_77b4ef6d1a8b82bc = tablelookupbyrow(function_92b0a87f4e1a1d72(), id, 2);
        var_3b905af1557747f5 = tablelookupbyrow(function_92b0a87f4e1a1d72(), id, 4);
        var_5b731facff912347 = tablelookupbyrow(function_92b0a87f4e1a1d72(), id, 5);
        level thread function_9b5e6384b2ba7ad8(var_4f4aebbf94c352bd, var_77b4ef6d1a8b82bc, var_3b905af1557747f5, var_5b731facff912347);
    #/
}

