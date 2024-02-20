// mwiii decomp prototype
#namespace namespace_1e6379efa55bf4c9;

// Namespace namespace_1e6379efa55bf4c9/namespace_538a390c2d92e94a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf7
// Size: 0xc0
function function_689bd8ae264f0531(var_649f9b194df395cd) {
    if (!isdefined(level.br_armory_kiosk)) {
        return undefined;
    }
    var_3681b432675353b = undefined;
    foreach (item in level.br_armory_kiosk.items) {
        if (item.cost < var_3681b432675353b.cost || !isdefined(var_3681b432675353b)) {
            if (isdefined(var_649f9b194df395cd) && var_649f9b194df395cd && item.cost == 0) {
                continue;
            }
            var_3681b432675353b = item;
        }
    }
    return var_3681b432675353b;
}

// Namespace namespace_1e6379efa55bf4c9/namespace_538a390c2d92e94a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf
// Size: 0x7d
function function_380dfd54b395ec1b(var_2ce272546e3ae7f0) {
    if (!isdefined(self)) {
        return undefined;
    }
    foreach (item in self.items) {
        if (item.var_2ce272546e3ae7f0 == var_2ce272546e3ae7f0) {
            return item.cost;
        }
    }
    return undefined;
}

// Namespace namespace_1e6379efa55bf4c9/namespace_538a390c2d92e94a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244
// Size: 0x5b
function function_cd83759e21f3ff42(callback) {
    self endon("death");
    self endon("disconnect");
    while (1) {
        class = channel = self waittill("luinotifyserver");
        if (channel == "buy_menu_option_selected" || channel == "buy_menu_open") {
            self [[ callback ]]();
            return;
        }
    }
}

// Namespace namespace_1e6379efa55bf4c9/namespace_538a390c2d92e94a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a6
// Size: 0x7f
function function_b40f17685dbcc4e6(callback) {
    self endon("death");
    self endon("disconnect");
    while (1) {
        class = channel = self waittill("luinotifyserver");
        if (channel == "br_cancel_purchase") {
            self [[ callback ]]();
            return;
        }
        if (channel == "br_item_purchase" || channel == "br_loadout_purchase") {
            if (getdvarint(@"hash_ed6e4ffa933af621", 0) == 0) {
                self [[ callback ]]();
                return;
            }
        }
    }
}

// Namespace namespace_1e6379efa55bf4c9/namespace_538a390c2d92e94a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x32c
// Size: 0xb2
function function_dadee81d5ce668bd(callback, var_d24af1a0b7bc04d) {
    self endon("death");
    self endon("disconnect");
    while (1) {
        class = channel = self waittill("luinotifyserver");
        if (channel == "br_item_purchase" || channel == "br_loadout_purchase" || channel == "br_team_revive") {
            itemdata = level.br_armory_kiosk.items[class];
            if (isdefined(var_d24af1a0b7bc04d)) {
                if (isdefined(itemdata) && itemdata.ref == var_d24af1a0b7bc04d) {
                    self [[ callback ]]();
                    return;
                }
            } else {
                self [[ callback ]]();
                return;
            }
        }
    }
}

// Namespace namespace_1e6379efa55bf4c9/namespace_538a390c2d92e94a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5
// Size: 0x90
function function_4bfc467c67d38fe0(callback, var_8e87a15650c9e63f) {
    self endon("death");
    self endon("disconnect");
    itemindex = 0;
    if (isdefined(var_8e87a15650c9e63f)) {
        itemindex = level.br_armory_kiosk function_f7826c1d489e51e(var_8e87a15650c9e63f);
    }
    while (1) {
        id = channel = self waittill("luinotifyserver");
        if (channel == "buy_menu_option_selected") {
            if (isdefined(var_8e87a15650c9e63f)) {
                if (itemindex == id) {
                    self [[ callback ]]();
                    return;
                }
            } else {
                self [[ callback ]]();
                return;
            }
        }
        waitframe();
    }
}

// Namespace namespace_1e6379efa55bf4c9/namespace_538a390c2d92e94a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c
// Size: 0x58
function function_759d3ef2d52c3723(callback, var_d24af1a0b7bc04d) {
    self endon("death");
    self endon("disconnect");
    while (1) {
        class = channel = self waittill("luinotifyserver");
        if (channel == "br_team_revive") {
            self [[ callback ]]();
            return;
        }
    }
}

// Namespace namespace_1e6379efa55bf4c9/namespace_538a390c2d92e94a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4db
// Size: 0x51
function function_f7826c1d489e51e(var_cb325ddb4a764623) {
    if (!isdefined(self)) {
        return undefined;
    }
    for (index = 0; index < self.items.size; index++) {
        if (self.items[index].var_2ce272546e3ae7f0 == var_cb325ddb4a764623) {
            return index;
        }
    }
    return undefined;
}

