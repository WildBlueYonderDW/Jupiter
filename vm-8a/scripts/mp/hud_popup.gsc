#namespace hud_popup;

// Namespace hud_popup / scripts\mp\hud_popup
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf
// Size: 0xc
function init() {
    level.var_ace3e1c42c4a94d7 = [];
}

// Namespace hud_popup / scripts\mp\hud_popup
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3
// Size: 0x87
function function_65336cc44771776e(ref) {
    assert(isplayer(self));
    popupid = function_bec00f5eabdb65ea(ref);
    if (!isdefined(popupid) || popupid < 0) {
        assertmsg("getInfoPopupId() called for ref \"" + ref + "\" but could not find it in " + function_92b0a87f4e1a1d72());
        return;
    }
    self setclientomnvar("ui_player_popup_id", popupid);
    self.lastpopuptime = gettime();
    self.var_942b501d544b0e0a = ref;
    /#
        debugpopup(popupid);
    #/
}

// Namespace hud_popup / scripts\mp\hud_popup
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172
// Size: 0x71
function function_233461f36bb50ef9(ref) {
    assert(isplayer(self));
    if (isdefined(ref)) {
        popupid = function_bec00f5eabdb65ea(ref);
        if (self getclientomnvar("ui_player_popup_id") != popupid) {
            return;
        }
    }
    self setclientomnvar("ui_player_popup_id", -1);
    /#
        if (getdvarint(@"hash_e2743b22a86111f", 1) == 1) {
            level notify("<dev string:x1c>");
        }
    #/
}

// Namespace hud_popup / scripts\mp\hud_popup
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb
// Size: 0x43
function function_bec00f5eabdb65ea(popupref) {
    id = level.var_ace3e1c42c4a94d7[popupref];
    if (!isdefined(id)) {
        id = tablelookuprownum(function_92b0a87f4e1a1d72(), 0, popupref);
        level.var_ace3e1c42c4a94d7[popupref] = id;
    }
    return id;
}

// Namespace hud_popup / scripts\mp\hud_popup
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237
// Size: 0x15
function function_92b0a87f4e1a1d72() {
    return getdvar(@"hash_db7ab5886366dcda", "mp/infoPopupTable.csv");
}

/#

    // Namespace hud_popup / scripts\mp\hud_popup
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x255
    // Size: 0xe0
    function function_9b5e6384b2ba7ad8(popuptitle, popupdesc, popuptier, popupindex) {
        level endon("<dev string:x2d>");
        level notify("<dev string:x1c>");
        level endon("<dev string:x1c>");
        var_b20c3f89f6901d7b = 6;
        starttime = gettime();
        while (gettime() - starttime < var_b20c3f89f6901d7b * 1000) {
            printtoscreen2d(750, 400, popuptitle, (1, 0, 0), 3);
            printtoscreen2d(750, 475, popupdesc, (1, 0, 0), 3);
            printtoscreen2d(750, 550, popuptier, (1, 0, 0), 3);
            printtoscreen2d(850, 550, popupindex, (1, 0, 0), 3);
            waitframe();
        }
    }

    // Namespace hud_popup / scripts\mp\hud_popup
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x33d
    // Size: 0x9e
    function debugpopup(id) {
        if (getdvarint(@"hash_e2743b22a86111f", 0) == 0) {
            return;
        }
        if (isbot(self)) {
            return;
        }
        popuptitle = tablelookupbyrow(function_92b0a87f4e1a1d72(), id, 1);
        popupdesc = tablelookupbyrow(function_92b0a87f4e1a1d72(), id, 2);
        popuptier = tablelookupbyrow(function_92b0a87f4e1a1d72(), id, 4);
        popupindex = tablelookupbyrow(function_92b0a87f4e1a1d72(), id, 5);
        level thread function_9b5e6384b2ba7ad8(popuptitle, popupdesc, popuptier, popupindex);
    }

#/
