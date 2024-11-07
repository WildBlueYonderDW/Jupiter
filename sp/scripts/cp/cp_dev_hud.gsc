#using scripts\cp\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_3342d1008f574a0;

// Namespace namespace_3342d1008f574a0 / scripts\cp\cp_dev_hud
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb
// Size: 0x29f
function init_dev_hud() {
    if (istrue(level.dev_debug_menus)) {
        return;
    }
    level.dev_debug_menus = 1;
    level.hudelems = [];
    level.hudelem_count = 16;
    stroffsetx = [];
    stroffsety = [];
    stroffsetx[0] = 0;
    stroffsety[0] = 0;
    stroffsetx[1] = 1;
    stroffsety[1] = 1;
    stroffsetx[2] = -2;
    stroffsety[2] = 1;
    stroffsetx[3] = 1;
    stroffsety[3] = -1;
    stroffsetx[4] = -2;
    stroffsety[4] = -1;
    level.cleartextmarker = newhudelem();
    level.cleartextmarker.alpha = 0;
    level.cleartextmarker.archived = 0;
    /#
        level.cleartextmarker setdevtext("<dev string:x1c>");
    #/
    for (i = 0; i < level.hudelem_count; i++) {
        var_9af634fe97c006f5 = [];
        for (p = 0; p < 1; p++) {
            newstr = newhudelem();
            newstr.alignx = "left";
            newstr.aligny = "middle";
            newstr.archived = 0;
            newstr.location = 0;
            newstr.foreground = 1;
            newstr.fontscale = 0.75;
            newstr.sort = 20 - p;
            newstr.alpha = 1;
            newstr.x = -70 + stroffsetx[p];
            newstr.y = 30 + stroffsety[p] + i * 10;
            if (p > 0) {
                newstr.color = (0, 0, 0);
            }
            var_9af634fe97c006f5[var_9af634fe97c006f5.size] = newstr;
        }
        level.hudelems[i] = var_9af634fe97c006f5;
    }
    hud = newhudelem();
    hud.archived = 0;
    hud.alignx = "center";
    hud.location = 0;
    hud.foreground = 1;
    hud.fontscale = 1.4;
    hud.sort = 20;
    hud.alpha = 1;
    hud.x = 320;
    hud.y = 40;
    level.centerprint = hud;
}

// Namespace namespace_3342d1008f574a0 / scripts\cp\cp_dev_hud
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x462
// Size: 0x347
function highlight_current_selection(player, array) {
    player notify("highlight_current_selection");
    player endon("highlight_current_selection");
    player endon("disconnect");
    level endon("game_ended");
    if (!isdefined(level.slot)) {
        level.slot = 0;
    }
    if (!isdefined(level.slot_cap)) {
        level.slot_cap = 14;
    }
    setdvar(@"hash_6c42f3a33b28799a", "");
    player notifyonplayercommand("B", "+stance");
    player notifyonplayercommand("LT", "+speed_throw");
    player notifyonplayercommand("A", "+goStand");
    player notifyonplayercommand("X", "+usereload");
    player notifyonplayercommand("X", "+activate");
    player notifyonplayercommand("RS", "+melee_zoom");
    player notifyonplayercommand("LS", "+breath_sprint");
    player notifyonplayercommand("RT", "+attack");
    player notifyonplayercommand("RB", "+frag");
    player notifyonplayercommand("LB", "+smoke");
    player notifyonplayercommand("Y", "+weapnext");
    player notifyonplayercommand("UP", "+actionslot 1");
    player notifyonplayercommand("DOWN", "+actionslot 2");
    player notifyonplayercommand("LEFT", "+actionslot 3");
    player notifyonplayercommand("RIGHT", "+actionslot 4");
    player notifyonplayercommand("BACK", "+focus");
    player notifyonplayercommand("START", "pause");
    level thread show_selection_menu(level.slot, array);
    while (true) {
        result = player waittill_any_in_array_return(["A", "B", "Y", "X", "LB", "RB", "RT", "LT", "RS", "LS", "UP", "DOWN", "LEFT", "RIGHT", "BACK"]);
        if (!isdefined(result)) {
            continue;
        }
        switch (result) {
        case #"hash_311062bc01bdbb25":
        case #"hash_311077bc01bddc34":
            clear_hud_elements();
            return;
        case #"hash_31105fbc01bdb66c":
            clear_hud_elements();
            return level.menu_current_selection;
        case #"hash_1e6e35d002e26a35":
            level.slot++;
            level.slot = math::wrap(0, array.size - 1, level.slot);
            thread show_selection_menu(level.slot, array);
            break;
        case #"hash_faa298f6bdc36b00":
            level.slot--;
            level.slot = math::wrap(0, array.size - 1, level.slot);
            thread show_selection_menu(level.slot, array);
            break;
        case #"hash_a946b3072fef3225":
            break;
        case #"hash_10db13ff19b27ed0":
            break;
        }
    }
}

// Namespace namespace_3342d1008f574a0 / scripts\cp\cp_dev_hud
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7b1
// Size: 0x169
function show_selection_menu(slot, array) {
    clear_hud_elements();
    temp_array = [];
    end = clamp(array.size, 0, level.slot_cap);
    array_size = array.size - 1;
    slot_index = math::wrap(0, array_size, slot);
    var_6c8d6baddac11ccc = array[slot_index];
    cap = min(level.slot_cap, array.size);
    var_71117b214db6d5a2 = int(cap / 2);
    current_index = slot - var_71117b214db6d5a2;
    current_index = math::wrap(0, array_size, current_index);
    for (i = 0; i < cap; i++) {
        if (!isdefined(array[current_index])) {
            continue;
        }
        temp_array[temp_array.size] = array[current_index];
        current_index++;
        current_index = math::wrap(0, array_size, current_index);
    }
    for (i = 0; i < temp_array.size; i++) {
        var_88dfa55bd16575e = temp_array[i];
        if (i == var_71117b214db6d5a2) {
            level.menu_current_selection = var_88dfa55bd16575e;
            var_88dfa55bd16575e = "->" + var_88dfa55bd16575e;
            color = (1, 1, 0);
        } else {
            color = (1, 1, 1);
        }
        set_hud_element(var_88dfa55bd16575e, color);
    }
}

// Namespace namespace_3342d1008f574a0 / scripts\cp\cp_dev_hud
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x922
// Size: 0x97
function set_hud_element(text, color) {
    for (p = 0; p < 1; p++) {
        /#
            level.hudelems[level.placementhudelements][p] setdevtext(text);
        #/
        if (isdefined(color)) {
            level.hudelems[level.placementhudelements][p].color = color;
        }
    }
    level.placementhudelements++;
    assert(level.placementhudelements <= level.hudelem_count);
}

// Namespace namespace_3342d1008f574a0 / scripts\cp\cp_dev_hud
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c1
// Size: 0x94
function clear_hud_elements() {
    level.cleartextmarker clearalltextafterhudelem();
    for (i = 0; i < level.hudelem_count; i++) {
        for (p = 0; p < 1; p++) {
            /#
                level.hudelems[i][p] setdevtext("<dev string:x23>");
            #/
            level.hudelems[i][p].color = (1, 1, 1);
        }
    }
    level.placementhudelements = 0;
}

