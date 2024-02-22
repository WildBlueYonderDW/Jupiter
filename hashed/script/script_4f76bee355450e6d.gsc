// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;

#namespace namespace_62dd9dc92ab04572;

// Namespace namespace_62dd9dc92ab04572/namespace_10ca308be68952f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e
// Size: 0x250
function function_69b64f047b0af1db(var_68bb2de3cc200341, var_3a842702009f7b21, var_ac5cd1591b80858c, var_5de4f98ae7344556, var_6db2247925c2b26d, var_866f6164c6af9dad) {
    event = function_c74368899713e7e6();
    event.var_68bb2de3cc200341 = var_68bb2de3cc200341;
    event.var_6f78dda98ef53f62 = var_68bb2de3cc200341 * var_68bb2de3cc200341;
    event.var_3a842702009f7b21 = var_3a842702009f7b21;
    event.var_ac5cd1591b80858c = var_ac5cd1591b80858c;
    event.var_f6355cddb69c209d = var_ac5cd1591b80858c * var_ac5cd1591b80858c;
    event.var_5de4f98ae7344556 = var_5de4f98ae7344556;
    event.var_6db2247925c2b26d = var_6db2247925c2b26d;
    event.var_e74daab0a4853d7e = var_6db2247925c2b26d * var_6db2247925c2b26d;
    event.var_866f6164c6af9dad = var_866f6164c6af9dad;
    event.result = [];
    var_3c91684198954c83 = self.mind.var_3c91684198954c83;
    var_3c91684198954c83.var_a8d1793197306629 = event;
    var_3c91684198954c83.events[var_3c91684198954c83.events.size] = event;
    if (!isdefined(level.mind.events.var_7603e82423679fc0)) {
        var_eb018172d4fec728 = [];
        var_6cad4dc90cf3c50 = [];
        foreach (itemname, itemtype in level.br_pickups.br_itemtype) {
            if (itemtype == #"tablet") {
                var_eb018172d4fec728[var_eb018172d4fec728.size] = itemname;
            } else if (itemtype == #"cache") {
                var_6cad4dc90cf3c50[var_6cad4dc90cf3c50.size] = itemname;
            }
        }
        level.mind.events.var_7603e82423679fc0 = spawnstruct();
        level.mind.events.var_7603e82423679fc0.var_eb018172d4fec728 = var_eb018172d4fec728;
        level.mind.events.var_7603e82423679fc0.var_6cad4dc90cf3c50 = var_6cad4dc90cf3c50;
    }
}

// Namespace namespace_62dd9dc92ab04572/namespace_10ca308be68952f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e5
// Size: 0x139
function function_7e7ddfa33eff2c11() {
    event = self.mind.var_3c91684198954c83.var_a8d1793197306629;
    if (!event.var_d0942e9d2044d6c6) {
        if (event.result.size > 0) {
            event.result = [];
        }
        function_d416963635dbedfd(event, self.origin, event.var_68bb2de3cc200341, event.var_3a842702009f7b21, undefined, &function_dc0241948a20b580);
        function_d416963635dbedfd(event, self.origin, event.var_ac5cd1591b80858c, event.var_5de4f98ae7344556, level.mind.events.var_7603e82423679fc0.var_6cad4dc90cf3c50);
        function_d416963635dbedfd(event, self.origin, event.var_6db2247925c2b26d, event.var_866f6164c6af9dad, level.mind.events.var_7603e82423679fc0.var_eb018172d4fec728);
        event.var_d0942e9d2044d6c6 = 1;
    }
    return event.result;
}

// Namespace namespace_62dd9dc92ab04572/namespace_10ca308be68952f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x426
// Size: 0x18a
function function_d416963635dbedfd(event, var_ddf4dd8ad690d592, radius, num, var_ad4d0cf3e8c9c2a6, checkfunc) {
    var_7603e82423679fc0 = getlootscriptablearrayinradius(var_ad4d0cf3e8c9c2a6, undefined, var_ddf4dd8ad690d592, radius);
    var_a0d21fdd38f60ecf = event.result.size;
    foreach (loot in var_7603e82423679fc0) {
        if (event.result.size - var_a0d21fdd38f60ecf >= num) {
            break;
        }
        if (!isdefined(loot.model) || isdefined(loot.itemsdropped) || istrue(loot.var_2a6f82a735950253)) {
            continue;
        }
        if (isdefined(checkfunc) && ![[ checkfunc ]](loot)) {
            continue;
        }
        var_5577636292591c8b = level.br_pickups.br_itemtype[loot.type];
        idx = event.result.size;
        event.result[idx] = spawnstruct();
        event.result[idx].entity = loot;
        event.result[idx].type = var_5577636292591c8b;
    }
}

// Namespace namespace_62dd9dc92ab04572/namespace_10ca308be68952f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b7
// Size: 0x5e
function function_dc0241948a20b580(loot) {
    var_5577636292591c8b = level.br_pickups.br_itemtype[loot.type];
    if (!isdefined(var_5577636292591c8b)) {
        return 0;
    }
    if (var_5577636292591c8b == #"cache" || var_5577636292591c8b == #"tablet") {
        return 0;
    }
    return 1;
}

