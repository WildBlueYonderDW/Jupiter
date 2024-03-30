// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;

#namespace namespace_62dd9dc92ab04572;

// Namespace namespace_62dd9dc92ab04572 / namespace_10ca308be68952f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e
// Size: 0x250
function createevent(lootradius, lootnum, boxradius, boxnum, contractradius, contractnum) {
    event = function_c74368899713e7e6();
    event.lootradius = lootradius;
    event.var_6f78dda98ef53f62 = lootradius * lootradius;
    event.lootnum = lootnum;
    event.boxradius = boxradius;
    event.var_f6355cddb69c209d = boxradius * boxradius;
    event.boxnum = boxnum;
    event.contractradius = contractradius;
    event.var_e74daab0a4853d7e = contractradius * contractradius;
    event.contractnum = contractnum;
    event.result = [];
    eventstream = self.mind.eventstream;
    eventstream.var_a8d1793197306629 = event;
    eventstream.events[eventstream.events.size] = event;
    if (!isdefined(level.mind.events.loots)) {
        var_eb018172d4fec728 = [];
        var_6cad4dc90cf3c50 = [];
        foreach (itemname, itemtype in level.br_pickups.br_itemtype) {
            if (itemtype == #"tablet") {
                var_eb018172d4fec728[var_eb018172d4fec728.size] = itemname;
                continue;
            }
            if (itemtype == #"cache") {
                var_6cad4dc90cf3c50[var_6cad4dc90cf3c50.size] = itemname;
            }
        }
        level.mind.events.loots = spawnstruct();
        level.mind.events.loots.var_eb018172d4fec728 = var_eb018172d4fec728;
        level.mind.events.loots.var_6cad4dc90cf3c50 = var_6cad4dc90cf3c50;
    }
}

// Namespace namespace_62dd9dc92ab04572 / namespace_10ca308be68952f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e5
// Size: 0x139
function getevent() {
    event = self.mind.eventstream.var_a8d1793197306629;
    if (!event.evaluated) {
        if (event.result.size > 0) {
            event.result = [];
        }
        getloot(event, self.origin, event.lootradius, event.lootnum, undefined, &function_dc0241948a20b580);
        getloot(event, self.origin, event.boxradius, event.boxnum, level.mind.events.loots.var_6cad4dc90cf3c50);
        getloot(event, self.origin, event.contractradius, event.contractnum, level.mind.events.loots.var_eb018172d4fec728);
        event.evaluated = 1;
    }
    return event.result;
}

// Namespace namespace_62dd9dc92ab04572 / namespace_10ca308be68952f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x426
// Size: 0x18a
function getloot(event, centre, radius, num, itemnames, checkfunc) {
    loots = getlootscriptablearrayinradius(itemnames, undefined, centre, radius);
    currentsize = event.result.size;
    foreach (loot in loots) {
        if (event.result.size - currentsize >= num) {
            break;
        }
        if (!isdefined(loot.model) || isdefined(loot.itemsdropped) || istrue(loot.var_2a6f82a735950253)) {
            continue;
        }
        if (isdefined(checkfunc) && ![[ checkfunc ]](loot)) {
            continue;
        }
        loottype = level.br_pickups.br_itemtype[loot.type];
        idx = event.result.size;
        event.result[idx] = spawnstruct();
        event.result[idx].entity = loot;
        event.result[idx].type = loottype;
    }
}

// Namespace namespace_62dd9dc92ab04572 / namespace_10ca308be68952f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b7
// Size: 0x5e
function function_dc0241948a20b580(loot) {
    loottype = level.br_pickups.br_itemtype[loot.type];
    if (!isdefined(loottype)) {
        return false;
    }
    if (loottype == #"cache" || loottype == #"tablet") {
        return false;
    }
    return true;
}

